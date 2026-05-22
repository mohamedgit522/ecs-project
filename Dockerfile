# ── STAGE 1: Build ─────────────────────────────
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

# ── STAGE 2: Runtime ───────────────────────────
FROM node:20-alpine

WORKDIR /app

# Create non-root user for security
RUN addgroup -g 1001 nodejs && adduser -S -u 1001 -G nodejs appuser

# Copy built app from Stage 1
COPY --from=builder /app/build ./build

# Copy server file
COPY server.js ./

# Install Express locally
RUN npm install express

# Fix permissions so appuser can access the files
RUN chown -R appuser:nodejs /app

# Switch to non-root user
USER appuser

EXPOSE 3000

# Built-in health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require ('http').get('http://localhost:3000/health', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

CMD ["node", "server.js"]