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
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git garypang13 https://github.com/garypang13/openwrt-packages' feeds.conf.default

# Other Packages
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/lean/passwall
#git clone https://github.com/kenzok8/litte.git package/lean/litte

# Add Kenzok8's Packages & Dependency
#git clone https://github.com/kenzok8/small.git
#git clone https://github.com/kenzok8/openwrt-packages.git

# Add Coolsnowwolf's Packages
#git clone --depth=1 https://github.com/coolsnowwolf/lede/tree/master/package/lean

#Add other packages
#git clone https://github.com/rufengsuixing/luci-app-onliner.git # Add luci-app-onliner
#git clone https://github.com/tindy2013/openwrt-subconverter.git # Add subconverter
#git clone https://github.com/zcy85611/Openwrt-Package.git # Add luci-udptools
#git clone https://github.com/destan19/OpenAppFilter.git # Add OpenAppFilter

# Add luci-theme-argon
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
#rm -rf ../lean/luci-theme-argon
