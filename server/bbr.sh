#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ipvps > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ipvps 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ipvps | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/rizkihdyt6/izinsc/main/ipvps | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

clear
GIT_CMD="https://github.com/errorcode86/bbrplus/raw/master/Debian9/x86_64/"
startbbr() {
    if [[ $(echo 4.14.129-bbrplus | awk -F'.' '{print $1}') -ge "5" ]]; then
	    echo "net.core.default_qdisc=cake" >> /etc/sysctl.conf
	    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
        echo "net.ipv4.icmp_echo_ignore_all = 0" >>/etc/sysctl.conf
        echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >>/etc/sysctl.conf
        echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >>/etc/sysctl.conf
        echo "fs.file-max = 1000000" >>/etc/sysctl.conf
        echo "fs.inotify.max_user_instances = 8192" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_tw_reuse = 1" >>/etc/sysctl.conf
        echo "net.ipv4.ip_local_port_range = 1024 65535" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_rmem = 16384 262144 8388608" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_wmem = 32768 524288 16777216" >>/etc/sysctl.conf
        echo "net.core.somaxconn = 8192" >>/etc/sysctl.conf
        echo "net.core.rmem_max = 16777216" >>/etc/sysctl.conf
        echo "net.core.wmem_max = 16777216" >>/etc/sysctl.conf
        echo "net.core.wmem_default = 2097152" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_max_tw_buckets = 5000" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_max_syn_backlog = 10240" >>/etc/sysctl.conf
        echo "net.core.netdev_max_backlog = 10240" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_slow_start_after_idle = 0" >>/etc/sysctl.conf
        echo "net.ipv4.ip_forward = 1" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_icmp_timeout=10" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_close=10" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_close_wait=10" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_established=600" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_fin_wait=10" >>/etc/sysctl.conf
    else
	    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
	    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
        echo "net.ipv4.icmp_echo_ignore_all = 0" >>/etc/sysctl.conf
        echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >>/etc/sysctl.conf
        echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >>/etc/sysctl.conf
        echo "fs.file-max = 1000000" >>/etc/sysctl.conf
        echo "fs.inotify.max_user_instances = 8192" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_tw_reuse = 1" >>/etc/sysctl.conf
        echo "net.ipv4.ip_local_port_range = 1024 65535" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_rmem = 16384 262144 8388608" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_wmem = 32768 524288 16777216" >>/etc/sysctl.conf
        echo "net.core.somaxconn = 8192" >>/etc/sysctl.conf
        echo "net.core.rmem_max = 16777216" >>/etc/sysctl.conf
        echo "net.core.wmem_max = 16777216" >>/etc/sysctl.conf
        echo "net.core.wmem_default = 2097152" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_max_tw_buckets = 5000" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_max_syn_backlog = 10240" >>/etc/sysctl.conf
        echo "net.core.netdev_max_backlog = 10240" >>/etc/sysctl.conf
        echo "net.ipv4.tcp_slow_start_after_idle = 0" >>/etc/sysctl.conf
        echo "net.ipv4.ip_forward = 1" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_max = 524288" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_icmp_timeout=10" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_close=10" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_close_wait=10" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_established=600" >>/etc/sysctl.conf
        echo "net.netfilter.nf_conntrack_tcp_timeout_fin_wait=10" >>/etc/sysctl.conf
    fi
}
installbbrplus(){
		cd /tmp
		wget -N --no-check-certificate https://github.com/UJX6N/bbrplus-5.15/releases/download/5.15.96-bbrplus/Debian-Ubuntu_Required_linux-image-5.15.96-bbrplus_5.15.96-bbrplus-1_amd64.deb \
        -O bbrplus_5.15.86_amd64.deb  >/dev/null 2>&1
		wget -N --no-check-certificate https://github.com/UJX6N/bbrplus-5.15/releases/download/5.15.96-bbrplus/Debian-Ubuntu_Optional_linux-headers-5.15.96-bbrplus_5.15.96-bbrplus-1_amd64.deb \
        -O bbrplus_5.15.86-headers_amd64.deb >/dev/null 2>&1
		dpkg -i bbrplus_5.15.96_amd64.deb >/dev/null 2>&1
		dpkg -i bbrplus_5.15.96-headers_amd64.deb >/dev/null 2>&1
}
installbbrplus
startbbr
