FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Install tools
RUN apt-get update && apt-get install -y \
    kali-linux-headless \
    nmap sqlmap nikto hydra metasploit-framework \
    curl wget git vim nano \
    net-tools dnsutils iputils-ping \
    python3 python3-pip \
    ttyd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Workspace
WORKDIR /root

# Expose port
EXPOSE 10000

# Default command (sẽ bị override bởi Docker Command)
CMD ["ttyd", "-p", "10000", "-W", "bash"]
