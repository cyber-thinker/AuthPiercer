# AuthPiercer
Deauthentication Tool Either for a specifc host on a network on the whole network
AuthPiercer Guideline

### Dependencies
1-Aircrack-ng package 
to install it (sudo apt-get install -y aircrack-ng)

2-wireshark
to install it (sudo apt-get install -y wireshark)

3-you need a wireless adapter that supports monitor mode

### How to run AuthPiercer
There is 2 ways:
Option1:
	-use the command 'sudo bash AuthPiercer.sh -i <interface> -m <MacAddress>
Option2:
	-chmod +x AuthPiercer.sh
	-sudo ./AuthPiercer.sh -i <interface> -m <MacAddress>

where the -i flag take the wireless adapter name as an argument you can find the name using the command (ifconfig)
and the -m take a macaddress as argument to change the mac address of the wireless adapter for more anonymousity
(I suggest you start the mac address with 00 example 00:AB:CD:38:EF:52 otherwise it may generate an error)

you can still use the -h switch to help you

### Explaining the functionality of AuthPiercer 
After running the script successfully (detecting the wireless adapter and entering a correct mac address)
you will be face by 2 choices:
	-target a specific host in a network
	-target the whole network ( however there is a downside the more hosts are connected the less accurate it can be)

### specific host in a network
-If you chose to target a specific host, in a network then AuthPiercer will start by scanning the nearby routers and networks.
-After finishing scanning , AuthPiercer will ask you to Enter the BSSID ( in other words the mac address of the router) of the target network.
-Then the tool will ask you about the channel the target router is transmitting on ( you can find it under the CH column)
-Here AuthPiercer will ask you if you want to save the packets in a file so later on to be analysed using wireshark ( press no if you already know the target mac Address)
-After Entering the file name, wireshark will automatically open the file and then you can start analyzing the hosts (you can identify your target by his device example "Apple,Samsung,Huawei,etc..."
-After analyzing the file,AuthPiercer will ask to enter the target MAC address, and how many deauth packets you want to send
-Now relax, the target is disconnected

### the whole network
-If you chose to target the whole network,AuthPiercer will aslo start by scanning the nearby routers and networks.
-After finishing scanning , AuthPiercer will ask you to Enter the BSSID ( in other words the mac address of the router) of the target network
-Authpiercer will ask you yo enter how many deauth packets you want to send

### Errors you may face ###
Certainly input errors like the name of the interface and the mac address

when scanning for a specific target the tool may not capture the mac address of the target because in the timeframe the scanning is going on, the target didn't send any packet to the router


### Contact ###
for any bug or help please contact me on cyb3r.think3r@gmail.com
