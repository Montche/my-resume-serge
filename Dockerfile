FROM cgr.dev/chainguard/python:latest

WORKDIR /app
RUN [ "/sbin/apk", "add", "--no-cache", "bash" ]
COPY . .
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

ENV FLASK_APP=app.py
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=80"]
