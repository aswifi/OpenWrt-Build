#!/bin/bash

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 修改内核设置
echo "CONFIG_IP_SET=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_IP_SET_HASH_IPPORT=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_IP_SET_MAX=256" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER_FAMILY_ARP=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER_FAMILY_BRIDGE=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER_NETLINK=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER_NETLINK_GLUE_CT=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER_NETLINK_LOG=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NETFILTER_XTABLES=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NFT_REJECT=m" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NFT_REJECT_IPV4=m" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NF_CONNTRACK=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NF_CONNTRACK_LABELS=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NF_CT_NETLINK=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NF_DEFRAG_IPV4=y" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NF_REJECT_IPV4=m" >> target/linux/ramips/mt7621/config-5.4
echo "CONFIG_NF_TABLES=y" >> target/linux/ramips/mt7621/config-5.4

# Modify default IP
sed -i 's/192.168.1.1/192.168.66.1/g' package/base-files/files/bin/config_generate

# Add other packages
git clone https://github.com/Zxilly/UA2F.git package/lean/UA2F
# git clone https://github.com/aswifi/UAWizard.git package/lean/UAWizard
git clone https://github.com/CHN-beta/rkp-ipid.git package/lean/rkp-ipid
git clone https://github.com/sirpdboy/NetSpeedTest.git package/lean/NetSpeedTest
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/lean/luci-app-autotimeset
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/lean/luci-theme-opentopd

# Mod zzz-default-settings & Modify the version number & Delete default password
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/OpenWrt /Redmi-AC2100 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" zzz-default-settings
sed -i "/CYXluq4wUazHjmCDBCqXF/d" zzz-default-settings
