FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Update và cài tools (BỎ ttyd ra khỏi apt)
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    kali-linux-default \
    nmap sqlmap nikto hydra \
    metasploit-framework \
    john hashcat \
    aircrack-ng \
    wireshark-common tcpdump \
    wordlists \
    exploitdb \
    curl wget git vim nano \
    net-tools dnsutils iputils-ping \
    build-essential \
    python3 python3-pip python3-dev \
    openssh-client \
    tmux screen \
    supervisor \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download và cài ttyd từ GitHub
RUN wget -q 
