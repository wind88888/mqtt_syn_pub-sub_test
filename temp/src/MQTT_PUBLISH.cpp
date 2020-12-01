#include <iostream>

/*******************************************************************************
 * Copyright (c) 2012, 2020 IBM Corp.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 *
 * The Eclipse Public License is available at
 *   https://www.eclipse.org/legal/epl-2.0/
 * and the Eclipse Distribution License is available at
 *   http://www.eclipse.org/org/documents/edl-v10.php.
 *
 * Contributors:
 *    Ian Craggs - initial contribution
 *******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "MQTTClient.h"

//#define ADDRESS     "tcp://mqtt.eclipse.org:1883"
#define ADDRESS     "broker.emqx.io:1883"
#define CLIENTID    "ExampleClientPub"
#define TOPIC       "MQTT Examples"
#define PAYLOAD     "Hellofasf World!"
#define QOS         1
#define TIMEOUT     10000L

int main(int argc, char* argv[])
{
    //声明一个MQTTClient
    MQTTClient client;

    //添加用户名和密码
    //char *username = "test_user";
    //char *passwprd = "aaa777";

    //初始化MQTTClient选项
    //#define MQTTClient_connectOptions_initializer { {'M', 'Q', 'T', 'C'}, 7, 60, 1, 1, NULL, NULL, NULL, 30, 0, NULL,\
    //0, NULL, MQTTVERSION_DEFAULT, {NULL, 0, 0}, {0, NULL}, -1, 0, NULL}
    MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;

    //#define MQTTClient_message_initializer { {'M', 'Q', 'T', 'M'}, 1, 0, NULL, 0, 0, 0, 0, MQTTProperties_initializer }
    MQTTClient_message pubmsg = MQTTClient_message_initializer;
    //声明消息token，类型是int,代表函数成功返回消息的数字
    MQTTClient_deliveryToken token;
    int rc;
    //使用参数创建一个client,并将其赋值给之前声明的client
    if ((rc = MQTTClient_create(&client, ADDRESS, CLIENTID,
                                MQTTCLIENT_PERSISTENCE_NONE, NULL)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to create client, return code %d\n", rc);
        exit(EXIT_FAILURE);
    }

//    conn_opts.username = username;
//    conn_opts.password = password;
    conn_opts.keepAliveInterval = 20;
    conn_opts.cleansession = 1;

    //使用MQTTClient_connect将client连接到服务器,使用指定的连接选项。成功则返回MQTTclient_success
    if ((rc = MQTTClient_connect(client, &conn_opts)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to connect, return code %d\n", rc);
        exit(EXIT_FAILURE);
    }

    pubmsg.payload = PAYLOAD;
    pubmsg.payloadlen = (int)strlen(PAYLOAD);
    pubmsg.qos = QOS;
    pubmsg.retained = 0;
    //client发布消息
    if ((rc = MQTTClient_publishMessage(client, TOPIC, &pubmsg, &token)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to publish message, return code %d\n", rc);
        exit(EXIT_FAILURE);
    }

    printf("Waiting for up to %d seconds for publication of %s\n"
           "on topic %s for client with ClientID: %s\n",
           (int)(TIMEOUT/1000), PAYLOAD, TOPIC, CLIENTID);

    rc = MQTTClient_waitForCompletion(client, token, TIMEOUT);
    printf("Message with delivery token %d delivered\n", token);

    if ((rc = MQTTClient_disconnect(client, 10000)) != MQTTCLIENT_SUCCESS)
        printf("Failed to disconnect, return code %d\n", rc);

    //释放客户端
    MQTTClient_destroy(&client);
    return rc;
}
