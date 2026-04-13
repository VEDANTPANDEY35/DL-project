FROM python:3.9-slim

WORKDIR /app

COPY . /app

# Upgrade pip + increase timeout (VERY IMPORTANT)
RUN pip install --upgrade pip && \
    pip install --no-cache-dir --default-timeout=1000 \
    numpy \
    pandas \
    tensorflow \
    keras \
    jupyter

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]