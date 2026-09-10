# Nizam & Mantiq Compiler Microservice

High-performance containerized compilation backend for the **Nizam & Mantiq WebAssembly Studio**. Serves on-the-fly compilation for `.nz` and `.mq` source code targeting `wasm32-wasi` with an ultra-lean memory footprint optimized for free container tiers (Render, Google Cloud Run).

---

## 1. Architecture & 96% Memory Reduction

```
Browser (Playground UI)
       │
       ▼ (Edge CDN / Instant WASI Execution)
 Vercel (100% Static Site) ───► Serves HTML, CSS, studio.js & precompiled .wasm
       │
       ▼ POST /api/compile (Reverse Proxy)
 Render / Cloud Run Container (Linux x86-64)
       │
       ├─► Express HTTP Microservice (~35MB RAM)
       ├─► Native Linux 'nizam' ELF Executable (~10MB RAM)
       ├─► Pre-warmed Zig 0.12.0 Toolchain (~76MB RAM)
       └─► Returns Base64 .wasm binary in < 0.5s (Peak RSS: ~41MB)
```

### The OOM Problem in Virtualized WASI Runtimes
In early prototypes, compilation was executed using `stage4/nizam.wasm` running inside Node.js's experimental `wasi` preview1 runtime:
- Node.js allocated **444MB** in anonymous V8 isolate memory arenas and JIT code buffers.
- When `nizam.wasm` invoked the linker (`zig cc`) via `child_process.execSync()`, Linux's `fork()` duplicated the parent process's memory space.
- Peak cgroup memory reached **1,007 MB**, instantly triggering kernel Out-Of-Memory (`OOMKilled`) termination on 512MB free tier containers (Render, Cloud Run).

### The Native Compiler Solution
- **Native Binary Execution:** Replaced the WASI-in-Node simulator with the native Linux x86-64 ELF `nizam` binary and `libtree-sitter-mantiq.so` bundled in `bin/`.
- **System Linker Registration:** Installed `nizam` into `/usr/local/bin` and registered the shared library in `/usr/local/lib` via `ldconfig`.
- **Pre-warmed Toolchain Cache:** Configured `ZIG_GLOBAL_CACHE_DIR=/opt/zig_cache` and pre-compiled the WASI libc, compiler-rt, and `runtime.c` during the Docker image build stage (where 4GB build RAM is available).
- **Direct Child Process Execution:** `server.js` invokes `nizam` directly via `execFile()`, completely eliminating V8 memory duplication.

### Performance & Memory Metrics

| Metric | Node WASI Simulator | Native Nizam Binary | Improvement |
| :--- | :--- | :--- | :--- |
| **Peak Memory (RSS)** | **1,007 MB** (OOM Crash) | **41 MB** | **96% Memory Reduction** |
| **Compilation Latency** | ~6.0 seconds | **~0.4 seconds** | **15x Faster** |
| **512MB Tier Stability** | ❌ 100% Failure Rate (SIGKILL) | ✅ **100% Stable (< 10% RAM used)** | Production Ready |

---

## 2. API Reference

### Health Check: `GET /` or `GET /health`
```json
{
  "service": "nizam-compiler-service",
  "status": "ok",
  "target": "wasm32-wasi",
  "version": "0.1.0"
}
```

### Compile Code: `POST /compile`
* **Request Body:**
  ```json
  {
    "lang": "nizam",
    "code": "extern fn printf(f as cstr, ...) as i32\nfn main() as i32:\n    let _ = printf(\"Hello WASI!\\n\" to cstr)\n    return 0\n"
  }
  ```
* **Success Response (HTTP 200):**
  ```json
  {
    "success": true,
    "lang": "nizam",
    "filename": "user_code.nz",
    "wasmBase64": "AGFzbQEAAAAB...",
    "compilerOutput": "Successfully compiled input.nz -> out.wasm"
  }
  ```
* **Compilation Error Response (HTTP 200):**
  ```json
  {
    "success": false,
    "lang": "nizam",
    "filename": "user_code.nz",
    "error": "Error [E0101]: undeclared variable at Line 3, Column 5"
  }
  ```

---

## 3. Local Docker Development

### Build Image
```bash
docker build -t nizam-compiler -f Dockerfile .
```

### Run Container
```bash
docker run -p 8080:8080 nizam-compiler
```

### Test Compile
```bash
curl -s -X POST http://localhost:8080/compile \
  -H "Content-Type: application/json" \
  -d '{"code":"extern fn printf(f as cstr, ...) as i32\nfn main() as i32:\n    let _ = printf(\"Local Container Test!\\n\" to cstr)\n    return 0\n"}'
```

---

## 4. Production Deployment

### Deploying to Render (Free Web Service)
1. Push this repository to GitHub (`git@github.com:itsredx/compiler-service.git`).
2. In Render Dashboard, click **New +** > **Web Service**.
3. Connect your GitHub repository.
4. Select environment: **Docker**.
5. Select plan: **Free** (512MB RAM).
6. Render will automatically build the image, pre-warm the Zig cache, and bind to `$PORT`.

### Deploying to Google Cloud Run
```bash
# Build and deploy directly from source
gcloud run deploy nizam-compiler \
  --source . \
  --region us-central1 \
  --platform managed \
  --allow-unauthenticated \
  --memory 512Mi \
  --cpu 1 \
  --min-instances 0 \
  --max-instances 5
```

---

## 5. Connecting to Vercel Playground

Update `playground/vercel.json` to reverse-proxy `/api/compile` to your live compiler service URL:
```json
{
  "rewrites": [
    {
      "source": "/api/compile",
      "destination": "https://compiler-service-uve5.onrender.com/compile"
    }
  ]
}
```
All custom compiler requests will transparently proxy across edge CDNs with zero CORS issues!
