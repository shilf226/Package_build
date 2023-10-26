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
