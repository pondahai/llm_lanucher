# llm_lanucher  
我請llama3.1協作一個命令列下的 llama.cpp 選單式啟動器  
會把指令目錄下的gguf檔案 以遞迴方式搜尋  
然後製成列表供使用者選擇  
最後會將選擇的大語言模型交給  
llama-server啟動  

## 使用例子
```
./sls.sh  /media/nvidia/sd/
```
![image](https://github.com/user-attachments/assets/51ca0e16-22bf-40bc-8eb2-d5bfde5c16c4)
