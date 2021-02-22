# 一键脚本
 
## Ubuntu 更换清华APT源
执行如下命令行即可:
```sh
curl -O https://cdn.jsdelivr.net/gh/mmdjiji/auto@master/ubuntu/apt-tsinghua.sh && chmod +x apt-tsinghua.sh && sudo ./apt-tsinghua.sh && rm apt-tsinghua.sh
```

如果上面的脚本未成功执行，可尝试下面的备选方案:
```sh
curl -O https://raw.githubusercontent.com/mmdjiji/auto/master/ubuntu/apt-tsinghua.sh && chmod +x apt-tsinghua.sh && sudo ./apt-tsinghua.sh && rm apt-tsinghua.sh
```