FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Install full Kali tools + SSH + Web terminal
RUN apt-get update && apt-get install -y \
    kali-linux-default \
    python3 python3-pip \
    openssh-server \
    ttyd \
    curl wget git vim nano \
    && apt-get clean

# Setup SSH
RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Install ttyd (web terminal tốt hơn)
RUN apt-get install -y ttyd

EXPOSE 10000

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
