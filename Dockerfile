FROM ubuntu:latest

# Update the package list and install necessary dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libyaml-dev \
    python3-dev

# Upgrade pip to the latest version to ensure compatibility
RUN pip3 install --upgrade pip

# Install PyYAML after upgrading pip
RUN pip3 install PyYAML

# Copy the Python script and entrypoint to the image
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the entrypoint.sh script
ENTRYPOINT ["/entrypoint.sh"]
