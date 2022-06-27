#!/bin/bash
basepath=$(dirname $0)
cd ${basepath} && mkdir openwrt && mkdir openwrtbulid && cd openwrt
#curl -O
#chmod +x openwrt-auto.sh&&sh openwrt-auto.sh
################################################
Setenv(){
	openwrt="${basepath}/openwrt"
	openwrtbulid="${basepath}/openwrtbulid"
	REPO_URL=https://github.com/openwrt/openwrt.git
	REPO_TAG=v21.02.3
	FEEDS_CONF=${openwrtbulid}/hc5962/feeds.conf.default
	CONFIG_FILE=${openwrtbulid}/hc5962/hc5962a.config
	DIY_P1_SH=${openwrtbulid}/hc5962/diy-part1.sh
	DIY_P2_SH=${openwrtbulid}/hc5962/diy-part2.sh
}
################################################
Insenv(){
	sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
	sudo -E apt-get -qq update
	sudo -E apt-get -qq install $(curl -fsSL git.io/depends-ubuntu-2004)
	sudo -E apt-get -qq autoremove --purge
	sudo -E apt-get -qq clean
}
################################################
Clonecode(){
	# Clone source code
	git clone https://github.com/ZhangShuxiang/OpenWrt-HC5962.git ${openwrtbulid}
	git clone ${REPO_URL} -b ${REPO_TAG} ${openwrt}
}
################################################
Insfeed(){
	[ -e ${FEEDS_CONF} ] && mv ${FEEDS_CONF} ${openwrt}/feeds.conf.default
	cd ${openwrt} && chmod +x ${DIY_P1_SH} && sh ${DIY_P1_SH}
#-----------------------------------------------#
	# Update feeds
	cd ${openwrt} && ./scripts/feeds update -a
#-----------------------------------------------#
	# Install feeds
	cd ${openwrt} && ./scripts/feeds install -a
#-----------------------------------------------#
	[ -e ${CONFIG_FILE} ] && mv ${CONFIG_FILE} ${openwrt}/.config
	cd ${openwrt} && chmod +x ${DIY_P2_SH} && sh ${DIY_P2_SH}
}
################################################
Download(){
	# Download package
	cd ${openwrt}
	make menuconfig
	make defconfig
	make download
}
################################################
Compilefirmware(){
	# Compile the firmware
	cd ${openwrt}
	make
}
################################################
Setenv
Insenv
Clonecode
Insfeed
Download
$1
exit