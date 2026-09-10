# Nizam & Mantiq Google Cloud Run Compiler Service

This service containerizes the Nizam self-hosted compiler (`stage4/nizam.wasm`), WASI runtime bridge (`nizam_wasi.js`), Zig `0.12.0` toolchain, and Mantiq standard libraries into a container designed for **Google Cloud Run**.

## Architecture

```
User (Browser) ──► Vercel (Edge CDN) ──(POST /api/compile)──► Google Cloud Run
                      │
                      └── Serves Static HTML/JS & Precompiled WASM (0ms compile)
```

- **Scale to Zero**: Cloud Run scales down to 0 instances when no compilation requests arrive, costing $0.00 within Google Cloud's generous free tier.
- **Fast Scratch Space**: Builds write to memory `/tmp` and clean up immediately.
- **Zig Toolchain**: Packaged with Zig 0.12.0 for wasm32-wasi linking.

---

## Local Development & Docker Testing

### 1. Build the Docker Image (from repository root)

```bash
docker build -f compiler-service/Dockerfile -t nizam-compiler .
```

### 2. Run the Container

```bash
docker run -p 8080:8080 nizam-compiler
```

### 3. Test Compilation via cURL

```bash
curl -s -X POST http://localhost:8080/compile \
  -H "Content-Type: application/json" \
  -d '{"code":"extern fn printf(f as cstr, ...) as i32\nfn main() as i32:\n    let _ = printf(\"Hello from Cloud Run!\\n\" to cstr)\n    return 0\n"}'
```

---

## Deploying to Google Cloud Run

### Option A: Using Google Cloud CLI (`gcloud`)

```bash
# 1. Authenticate and select project
gcloud auth login
gcloud config set project YOUR_GCP_PROJECT_ID

# 2. Build and submit container image
gcloud builds submit --config=cloudbuild.yaml .
# Or directly deploy source:
gcloud run deploy nizam-compiler \
  --source . \
  --region us-central1 \
  --platform managed \
  --allow-unauthenticated \
  --memory 2Gi \
  --cpu 2 \
  --min-instances 0 \
  --max-instances 10
```

### Option B: Using Google Cloud Console (GUI)

1. Open **Google Cloud Console** > **Cloud Run** > **Create Service**.
2. Service name: `nizam-compiler`.
3. Select **Continuously deploy from a repository** (point to your GitHub repo) with Dockerfile path `compiler-service/Dockerfile`.
4. Authentication: Select **Allow unauthenticated invocations**.
5. Container configuration:
   - **Memory**: 1 GiB or 2 GiB
   - **CPU**: 1 or 2 vCPUs
   - **Minimum instances**: 0 (scale-to-zero)
   - **Maximum instances**: 10
6. Click **Create** and copy your service URL (e.g. `https://nizam-compiler-abc123-uc.a.run.app`).

---

## Connecting Vercel to Cloud Run

Update `playground/vercel.json`:

```json
{
  "rewrites": [
    {
      "source": "/api/compile",
      "destination": "https://YOUR_CLOUD_RUN_SERVICE_URL/compile"
    }
  ]
}
```

Now any visitor compiling custom code on your Vercel site will automatically route through Cloud Run with zero CORS issues!
# compiler-service
