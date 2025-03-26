FROM python:3.11

RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install flask

COPY wcocr.cpython-311-aarch64-linux-gnu.so /app/wcocr.cpython-311-aarch64-linux-gnu.so

COPY wx /app/wx

COPY main.py /app/main.py
COPY templates /app/templates

WORKDIR /app

CMD ["python", "main.py"]