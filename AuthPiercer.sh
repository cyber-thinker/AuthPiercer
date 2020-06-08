#!/bin/bash
#Script Created by Jad El Haber AKA Cyber-Thinker
function banner()
{
	 echo "+--------------------------------------------------+"
 	 printf "|       %-40s   |\n" "`date`"
 	 echo "|                AuthPiercer                       |"                         
	 echo "|           Script by  Cyber-Thinker               |"
  	 printf "|   `tput bold` %-40s `tput sgr0`     |" "$*"
  	 echo -e  "\n+--------------------------------------------------+"
}
function VerifyInterface()
{
	local inter=$1
	iwconfig $inter &>/dev/null
	case $? in
	0) echo -e "${yellow}[+]${nc} Wireless interface detected";;
	161) echo -e "${red}[-]${nc} sorry but this interface is not wireless"
		exit 161;;
	237) echo -e "${red}[-]${nc} sorry this interface does not exist"
		exit 237;;
	*)echo -e "${red}[-]${nc} Invalid input"
		exit 1;;
	esac
}
function sypnosis()
{
	echo "Sypnosis: sudo bash Authpiercer.sh -i #interface -m #MAC address | -h"
	echo "         -h			display the help menu"
	echo "         -i			specify the wireless adapter for the attack"
	echo "         -m			specify the Mac address to mask the interface with"
}
function VerifyMacAddress()
{
	local macad=$1
	if [[  "$macad" =~ ^([0-9a-fA-F]{2}[:-]){5}([0-9a-fA-F]{2})$ ]];then
		echo -e "${yellow}[+]${nc} valid mac address"
	else
		echo -e "${red}[-]${nc} Invalid mac address Exiting"
		exit 1
	fi
}
interface=""
mac=""
gray='\033[1;30m'
yellow='\033[1;33m'
red='\033[0;31m'
nc='\033[0m'
banner For Help Contact cyb3r.think3r@gmail.com
if [[ $# == 0 ]] ;then
	sypnosis
	exit 1
fi
if [[ $EUID != 0 ]];then
	echo -e "${red}[-] ${nc}permission required run as root (use sudo)"
	sypnosis
	exit 1
fi
while getopts ":hi:m:" arg; do
case $arg in
	i) interface=${OPTARG}
	   VerifyInterface $interface ;;
	m) mac=${OPTARG} 
	   VerifyMacAddress $mac;;
	h|*) sypnosis
	     exit 1 ;;
esac
done
shift $((OPTIND -1))
if [[ "$interface" == "" || "$mac" == "" ]];then
	echo -e "${red}[-]${nc} missing argument"
	exit 1
fi
ifconfig $interface down
macchanger -m $mac $interface
iwconfig $interface mode monitor
ifconfig $interface up
echo -e "${gray}[1]${nc} Disconnect a Specific Target in The Network"
echo -e "${gray}[2]${nc} Disconnect The whole Network (less accurate if there is too much host)"
echo -ne "${gray}[*]${nc}Enter your choice --> "
read choice
case $choice in
	1) source ./specific-attack.sh $interface ;;
	2) source ./general-attack.sh $interface ;;
	*) echo -e "${red}[-]${nc} Invalid Input"
	    exit 1 ;;
esac

 


