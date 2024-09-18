FROM python:3.10

# Install git if needed
RUN apt-get update && apt-get install -y git

# Upgrade pip and setuptools, and install PyYAML
RUN pip install --upgrade pip setuptools && \
    pip install PyYAML

# Copy the necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
