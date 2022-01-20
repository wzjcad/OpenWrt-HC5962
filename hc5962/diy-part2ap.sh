#!/bin/bash
#用此脚本编译出来是AP模式，系统密码是password，无线密码是56781234
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/hostname='OpenWrt'/hostname='HiWifi_$(cat \/sys\/class\/ieee80211\/${dev}\/macaddress\|awk -F \":\" '{print $4\"\"$5\"\"$6 }'\| tr a-z A-Z)'/g" package/base-files/files/bin/config_generate
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/set system.@system\[-1\].timezone='UTC'/set system.@system\[-1\].timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/set system.@system\[-1\].timezone/i\		set system.@system\[-1\].zonename='Asia\/Shanghai'" package/base-files/files/bin/config_generate
#
#sed -i 's/htmode=HT20/htmode=HT40/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/wireless.radio${devidx}.disabled/a\			set wireless.radio${devidx}.cell_density=0' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/wireless.radio${devidx}.disabled/a\			set wireless.radio${devidx}.noscan=1' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/set wireless.default_radio${devidx}.encryption=none/set wireless.default_radio${devidx}.encryption=sae-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio${devidx}.encryption/a\			set wireless.default_radio${devidx}.key=56781234' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#
sed -i 's/REJECT/ACCEPT/g' package/network/config/firewall/files/firewall.config
sed -i 's/static/dhcp/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i "s/ucidef_set_interfaces_lan_wan \"lan1 lan2 lan3\" \"wan\"/ucidef_set_interfaces_lan \"lan1 lan2 lan3 wan\"/g" target/linux/ramips/mt7621/base-files/etc/board.d/02_network
