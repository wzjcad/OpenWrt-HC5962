#!/bin/bash
#echo '123456' | sudo -S dnf -y makecache
#echo '123456' | sudo -S dnf -y install openconnect
#echo '123456' | sudo -S openconnect server:port
#chmod +x openwrt-auto.sh&&bash openwrt-auto.sh
################################################
function Install {
	echo '123456' | sudo -S dnf -y makecache
	echo '123456' | sudo -S dnf -y install bash-completion bzip2 gcc gcc-c++ git make ncurses-devel patch rsync tar unzip wget which diffutils python3 perl-base perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Thread-Queue
}
################################################
function Setenv {
	openwrt="$HOME/openwrt"
	openwrtbulid="$HOME/openwrtbulid"
	#FEED_CONF=${openwrtbulid}/hc5962/feeds.conf.default
	#CONF_FILE=${openwrtbulid}/hc5962/hc5962a.config
	DIY_P1_SH=${openwrtbulid}/hc5962/diy-part1.sh
	DIY_P2_SH=${openwrtbulid}/hc5962/diy-part2.sh
}
################################################
function Clonecode {
	git clone https://github.com/ZhangShuxiang/OpenWrt-HC5962.git ${openwrtbulid}
	git clone https://github.com/openwrt/openwrt.git -b v21.02.3 ${openwrt}
}
################################################
function Insfeed {
	cd ${openwrt}
	[ -e ${FEED_CONF} ] && cp ${FEED_CONF} ${openwrt}/feeds.conf.default
	chmod +x ${DIY_P1_SH} && bash ${DIY_P1_SH}
#-----------------------------------------------#
	./scripts/feeds update -a
	./scripts/feeds install -a
#-----------------------------------------------#
	[ -e ${CONF_FILE} ] && cp ${CONF_FILE} ${openwrt}/.config
	chmod +x ${DIY_P2_SH} && bash ${DIY_P2_SH}
}
################################################
function Makemenu {
	cd ${openwrt}
	make menuconfig
	make defconfig
}
################################################
function Make {
	cd ${openwrt}
	make download
	make
}
################################################
Install
Setenv
Clonecode
Insfeed
Makemenu
$1
exit