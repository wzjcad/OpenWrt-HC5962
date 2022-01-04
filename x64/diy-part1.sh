#!/bin/bash
#
# Add a feed source
# echo 'src-git openwrt-vlmcsd https://github.com/cokebar/openwrt-vlmcsd.git' >>feeds.conf.default
# echo 'src-git luci-app-vlmcsd https://github.com/cokebar/luci-app-vlmcsd.git' >>feeds.conf.default
git clone https://github.com/siwind/openwrt-vlmcsd.git package/vlmcsd
git clone https://github.com/siwind/luci-app-vlmcsd.git package/luci-app-vlmcsd
# git clone https://github.com/Wind4/vlmcsd.git package/vlmcsd
