FROM oven/bun:1

WORKDIR /app

COPY package.json bun.lockb* ./
RUN bun install

COPY . .

# build astro
RUN bunx astro build

ENV HOST=0.0.0.0
ENV PORT=8080
ENV NODE_ENV=production

EXPOSE 8080

CMD ["node", "dist/server/entry.mjs"]
