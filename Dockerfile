# ── Nizam & Mantiq Cloud Run Compiler Container ───────────────────────
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install curl, archive tools, ca-certificates, and Node.js
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    xz-utils \
    ca-certificates \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install Zig 0.12.0 (Pinned version matching Nizam compiler WASM target flags)
ARG ZIG_VERSION=0.12.0
RUN curl -fsSL https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz \
    | tar -xJ -C /opt && ln -s /opt/zig-linux-x86_64-${ZIG_VERSION}/zig /usr/local/bin/zig

WORKDIR /app

# Install NPM dependencies
COPY compiler-service/package*.json ./
RUN npm install --omit=dev

# Copy compiler pipeline assets
COPY nizam_wasi.js ./
COPY stage4/nizam.wasm ./stage4/
COPY mantiq/runtime.c ./mantiq/
COPY mantiq/libtree-sitter-mantiq.a ./mantiq/
COPY mantiq/std/ ./mantiq/std/
COPY compiler-service/server.js ./

# Set environment
ENV PORT=8080
ENV NODE_ENV=production
EXPOSE 8080

CMD ["node", "server.js"]
