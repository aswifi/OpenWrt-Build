#!/bin/bash
#
# Copyright (c) 2019-2021 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-re.sh
# Description: OpenWrt DIY script re (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community
popd

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
popd

# Add Kenzok8's Packages
git clone --depth=1 https://github.com/kenzok8/openwrt-packages
popd

# Add Coolsnowwolf's Packages
git clone --depth=1 https://github.com/coolsnowwolf/lede/tree/master/package/lean
popd

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap
popd

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner
popd

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon
popd

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter
popd

# Add luci-udptools
git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp
popd

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter
popd

# Add driver for rtl8821cu & rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8821cu
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
