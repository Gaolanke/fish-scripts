🐟 Fish-Scripts | CachyOS 自用终端脚本库
个人日常开发工具脚本合集，专为 CachyOS / ArchLinux + Alacritty + Fish Shell 优化。
所有脚本 零配置、开箱即用、交互式选择、高度自动化。

---
📦 仓库包含脚本
1. stc-flash.fish（51 单片机一键烧录）
功能：基于 stcgal + fzf 实现全自动 STC89 系列 51 单片机烧录
- 自动扫描所有 /dev/ttyUSB* 串口
- 递归搜索当前项目全部 .hex 固件
- 终端可视化选择串口 + 固件
- 适配标准 STC 冷启动烧录协议
- 完美兼容 PlatformIO 编译目录结构
依赖安装
sudo pacman -S fzf
pipx install stcgal
安装脚本
cp stc-flash.fish ~/.config/fish/functions/
使用方式
stc-flash
烧录标准流程
1. 终端执行命令
2. 等待提示 Waiting for MCU, please cycle power
3. 给 51 单片机 断电重新上电
4. 自动擦除、写入、完成烧录

---
2. format-usb.fish（U盘一键格式化工具）
⚠️ 高危工具，请谨慎操作！！
终端交互式选择磁盘，一键清空、重建分区、格式化为 exFAT（全平台兼容）。
- 自动列出全部磁盘设备
- fzf 可视化选择，防止误删系统盘
- 自动卸载、清分区、重建 MBR 分区表
- 默认 exFAT 格式（Win/Linux/Mac 通用）
- 自动弹出设备
依赖安装
sudo pacman -S fzf exfatprogs
安装脚本
cp format-usb.fish ~/.config/fish/functions/
使用方式
format-usb

---
⚡ 一键全部安装（推荐）
git clone https://github.com/你的用户名/fish-scripts.git
cd fish-scripts
cp *.fish ~/.config/fish/functions/
新开 Alacritty 终端即可生效。

---
🧩 运行环境
- 系统：CachyOS / Arch Linux
- 终端：Alacritty
- Shell：Fish
- 依赖：fzf、stcgal、exfatprogs

---
📄 License
MIT License
You can use, modify and share freely.
