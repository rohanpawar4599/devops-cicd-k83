# ---------- Builder Stage ----------
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir --upgrade pip \
    && python -m pip install --no-cache-dir --prefix=/install -r requirements.txt


# ---------- Runtime Stage ----------
FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /install /usr/local

COPY app.py .

RUN useradd --create-home appuser

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
