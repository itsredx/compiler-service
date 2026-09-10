# ── Nizam & Mantiq Cloud Run Compiler Container ───────────────────────
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install curl, archive tools, ca-certificates, and Node.js 20 LTS
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    xz-utils \
    ca-certificates \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Zig 0.12.0 (Pinned version matching Nizam compiler WASM target flags)
ARG ZIG_VERSION=0.12.0
RUN curl -fsSL https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz \
    | tar -xJ -C /opt && ln -s /opt/zig-linux-x86_64-${ZIG_VERSION}/zig /usr/local/bin/zig

# Set persistent Zig cache directory
ENV ZIG_GLOBAL_CACHE_DIR=/opt/zig_cache
ENV ZIG_LOCAL_CACHE_DIR=/opt/zig_cache

WORKDIR /app

# Install native Nizam compiler binary and Tree-Sitter shared library
COPY bin/nizam /usr/local/bin/nizam
COPY bin/libtree-sitter-mantiq.so /usr/local/lib/libtree-sitter-mantiq.so
RUN chmod +x /usr/local/bin/nizam && ldconfig

# Install NPM dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy compiler pipeline assets and runtime
COPY mantiq/runtime.c ./mantiq/
COPY mantiq/libtree-sitter-mantiq.a ./mantiq/
COPY mantiq/std/ ./mantiq/std/
COPY server.js ./

# Pre-compile Zig WASI libc and runtime C objects into cache during build
# This prevents out-of-memory (OOM) on 512MB RAM free-tier runtime instances
RUN mkdir -p /opt/zig_cache && \
    echo 'int main(){return 0;}' > /tmp/warm.c && \
    zig cc -target wasm32-wasi -Wl,-z,stack-size=16777216 /tmp/warm.c /app/mantiq/runtime.c -o /tmp/warm.wasm && \
    rm -f /tmp/warm.* && \
    chmod -R 777 /opt/zig_cache

# Set environment
ENV PORT=8080
ENV NODE_ENV=production
EXPOSE 8080

CMD ["node", "server.js"]
