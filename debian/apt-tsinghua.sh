#!/bin/bash

# apt-tsinghua.sh (for debian)
# Author: JiJi
# Function: Change debian apt source to tsinghua source automatically.
# GitHub: https://github.com/mmdjiji/auto

if [ `id -u` -eq 0 ];then
  system_version=$(cat /etc/os-release | grep VERSION_CODENAME |awk -F'=' '{print $2}')
  cp /etc/apt/sources.list /etc/apt/sources.list.bak
  echo "\
  # https://github.com/mmdjiji/auto
  # 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
  deb https://mirrors.tuna.tsinghua.edu.cn/debian/ $system_version main contrib non-free
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ $system_version main contrib non-free
  deb https://mirrors.tuna.tsinghua.edu.cn/debian/ $system_version-updates main contrib non-free
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ $system_version-updates main contrib non-free
  deb https://mirrors.tuna.tsinghua.edu.cn/debian/ $system_version-backports main contrib non-free
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ $system_version-backports main contrib non-free
  deb https://mirrors.tuna.tsinghua.edu.cn/debian-security $system_version/updates main contrib non-free
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security $system_version/updates main contrib non-free" > /etc/apt/sources.list
  apt-get update
  echo "Success!"
else
  echo "Error: Permission denied, you may use root to run this script."
fi
