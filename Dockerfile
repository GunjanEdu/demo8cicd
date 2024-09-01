FROM python:3.10

# Set environment variables
ENV PYTHONUNBUFFERED=1
ARG PORT=8000
ENV PORT=$PORT

# Install system dependencies (if any)
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies with verbose output
RUN pip install --no-cache-dir -r requirements.txt --verbose

# Expose the port
EXPOSE $PORT

# Define the default command
CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:$PORT", "app:app"]
