function format-usb -d "格式化U盘，fzf选择磁盘，警告风险"
    echo "⚠️  警告！！此操作会永久删除磁盘全部数据！！"
    echo "只选择U盘，千万别选系统盘 nvme / sda"
    echo "----------------------------------------"
    set disks (lsblk -d -o name,size,type | grep disk | awk '{print "/dev/"$1,"("$2")"}')
    set selected (echo $disks | fzf --prompt="选择U盘磁盘 > ")
    if test -z "$selected"
        echo "取消退出"
        return 1
    end
    set dev (echo $selected | cut -d' ' -f1)
    echo "选中磁盘: $dev"
    read -p "确认继续？输入 YES 确认: " confirm
    if test $confirm != "YES"
        echo "已取消"
        return 0
    end
    echo "卸载分区..."
    sudo umount $dev* 2>/dev/null
    echo "清除分区标记..."
    sudo wipefs -a $dev
    echo "新建MBR分区表并创建主分区"
    echo "o
n
p
1


w" | sudo fdisk $dev
    sleep 1
    echo "格式化为 exFAT，卷标 MYUSB"
    sudo mkfs.exfat -L MYUSB ${dev}1
    echo "✅ 格式化完成！执行 eject 弹出"
    sudo eject $dev
end
