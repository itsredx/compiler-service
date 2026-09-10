// ── Nizam & Mantiq Cloud Run Compiler Service ─────────────────────────
// Stateless HTTP microservice for on-the-fly compilation to wasm32-wasi

const express = require("express");
const cors = require("cors");
const { execFile } = require("child_process");
const fs = require("fs");
const path = require("path");
const crypto = require("crypto");
const os = require("os");

const app = express();
const PORT = process.env.PORT || 8080;
const COMPILER_DIR = path.resolve(__dirname);

app.use(cors());
app.use(express.json({ limit: "2mb" }));

// ── Health Check ──────────────────────────────────────────────────────
app.get("/", (req, res) => {
  res.json({
    service: "nizam-compiler-service",
    status: "ok",
    target: "wasm32-wasi",
    version: "0.1.0"
  });
});

app.get("/health", (req, res) => {
  res.status(200).send("OK");
});

// ── Compile Endpoint ──────────────────────────────────────────────────
app.post("/compile", async (req, res) => {
  const { code, lang, filename } = req.body || {};
  if (!code || typeof code !== "string" || code.trim().length === 0) {
    return res.status(400).json({ success: false, error: "Source code is required." });
  }

  const isMantiq = (lang && lang.toLowerCase() === "mantiq") ||
                   (filename && filename.endsWith(".mq")) ||
                   code.includes("class ") ||
                   code.includes("interface ") ||
                   code.includes("extends ");

  const ext = isMantiq ? ".mq" : ".nz";
  const id = crypto.randomUUID();
  const srcPath = path.join(os.tmpdir(), `input_${id}${ext}`);
  const outPath = path.join(os.tmpdir(), `out_${id}.wasm`);

  try {
    await fs.promises.writeFile(srcPath, code, "utf-8");

    const nizamBin = process.env.NIZAM_BIN || (fs.existsSync("/usr/local/bin/nizam") ? "/usr/local/bin/nizam" : path.join(COMPILER_DIR, "bin/nizam"));
    const compilerArgs = [
      "build",
      srcPath,
      "-o", outPath,
      "--target", "wasm32-wasi",
      "--lib-dir", path.join(COMPILER_DIR, "mantiq")
    ];

    const { stdout, stderr } = await new Promise((resolve, reject) => {
      execFile(nizamBin, compilerArgs, {
        cwd: COMPILER_DIR,
        timeout: 20000,
        maxBuffer: 10 * 1024 * 1024
      }, (err, out, errOut) => {
        if (err) {
          reject({ err, stdout: out || "", stderr: errOut || "" });
        } else {
          resolve({ stdout: out || "", stderr: errOut || "" });
        }
      });
    });

    if (fs.existsSync(outPath)) {
      const wasmBytes = await fs.promises.readFile(outPath);
      res.status(200).json({
        success: true,
        lang: isMantiq ? "mantiq" : "nizam",
        filename: `user_code${ext}`,
        wasmBase64: wasmBytes.toString("base64"),
        compilerOutput: (stdout + (stderr ? "\n" + stderr : "")).trim()
      });
    } else {
      res.status(200).json({
        success: false,
        error: stderr || stdout || "Compilation produced no output binary."
      });
    }

  } catch (error) {
    const rawOut = (error.stderr || error.stdout || error.err?.message || error.message || "").toString();
    console.error("[COMPILER ERROR]", rawOut);
    res.status(200).json({
      success: false,
      lang: isMantiq ? "mantiq" : "nizam",
      filename: `user_code${ext}`,
      error: rawOut || "Compilation failed."
    });
  } finally {
    // ── Scratch Artifacts Cleanup ─────────────────────────────────────
    try { await fs.promises.unlink(srcPath); } catch (_) {}
    try { await fs.promises.unlink(outPath); } catch (_) {}
    try { await fs.promises.unlink(`${outPath}.ll`); } catch (_) {}
  }
});

// ── Server Listener ───────────────────────────────────────────────────
app.listen(PORT, "0.0.0.0", () => {
  console.log(`[Nizam Compiler Service] Listening on port ${PORT}`);
});
