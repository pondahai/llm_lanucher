#!/bin/bash

# 查找指定目錄及其子目錄中的所有gguf檔案
#base_dir="/media/nvidia/sd/"
base_dir=$1
ggufs=($(find "$base_dir" -type f -name "*.gguf"))

if [ ${#ggufs[@]} -eq 0 ]; then
    echo "在 $base_dir 目錄下沒有找到任何gguf檔案"
    exit 1
fi

for (( i=0; i<${#ggufs[@]}; i++ )); do
    new_array+=("${ggufs[i]}") # 偶數位置放文件路徑
    new_array+=($((i+1))) # 奇数位置放順序數字
done

PS3="請選擇要執行的gguf檔案："

# 使用 dialog 等待用戶輸入
selected_gguf=$(dialog \
    --stdout \
    --menu \
    "選擇要執行的 gguf 檔案:" \
    20 60 15 \
    "${new_array[@]}" \
    2>/dev/tty)

if [[ $? != 0 ]]; then
    clear
    echo "已取消選取"
    exit 1
fi

clear

echo "你選擇了: $selected_gguf"

~/llama.cpp/llama-server -m ${selected_gguf} --host 0.0.0.0 --port 1234 -c 16384  -ngl 50 
