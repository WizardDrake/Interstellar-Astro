FROM oven/bun:1

WORKDIR /app

COPY package.json bun.lockb* ./
RUN bun install

COPY . .

# Build Astro without typechecking
RUN bunx astro build

ENV PORT=8080
ENV HOST=0.0.0.0
ENV FIRST=false
ENV NODE_ENV=production

EXPOSE 8080

CMD ["bun", "run", "index.ts"]
