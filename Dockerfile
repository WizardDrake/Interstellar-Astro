FROM oven/bun:1

WORKDIR /app

# install pnpm (some astro deps expect it)
RUN bun install -g pnpm

# copy dependency files first for caching
COPY package.json bun.lockb* pnpm-lock.yaml* ./

RUN bun install

# copy source
COPY . .

# build astro during image build (not runtime)
RUN bunx astro build

ENV HOST=0.0.0.0
ENV PORT=3000
ENV NODE_ENV=production

EXPOSE 3000

CMD ["bun", "run", "dist/server/entry.mjs"]
