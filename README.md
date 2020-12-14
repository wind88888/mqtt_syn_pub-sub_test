# mqtt_syn_pub-sub_test
origianl就是eclipse/paho.mqtt.c项目:https://github.com/eclipse/paho.mqtt.c

终端操作步骤:
git clone https://github.com/eclipse/paho.mqtt.c.git
cd paho.mqtt.c
make
sudo make install
cd paho.mqtt.c/build/output/samples
./MQTTClient_publish
详情见https://blog.csdn.net/weixin_37139197/article/details/78934961

temp是单独建一个小项目来配置cmakelists测试mqtt的，是成功的(动态库直接复制过来，并没有像源码那样自己生成)
自己写的文件:MQTTClient_add_subscribe.cpp放在了temp/src/samples下，是实现一端开启双线程既可以发布也可以订阅（异步）
