#!/bin/bash

# Update tools
apt-get update > /dev/null 2>&1

# Start web terminal
ttyd -p 10000 -W bash
