# 简介
- 用于 OpenWRT/LEDE 路由器上进行推送的插件
- 基于 zospusher 提供的接口发送信息
- 不同系统不同设备，请自行修改部分代码，无测试条件无法重现的 bug 不考虑修复**
- 依赖 iputils-arping + curl 命令，安装前请 `opkg update`，小内存路由谨慎安装
- 使用主动探测设备连接的方式检测设备在线状态，以避免WiFi休眠机制，主动探测较为耗时，**如遇设备休眠频繁，请自行调整超时设置**
- 流量统计功能依赖 wrtbwmon ，自行选装或编译，该插件与 Routing/NAT 、Flow Offloading 冲突，开启无法获取流量，自行选择

#### 主要功能
- 路由 ip/ipv6 变动推送
- 设备别名
- 设备上线推送
- 设备离线推送及流量使用情况
- CPU 负载、温度监视
- 定时推送设备运行状态
- MAC 白名单、黑名单、按接口检测设备
- 免打扰
- 无人值守任务

#### 已知问题
- 直接关闭接口时，该接口的离线设备会忽略检测
- 部分设备无法读取到设备名，脚本使用 `cat /var/dhcp.leases` 命令读取设备名，如果 dhcp 中不存在设备名，则无法读取设备名（如二级路由设备、静态ip设备），请使用设备名备注.
- 不同系统不同设备，可能会遇到各种问题
# Download
- [luci-app-zospusher]
- [luci-app-wrtbwmon](https://github.com/brvphoenix/luci-app-wrtbwmon) 

#### ps
- 新功能看情况开发，忙得头晕眼花
- 欢迎各种代码提交
- 提交bug时请尽量带上设备信息，日志与描述
（如执行 `/usr/bin/zospusher/zospusher` 后的提示、日志信息、/tmp/zospusher/ipAddress 文件信息、或尝试使用 sh -x /usr/bin/zospusher/zospusher 查看详细运行信息 ）
- 三言两句恕我无能为力

# Donate
如果你觉得此项目对你有帮助，请捐助我们，以使项目能持续发展，更加完善。

![image](https://github.com/tty228/Python-100-Days/blob/master/res/WX.jpg)

