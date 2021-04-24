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
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Kenzok8's Packages & Dependency
git clone https://github.com/kenzok8/small.git
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/AdGuardHome
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/gost
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/lua-maxminddb
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-adguardhome
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-advanced
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-aliddns
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-clash
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-dnsfilter
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-eqos
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-gost
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-jd-dailybonus
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-openclash
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-passwall
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-serverchan
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-smartdns
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-ssr-plus
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-vssr
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-argon_new
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-atmaterial
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-edge
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-ifit
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-opentomato
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-opentomcat
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-theme-opentopd
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/microsocks
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/naiveproxy
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/redsocks2
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/screenshot
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/smartdns
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/tcping
git clone --depth=1 
git clone --depth=1 
git clone --depth=1 
git clone --depth=1 

# Add Coolsnowwolf's Packages
git clone https://github.com/coolsnowwolf/lede.git

#Add other packages
git clone https://github.com/rufengsuixing/luci-app-onliner.git # Add luci-app-onliner
git clone https://github.com/tindy2013/openwrt-subconverter.git # Add subconverter
git clone https://github.com/zcy85611/Openwrt-Package.git # Add luci-udptools
git clone https://github.com/destan19/OpenAppFilter.git # Add OpenAppFilter

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

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
popd

# Add luci-theme-argon-18.06_sed
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
