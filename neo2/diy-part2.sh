#!/bin/bash
#
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/'1.openwrt.pool.ntp.org'/'cn.ntp.org.cn'/g" package/base-files/files/bin/config_generate
#
sed -i 's/REJECT/ACCEPT/g' package/network/config/firewall/files/firewall.config
sed -i "s/ucidef_set_interface_lan \"eth0\"/ucidef_set_interface_lan_wan \"eth0.1\" \"eth0\"/g" target/linux/sunxi/base-files/etc/board.d/02_network
