FROM python:3.9
WORKDIR /app
COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt
COPY App.py .
COPY template/ ./template/
EXPOSE 5000
CMD ["python", "App.py"]