FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

# Update và cài tools đầy đủ
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
    ttyd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Cài Python security tools
RUN pip3 install --no-cache-dir --break-system-packages \
    requests beautifulsoup4 \
    scapy impacket pwntools \
    selenium python-nmap \
    colorama termcolor

# Cài thêm tools từ GitHub
RUN git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap && \
    git clone https://github.com/commixproject/commix.git /opt/commix

# Tạo thư mục làm việc
RUN mkdir -p /root/workspace /root/tools /root/wordlists

# Copy wordlists
RUN ln -s /usr/share/wordlists /root/wordlists/kali

# Supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /root/workspace

EXPOSE 10000 8080

# Startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
