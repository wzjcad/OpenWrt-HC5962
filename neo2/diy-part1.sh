#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo src-git-full openwrt-vlmcsd https://github.com/cokebar/openwrt-vlmcsd.git^213bce995e5ce6af78fb923db1838c992b21950c >>feeds.conf.default
echo src-git-full luci-app-vlmcsd https://github.com/cokebar/luci-app-vlmcsd.git^7f9cd13ccc7d9b5c6483501f43973cd4a1a7c309 >>feeds.conf.default
