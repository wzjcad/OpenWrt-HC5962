#!/bin/bash
#
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/'1.openwrt.pool.ntp.org'/'cn.ntp.org.cn'/g" package/base-files/files/bin/config_generate
#
#sed -i 's/htmode=HT20/htmode=HT40/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/wireless.radio${devidx}.disabled/a\			set wireless.radio${devidx}.cell_density=0' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/wireless.radio${devidx}.disabled/a\			set wireless.radio${devidx}.noscan=1' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/set wireless.default_radio${devidx}.encryption=none/set wireless.default_radio${devidx}.encryption=sae-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio${devidx}.encryption/a\			set wireless.default_radio${devidx}.key=56781234' package/kernel/mac80211/files/lib/wifi/mac80211.sh
