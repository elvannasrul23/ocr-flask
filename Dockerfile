# Base Image
FROM python:3.10-slim

# Install Tesseract OCR
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Workdir
WORKDIR /app

# Copy Requirements and Install Dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Application Files
COPY . .

# Set Environment Variables
ENV FLASK_ENV=production
ENV PORT=8080

# Expose Port
EXPOSE 8080

# Default Command
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "run:app"]
