FROM python:3.10
COPY requirements.txt /app/requirements.txt
COPY . /app
WORKDIR /app
# Upgrade pip to the latest version
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt --verbose
EXPOSE $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app