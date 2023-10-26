# 这是我的第一个GitHub项目
> 本仓库用与存储一些Linux不同平台的打包脚本，以及一些小工具。

## bin 安装包制作

1.准备安装包
> 此处以jdk1.8.0_151为例
```bash
#将源码包先打包
tar zcvf java_1.8.0_151.tar.gz java_1.8.0_151
```

2.编写sh安装脚本

shell脚本主要有两个作用：
> 将压缩包从bin安装包中分离出来并解压
实现安装过程中需要进行的相关的文件操作（从压缩包中复制文件到系统指定路径下）
install.sh文件

```bash
#!/bin/bash

# 分离压缩包
sed -n -e '1,/^exit 0$/!p' $0 >java_1.8.0_151.tar.gz 2>/dev/null

# 解压资源
tar -xvf java_1.8.0_151.tar.gz -C /  > /dev/null

# 设置环境变量
echo "export JAVA_HOME=/opt/netiler/java_1.8.0_151" >> /etc/profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile
echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile

# 将命令加入/usr/bin/
ln -sf /opt/netiler/java_1.8.0_151/bin/java /usr/bin/

# 清理安装目录
find . -type f ! -name "java_1.8.0_151_x86.bin" -exec rm {} \;

# 退出脚本
exit 0

```

3.使用cat命令连接安装脚本和安装包
```bash
cat install.sh java_1.8.0_151.tar.gz > java_1.8.0_151_x86.bin
```
