#!/bin/bash
#
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/hostname='OpenWrt'/hostname='NanoPi-NEO2'/g" package/base-files/files/bin/config_generate
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/set system.@system\[-1\].timezone='UTC'/set system.@system\[-1\].timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/set system.@system\[-1\].timezone/i\		set system.@system\[-1\].zonename='Asia\/Shanghai'" package/base-files/files/bin/config_generate
sed -i "s/set network.globals.ula_prefix='auto'/set network.globals.ula_prefix='fd00::\/48'/g" package/base-files/files/bin/config_generate
sed -i '/list listen_http	0.0.0.0:80/a\	list listen_http	0.0.0.0:8000' package/network/services/uhttpd/files/uhttpd.config
sed -i '/list listen_http	\[::\]:80/a\	list listen_http	\[::\]:8000' package/network/services/uhttpd/files/uhttpd.config
sed -i '/list listen_https	0.0.0.0:443/a\	list listen_https	0.0.0.0:8443' package/network/services/uhttpd/files/uhttpd.config
sed -i '/list listen_https	\[::\]:443/a\	list listen_https	\[::\]:8443' package/network/services/uhttpd/files/uhttpd.config
echo babdb03da9eaf51104cf4e516c8f1478>$GITHUB_WORKSPACE/openwrt/.vermagic
sed -i 's/grep.*vermagic/cp $(TOPDIR)\/.vermagic $(LINUX_DIR)\/.vermagic/g' include/kernel-defaults.mk
#
sed -i 's/REJECT/ACCEPT/g' package/network/config/firewall/files/firewall.config
sed -i 's/	option masq		1/	option masq		0/g' package/network/config/firewall/files/firewall.config
sed -i 's/	option mtu_fix		1/	option mtu_fix		0/g' package/network/config/firewall/files/firewall.config
mkdir -p ./package/network/config/firewall4/files/
cp ./package/network/config/firewall/files/firewall.config ./package/network/config/firewall4/files/firewall.config
sed -i "/define Package\/firewall4\/install/i\		\$(INSTALL_CONF) \.\/files\/firewall\.config \$(1)\/etc\/config\/firewall" package/network/config/firewall4/Makefile
sed -i "/define Package\/firewall4\/install/i\		\$(INSTALL_DIR) \$(1)\/etc\/config\/" package/network/config/firewall4/Makefile
#
# sed -i 's/static/dhcp/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i 's/ucidef_set_interface_lan \"eth0\"/ucidef_set_interface_wan \"eth0\"/g' target/linux/sunxi/base-files/etc/board.d/02_network
