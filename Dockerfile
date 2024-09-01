FROM python:3.7
COPY . /app
COPY . /requirements.txt
WORKDIR /app
RUN pip install --no-cache-dir -r requirement.txt
EXPOSE $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app