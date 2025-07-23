# Credit @VJ_Botz
# YouTube: @Tech_VJ
# Telegram: @KingVJ01

FROM python:3.10.8-slim-buster

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies required by ffmpeg, Pillow, yt-dlp, opencv etc.
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    wget \
    curl \
    build-essential \
    libgl1 \
    libglib2.0-0 \
    libjpeg-dev \
    zlib1g-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /VJ-FILTER-BOT

# Copy all project files including requirements.txt
COPY . .

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt

# Optional: install git repo if needed manually
# RUN git clone https://github.com/Joelkb/cinemagoer.git && cd cinemagoer && pip install .

# Run the bot
CMD ["python", "bot.py"]
