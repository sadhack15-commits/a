#!/bin/bash

echo "================================================"
echo "🐧 KALI LINUX VPS - Starting..."
echo "================================================"

# Update time
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# Hiển thị thông tin
echo ""
echo "📊 System Info:"
echo "   OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
echo "   Kernel: $(uname -r)"
echo "   CPU: $(nproc) cores"
echo "   RAM: $(free -h | grep Mem | awk '{print $2}')"
echo ""

# Tạo welcome message
cat > /root/.bashrc << 'EOF'
echo ""
echo "╔═══════════════════════════════════════════════╗"
echo "║      🎯 KALI LINUX VPS - Ready to Hack       ║"
echo "╚═══════════════════════════════════════════════╝"
echo ""
echo "📁 Workspace: /root/workspace"
echo "🔧 Tools: /root/tools"
echo "📖 Wordlists: /root/wordlists"
echo ""
echo "⚡ Quick commands:"
echo "   nmap -sV <target>     # Port scan"
echo "   sqlmap -u <url>       # SQL injection"
echo "   msfconsole            # Metasploit"
echo ""
PS1='\[\033[01;31m\]root@vps\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

# Start web terminal
echo "🚀 Starting web terminal on port 10000..."
exec ttyd -p 10000 -W bash
