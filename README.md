# Azure-VM-Network-Bandwidth
Determine the network bandwidth of an Azure VM.

Lots of customers want to know the bandwidth of an Azure VM size and there is no published list.  With this test you can test the bandwidth of your VM to see the bandwidth.

# Step: Create the environment
You will need to create the following:
1. Two Azure VMs of the same size (in the same Azure region)
2. A VNET
3. An Availability Set (the VMs must be in one so they are close to one another in the data center)

## To Create the environemnt (Scripted)
1. Open a cloud shell in the portal
2. Type: wget https://raw.githubusercontent.com/AdamPaternostro/Azure-VM-Network-Bandwidth/master/createtest.sh
3. edit the file and change any parameters
3. chmod +x createtest.sh
4. ./createtest.sh

# Run the test

## Machine01
1. ssh into the machine (you can get the ssh connection from the portal)
2. type: wget https://raw.githubusercontent.com/AdamPaternostro/Azure-VM-Network-Bandwidth/master/runme.sh
3. chmod +x runme.sh
4. type ./runme.sh

## Machine02
1. ssh into the machine (you can get the ssh connection from the portal)
2. type: wget https://raw.githubusercontent.com/AdamPaternostro/Azure-VM-Network-Bandwidth/master/runme.sh
3. chmod +x runme.sh
4. type: /sbin/ifconfig
5. get the local IP address of the machine
![alt tag](https://raw.githubusercontent.com/AdamPaternostro/Azure-VM-Network-Bandwidth/master/images/GetIPAddress.png)
6. type: ntttcp -r -t 300  

## Machine01
5. type: ntttcp -s10.0.4.5 -t 300  
(NOTE: You might have to change the IP address of 10.0.4.5.  This has to be started AFTER the process on Machine02)


# Results for Standard_DS5_v2
![alt tag](https://raw.githubusercontent.com/AdamPaternostro/Azure-VM-Network-Bandwidth/master/images/SpeedResults.png)

# Delete your resources
az group delete --name SpeedTestRG

