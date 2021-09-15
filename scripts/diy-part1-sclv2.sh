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
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git penwrt-packages https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git jeii https://github.com/kenzok78/jeii' feeds.conf.default
#sed -i '$a src-git small-package https://github.com/kenzok8/small-package' feeds.conf.default

# 修改内核设置
sed -i 's/KERNEL_TESTING_PATCHVER:=5.10/KERNEL_TESTING_PATCHVER:=5.4/g' ./target/linux/ramips/Makefile
