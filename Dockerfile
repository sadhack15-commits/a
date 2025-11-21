FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Cài đặt tools
RUN apt-get update && apt-get install -y \
    kali-linux-headless \
    nmap sqlmap nikto hydra \
    metasploit-framework \
    curl wget git vim nano \
    net-tools dnsutils iputils-ping \
    python3 python3-pip \
    ttyd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Cài Python tools
RUN pip3 install requests scapy impacket --break-system-packages

WORKDIR /root

EXPOSE 10000

CMD ["ttyd", "-p", "10000", "-W", "bash"]
