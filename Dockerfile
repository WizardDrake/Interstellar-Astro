FROM oven/bun:1

WORKDIR /app

COPY package.json bun.lockb* ./
RUN bun install

COPY . .

# Build Astro ahead of time so runtime doesn't restart
RUN bun run build

ENV PORT=8080
ENV HOST=0.0.0.0
ENV NODE_ENV=production
ENV FIRST=false

EXPOSE 8080

CMD ["bun", "run", "index.ts"]
