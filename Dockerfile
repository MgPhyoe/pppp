FROM python:3.10-slim

WORKDIR /app

# Install system dependencies for OpenCV and ddddocr
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY bot.py .
COPY Procfile .

EXPOSE 8099

CMD ["/usr/bin/env", "python3", "bot.py"]
