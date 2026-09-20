FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    python3-venv \
    git \
    curl \
    wget \
    ca-certificates \
    build-essential \
    pkg-config \
    ffmpeg \
    aria2 \
    qbittorrent-nox \
    rclone \
    p7zip-full \
    unzip \
    zip \
    unrar-free \
    mediainfo \
    libmagic1 \
    libmagic-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --break-system-packages --upgrade \
    pip \
    setuptools \
    wheel \
    uv

COPY requirements.txt .

RUN uv pip install \
    --system \
    --no-cache \
    -r requirements.txt

COPY . .

RUN chmod +x start.sh

ENTRYPOINT ["bash", "start.sh"]
