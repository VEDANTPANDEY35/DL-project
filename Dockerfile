FROM python:3.9-slim

WORKDIR /app

# Install dependencies FIRST (important for caching)
RUN pip install --upgrade pip && \
    pip install --no-cache-dir --default-timeout=1000 \
    numpy \
    pandas \
    tensorflow \
    keras \
    jupyter

# Do NOT rely on COPY for live updates (but keep it for first build)
COPY . /app

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]