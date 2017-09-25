#!/bin/bash

# Network speed test
# References:
# Sizes for Windows virtual machines in Azure https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes

# You should change the machine size
azureregion=eastus2
vmsize=Standard_DS5_v2

az group create \
--name SpeedTestRG \
--location $azureregion

az network vnet create \
--name SpeedTestVNet \
--resource-group SpeedTestRG \
--address-prefix 10.0.4.0/24 \
--subnet-name default \
--subnet-prefix 10.0.4.0/24

az vm availability-set create \
--name SpeedTestAvailSet \
--resource-group SpeedTestRG \
--platform-fault-domain-count 2 \
--platform-update-domain-count 2

az network nsg create \
--resource-group SpeedTestRG \
--name SpeedTestNSG \

az network nsg rule create \
--resource-group SpeedTestRG \
--nsg-name SpeedTestNSG  \
--name ssh-rule \
--access Allow \
--protocol Tcp \
--direction Inbound \
--priority 1000 \
--source-address-prefix "*" \
--source-port-range "*" \
--destination-address-prefix "*" \
--destination-port-range 22

az network vnet subnet update \
--vnet-name SpeedTestVNet \
--name default \
--resource-group SpeedTestRG \
--network-security-group SpeedTestNSG 

az vm create \
--name Machine01 \
--resource-group SpeedTestRG  \
--availability-set SpeedTestAvailSet \
--image UbuntuLTS \
--size $vmsize \
--vnet-name SpeedTestVNet \
--subnet default \
--admin-username speedtestuser \
--admin-password MySecer123Pass \
--nsg SpeedTestNSG

az vm create \
--name Machine02 \
--resource-group SpeedTestRG  \
--availability-set SpeedTestAvailSet \
--image UbuntuLTS \
--size $vmsize \
--vnet-name SpeedTestVNet \
--subnet default \
--admin-username speedtestuser \
--admin-password MySecer123Pass \
--nsg SpeedTestNSG