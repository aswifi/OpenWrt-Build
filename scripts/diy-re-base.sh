#!/bin/bash
#
# Copyright (c) 2019-2021 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-re-base.sh
# Description: OpenWrt DIY script re-base (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
popd

# Add feed sources
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
popd
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
popd
sed -i '$a src-git coolsnowwolf https://github.com/coolsnowwolf/lede/tree/master/package/lean' feeds.conf.default
popd

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon
