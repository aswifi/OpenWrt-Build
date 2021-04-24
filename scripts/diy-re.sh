#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.66.1/g' package/base-files/files/bin/config_generate

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Kenzok8's Packages & Dependency
git clone https://github.com/kenzok8/small.git
git clone https://github.com/kenzok8/openwrt-packages.git

# Add Coolsnowwolf's Packages
git clone --depth=1 https://github.com/coolsnowwolf/lede/tree/master/package/lean

#Add other packages
git clone https://github.com/rufengsuixing/luci-app-onliner.git # Add luci-app-onliner
git clone https://github.com/tindy2013/openwrt-subconverter.git # Add subconverter
git clone https://github.com/zcy85611/Openwrt-Package.git # Add luci-udptools
git clone https://github.com/destan19/OpenAppFilter.git # Add OpenAppFilter

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
#pushd feeds/packages/utils
#rm -rf syncthing
#svn co https://github.com/openwrt/packages/trunk/utils/syncthing
#popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Mod zzz-default-settings
#pushd package/lean/default-settings/files
#sed -i '/http/d' zzz-default-settings
#export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
#sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
#popd

# Modify the version number
sed -i "s/OpenWrt /insChow build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Delete default password
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
#popd

# Add luci-theme-argon-18.06_sed
#sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
