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
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed sources
#sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

# Add Kenzok8's Packages & Dependency
git clone --depth=1 https://github.com/kenzok8/small
git clone --depth=1 https://github.com/kenzok8/openwrt-packages

# Add Coolsnowwolf's Packages
git clone --depth=1 https://github.com/coolsnowwolf/lede/tree/master/package/lean

#Add packages
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner # Add luci-app-onliner
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter # Add subconverter
git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp # Add luci-udptools
git clone --depth=1 https://github.com/destan19/OpenAppFilter # Add OpenAppFilter

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon
