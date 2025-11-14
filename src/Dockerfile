# Stage 1: Builder Stage

FROM python:3.8-slim AS builder

WORKDIR /dependencies

COPY . .

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config

# Stage 2: Runtime Stage

FROM gcr.io/distroless/base:nonroot AS runtime

WORKDIR /app

COPY --from=builder /dependencies .

EXPOSE 3000

CMD [ "python", "-m", "http.server", "3000" ]