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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git kiddin https://github.com/kiddin9/openwrt-packages' >>feeds.conf.default
#echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

#Design Theme
git clone --depth=1 --single-branch --branch $(echo $OWRT_URL | grep -iq "lede" && echo "main" || echo "js") https://github.com/gngpp/luci-theme-design.git
git clone --depth=1 --single-branch https://github.com/gngpp/luci-app-design-config.git
#Argon Theme
git clone --depth=1 --single-branch --branch $(echo $OWRT_URL | grep -iq "lede" && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth=1 --single-branch --branch $(echo $OWRT_URL | grep -iq "lede" && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-app-argon-config.git

#Linkease
git clone --depth=1 --single-branch https://github.com/linkease/istore.git
git clone --depth=1 --single-branch https://github.com/linkease/nas-packages.git
git clone --depth=1 --single-branch https://github.com/linkease/nas-packages-luci.git

#OpenClash
git clone --depth=1 --single-branch --branch "dev" https://github.com/vernesong/OpenClash.git

#PassWall
git clone --depth=1 --single-branch --branch "luci" https://github.com/xiaorouji/openwrt-passwall.git ./pw_luci
git clone --depth=1 --single-branch --branch "packages" https://github.com/xiaorouji/openwrt-passwall.git ./pw_packages

#git clone --depth=1 --single-branch --branch "luci" https://github.com/xiaorouji/openwrt-passwall.git package/passwall
#git clone --depth=1 --single-branch --branch "packages" https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

#adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#ssr-plus+
git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus

#预置OpenClash内核和GEO数据
export CORE_VER=https://raw.githubusercontent.com/vernesong/OpenClash/core/dev/core_version
export CORE_TUN=https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux
export CORE_DEV=https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux
export CORE_MATE=https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux

export CORE_TYPE=$(echo $OWRT_TARGET | grep -Eiq "64|86" && echo "amd64" || echo "arm64")
export TUN_VER=$(curl -sfL $CORE_VER | sed -n "2{s/\r$//;p;q}")

export GEO_MMDB=https://github.com/alecthw/mmdb_china_ip_list/raw/release/lite/Country.mmdb
export GEO_SITE=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat
export GEO_IP=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat

cd ./OpenClash/luci-app-openclash/root/etc/openclash

curl -sfL -o ./Country.mmdb $GEO_MMDB
curl -sfL -o ./GeoSite.dat $GEO_SITE
curl -sfL -o ./GeoIP.dat $GEO_IP

mkdir ./core && cd ./core

curl -sfL -o ./tun.gz "$CORE_TUN"-"$CORE_TYPE"-"$TUN_VER".gz
gzip -d ./tun.gz && mv ./tun ./clash_tun

curl -sfL -o ./meta.tar.gz "$CORE_MATE"-"$CORE_TYPE".tar.gz
tar -zxf ./meta.tar.gz && mv ./clash ./clash_meta

curl -sfL -o ./dev.tar.gz "$CORE_DEV"-"$CORE_TYPE".tar.gz
tar -zxf ./dev.tar.gz

chmod +x ./clash* ; rm -rf ./*.gz
