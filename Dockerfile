FROM oven/bun:1

WORKDIR /app

COPY . .

RUN bun install

ENV HOST=0.0.0.0
ENV PORT=8080
ENV NODE_ENV=production

EXPOSE 8080

CMD ["bun", "start"]
