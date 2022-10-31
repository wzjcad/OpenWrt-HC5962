#!/bin/bash

# https://github.com/P3TERX/Actions-OpenWrt
# Add a feed source
# echo 'src-git openwrt-vlmcsd https://github.com/cokebar/openwrt-vlmcsd.git' >>feeds.conf.default
# echo 'src-git luci-app-vlmcsd https://github.com/cokebar/luci-app-vlmcsd.git' >>feeds.conf.default
# Add mtk driver
rm -rf $GITHUB_WORKSPACE/openwrt/target/linux/ramips/*
cp -r $GITHUB_WORKSPACE/immortalwrt/target/linux/ramips/. $GITHUB_WORKSPACE/openwrt/target/linux/ramips
sed -i '/KERNEL_TESTING_PATCHVER.*/d' $GITHUB_WORKSPACE/openwrt/target/linux/ramips/Makefile
