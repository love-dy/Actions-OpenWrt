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
sed -i 's/192.168.3.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#删除冲突插件
#rm -rf $(find ./feeds/luci/ -type d -regex ".*\(argon\|design\|openclash\).*")
#修改默认主题
#sed -i "s/luci-theme-bootstrap/luci-theme-design/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
#修改默认IP地址
#sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.3.1/g" ./package/base-files/files/bin/config_generate
#修改默认主机名
#sed -i "s/hostname='.*'/hostname='OpenWRT'/g" ./package/base-files/files/bin/config_generate
