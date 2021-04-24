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
sed -i 's/192.168.1.1/192.168.66.1/g' package/base-files/files/bin/config_generate

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Kenzok8's Packages & Dependency
#git clone https://github.com/kenzok8/small.git
#git clone https://github.com/kenzok8/openwrt-packages.git

# Add Coolsnowwolf's Packages
#git clone https://github.com/coolsnowwolf/lede.git

#Add other packages
git clone https://github.com/garypang13/openwrt-packages.git # Add garypang13's packages
#git clone https://github.com/rufengsuixing/luci-app-onliner.git # Add luci-app-onliner
git clone https://github.com/tindy2013/openwrt-subconverter.git # Add subconverter
git clone https://github.com/zcy85611/Openwrt-Package.git # Add luci-udptools
git clone https://github.com/destan19/OpenAppFilter.git # Add OpenAppFilter

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

# Add luci-theme-argon-18.06_sed
#sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile

# Mod zzz-default-settings & Modify the version number & Delete default password
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/OpenWrt /Redmi-AC2100 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" zzz-default-settings
sed -i "/CYXluq4wUazHjmCDBCqXF/d" zzz-default-settings
