FROM python:3-slim

WORKDIR /app

COPY python_packages.list ./
RUN pip install --no-cache-dir -r python_packages.list

COPY example.py ./

CMD [ "python", "./example.py" ]
