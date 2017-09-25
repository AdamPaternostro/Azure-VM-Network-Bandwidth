#!/bin/bash

# Network speed test
# References:
# Linux on distributions endorsed by Azure: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/endorsed-distros
# Bandwidth/Throughput testing (NTTTCP): https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-bandwidth-testing

git clone https://github.com/Microsoft/ntttcp-for-linux
cd ntttcp-for-linux/src
sudo apt-get -y install build-essential
sudo make && sudo make install
