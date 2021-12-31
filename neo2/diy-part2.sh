#!/bin/bash
#
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/set system.@system[-1].hostname='OpenWrt'/set system.@system[-1].hostname='NanoPI-NEO2'/g" package/base-files/files/bin/config_generate
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/'1.openwrt.pool.ntp.org'/'cn.ntp.org.cn'/g" package/base-files/files/bin/config_generate
#
sed -i 's/REJECT/ACCEPT/g' package/network/config/firewall/files/firewall.config
sed -i 's/static/dhcp/g' package/base-files/files/lib/functions/uci-defaults.sh
