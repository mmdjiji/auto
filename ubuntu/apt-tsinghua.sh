#!/bin/bash

# apt-tsinghua.sh (for ubuntu)
# Author: JiJi
# Function: Change ubuntu apt source to tsinghua source automatically.
# GitHub: https://github.com/mmdjiji/auto

if [ `id -u` -eq 0 ];then
  system_version=$(cat /etc/os-release | grep VERSION_CODENAME |awk -F'=' '{print $2}')
  cp /etc/apt/sources.list /etc/apt/sources.list.bak
  echo "\
  # https://github.com/mmdjiji/auto
  # 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-updates main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-updates main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-backports main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-backports main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-security main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-security main restricted universe multiverse

  # 预发布软件源，不建议启用
  # deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-proposed main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $system_version-proposed main restricted universe multiverse" > /etc/apt/sources.list
  apt-get update
  echo "Success!"
else
  echo "Error: Permission denied, you may use root to run this script."
fi
