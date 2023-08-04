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

echo 'src-git kiddin https://github.com/kiddin9/openwrt-packages' >>feeds.conf.default

#echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

#Linkease x86_64/arm64
#echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
#echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
#echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default

#Design Theme
#git clone --depth=1 --single-branch --branch "main" https://github.com/gngpp/luci-theme-design.git
#git clone --depth=1 --single-branch https://github.com/gngpp/luci-app-design-config.git
#Argon Theme
#git clone --depth=1 --single-branch --branch "18.06" https://github.com/jerrykuku/luci-theme-argon.git
#git clone --depth=1 --single-branch --branch "18.06" https://github.com/jerrykuku/luci-app-argon-config.git

#Linkease x86_64/arm64
#git clone --depth=1 --single-branch https://github.com/linkease/istore.git
#git clone --depth=1 --single-branch https://github.com/linkease/nas-packages.git
#git clone --depth=1 --single-branch https://github.com/linkease/nas-packages-luci.git

#OpenClash
#git clone --depth=1 --single-branch --branch "dev" https://github.com/vernesong/OpenClash.git

#PassWall
#git clone --depth=1 --single-branch --branch "luci" https://github.com/xiaorouji/openwrt-passwall.git ./pw_luci
#git clone --depth=1 --single-branch --branch "packages" https://github.com/xiaorouji/openwrt-passwall.git ./pw_packages

#git clone --depth=1 --single-branch --branch "luci" https://github.com/xiaorouji/openwrt-passwall.git package/passwall
#git clone --depth=1 --single-branch --branch "packages" https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

#adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#ssr-plus+
#git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
