#!/bin/bash
  # // Exporint IP AddressInformation
export IP=$( curl -sS ipinfo.io/ip )

# // Clear Data
clear
clear && clear && clear
clear;clear;clear

  # // Banner
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "  Welcome To NewBie Project Script Installer ${YELLOW}(${NC}${green} Stable Edition ${NC}${YELLOW})${NC}"
echo -e "     This Will Quick Setup VPN Server On Your Server"
echo -e "         Auther : ${green}RizkiHdyt ${NC}${YELLOW}(${NC} ${green}Geo Project ${NC}${YELLOW})${NC}"
echo -e "       © Recode By Geo Project ${YELLOW}(${NC} 2023 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo ""

# // Checking Os Architecture
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
    echo -e "${OK} Your Architecture Is Supported ( ${green}$( uname -m )${NC} )"
else
    echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
    exit 1
fi

# // Checking System
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
    echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
    exit 1
fi

# // IP Address Validating
if [[ $IP == "" ]]; then
    echo -e "${EROR} IP Address ( ${YELLOW}Not Detected${NC} )"
else
    echo -e "${OK} IP Address ( ${green}$IP${NC} )"
fi

# // Validate Successfull
echo ""
read -p "$( echo -e "Press ${GRAY}[ ${NC}${green}Enter${NC} ${GRAY}]${NC} For Starting Installation") "
echo ""
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Version sc
VERSIONSC () {
    GEOVPN=V3.0
    IZINVERSION=$(curl https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ip | grep $MYIP | awk '{print $6}')
    if [ $GEOVPN = $IZINVERSION ]; then
    echo -e "\e[32mReady for script installation version 3.0 (websocket)..\e[0m"
    else
    echo -e "\e[31mYou do not have permission to install script version 3.0 !\e[0m"
    exit 0
fi
}
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ip | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
	VERSIONSC
    else
    echo -e "\e[31mScript Anda Telah Expired !!\e[0m";
    echo -e "\e[31mTolong Renew Script di  @RizkiHdyt99\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ip | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPERMISSION ACCEPT...\e[0m"
sleep 3
VALIDITY
clear
else
clear
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "                PERMISSION DENIED ! "
echo -e "     Your VPS ${NC}( ${green}$IP${NC} ) ${YELLOW}Has been Banned "
echo -e "         Buy access permissions for scripts "
echo -e "                 Contact Admin :"
echo -e "             ${green}Telegram t.me/RizkiHdyt99 "
echo -e "             WhatsApp wa.me/085871027196"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
rm -f main.sh
exit 0
fi
clear
echo -e "\e[32mloading...\e[0m"
clear
####
start=$(date +%s)
secs_to_human() {
    echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}

clear
REPO="https://raw.githubusercontent.com/rizkihdyt6/newbieproject/main/"
wget -O /usr/sbin/badvpn "${REPO}badvpn/badvpn" >/dev/null 2>&1
chmod +x /usr/sbin/badvpn > /dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn1.service "${REPO}badvpn/badvpn1.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn2.service "${REPO}badvpn/badvpn2.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn3.service "${REPO}badvpn/badvpn3.service" >/dev/null 2>&1
systemctl disable badvpn1 
systemctl stop badvpn1 
systemctl enable badvpn1
systemctl start badvpn1 
systemctl disable badvpn2 
systemctl stop badvpn2 
systemctl enable badvpn2
systemctl start badvpn2 
systemctl disable badvpn3 
systemctl stop badvpn3 
systemctl enable badvpn3
systemctl start badvpn3 
