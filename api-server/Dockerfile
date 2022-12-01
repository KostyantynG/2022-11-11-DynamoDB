FROM python:3.7-slim

WORKDIR /api_server

COPY requirements.txt .

COPY src/main.py .

RUN pip install -r requirements.txt

EXPOSE 3000

CMD ["python3", "main.py"]