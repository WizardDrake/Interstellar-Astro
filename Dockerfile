# Use Bun base image
FROM oven/bun:1.1

# Install pnpm
RUN bun install -g pnpm

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package.json bun.lockb* pnpm-lock.yaml* ./

# Install dependencies
RUN bun install

# Copy rest of project
COPY . .

# Build Astro (if project uses build step)
RUN bun run build || true

# Expose port (Astro + Fastify usually runs 3000)
EXPOSE 8080

# Start server
CMD ["bun", "start"]
