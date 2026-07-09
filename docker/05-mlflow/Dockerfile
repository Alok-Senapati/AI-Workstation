FROM ai-python:1.0.0

RUN python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:${PATH}"

RUN pip install --upgrade pip

RUN pip install \
    mlflow \
    psycopg2-binary

WORKDIR /workspace

EXPOSE 5000

CMD ["mlflow", "server"]