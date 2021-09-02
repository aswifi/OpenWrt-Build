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
#sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git jeii https://github.com/kenzok78/jeii' feeds.conf.default

# 更新queue
git clone https://github.com/openwrt/packages
rm -rf package/libs/libnetfilter-queue

# cp命令方便本地使用
cp -rf packages/libs/libnetfilter-queue package/libs/

# 修改内核设置
echo "CONFIG_IP_SET=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_IP_SET_HASH_IPPORT=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_IP_SET_MAX=256" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER_FAMILY_ARP=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER_FAMILY_BRIDGE=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER_NETLINK=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER_NETLINK_GLUE_CT=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER_NETLINK_LOG=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NETFILTER_XTABLES=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NFT_REJECT=m" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NFT_REJECT_IPV4=m" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NF_CONNTRACK=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NF_CONNTRACK_LABELS=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NF_CT_NETLINK=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NF_DEFRAG_IPV4=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NF_REJECT_IPV4=m" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_NF_TABLES=y" >> target/linux/ramips/mt7621/config-5.10
