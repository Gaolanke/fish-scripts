function stc-flash -d "STC89 一键烧录：先选串口，再选hex，stcgal烧录"
    # 1. 枚举所有USB转TTL串口
    set port_list (ls /dev/ttyUSB* 2>/dev/null)
    if test -z "$port_list"
        echo "❌ 未找到任何 /dev/ttyUSB* 串口，请插上USB-TTL模块"
        return 1
    end

    # 选择串口
    set selected_port (echo $port_list | tr ' ' '\n' | fzf --prompt="🔌 选择串口 > ")
    if test -z "$selected_port"
        echo "⏭️  取消选择串口，退出"
        return 1
    end

    # 2. 查找当前目录及子目录全部hex文件
    set hex_list (find . -type f -iname "*.hex" 2>/dev/null)
    if test -z "$hex_list"
        echo "❌ 当前目录下没有找到任何 .hex 文件"
        return 1
    end

    # 选择hex文件
    set selected_hex (echo $hex_list | tr ' ' '\n' | fzf --prompt="🔍 选择HEX固件 > ")
    if test -z "$selected_hex"
        echo "⏭️  取消选择hex文件，退出"
        return 1
    end

    # 3. 打印信息
    echo "====================================="
    echo "✅ 串口:    $selected_port"
    echo "✅ 固件:    $selected_hex"
    echo "✅ 芯片:    STC89 (STC89C52RC)"
    echo "====================================="
    echo "💡 操作提示："
    echo "   脚本启动后，等待提示 Waiting for MCU"
    echo "   然后给51单片机断电，重新上电！"
    echo "====================================="

    # 执行烧录命令
    stcgal -P stc89 -p $selected_port $selected_hex
end
