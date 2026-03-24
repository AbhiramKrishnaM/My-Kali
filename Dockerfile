# Base image: official Kali Linux rolling release
FROM kalilinux/kali-rolling

# Avoid interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Install kali-linux-default — the standard Kali toolset
# This includes: nmap, metasploit, burpsuite, wireshark, sqlmap, aircrack-ng, etc.
RUN apt-get install -y kali-linux-default

# Install extra useful tools for learning
RUN apt-get install -y \
    kali-tools-top10 \
    kali-tools-web \
    kali-tools-passwords \
    kali-tools-wireless \
    nmap \
    curl \
    wget \
    git \
    vim \
    nano \
    net-tools \
    iputils-ping \
    dnsutils \
    python3 \
    python3-pip \
    tmux \
    tree \
    man-db \
    bash-completion \
    sudo

# Clean up apt cache to keep image size smaller
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /root

# Default command: open an interactive bash shell
CMD ["/bin/bash"]
