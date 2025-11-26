# # Stage 1: Builder Stage

FROM python:3.8-slim AS builder

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config

# Stage 2: Runtime Stage

FROM python:3.8-alpine AS runtime

WORKDIR /app

COPY --from=builder /app .

RUN addgroup --system group && adduser --system user

RUN chown -R user:group /app

USER user

EXPOSE 3000

CMD [ "python", "-m", "http.server", "3000" ]



#




