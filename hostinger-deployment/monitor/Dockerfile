FROM python:3.11-slim

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir \
    requests \
    pyyaml \
    schedule

# Copy application
COPY monitor.py /app/
COPY config.yml /app/

# Run monitor
CMD ["python", "-u", "monitor.py"]
