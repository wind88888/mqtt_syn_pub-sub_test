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

#define NUM_THREADS 2
//#define ADDRESS     "tcp://mqtt.eclipse.org:1883"
#define ADDRESS     "broker.emqx.io:1883"
#define PUB_CLIENTID    "ClientSub2"
#define SUB_CLIENTID    "ClientPub2"
#define PUB_TOPIC       "MQTT_Subscribe"
#define SUB_TOPIC       "MQTT_Publish"
//#define PAYLOAD     "Hello World! I M COMING AGAIN!!!"
#define QOS         1
#define TIMEOUT     10000L
#define DISCONNECT  "out"

int CONNECT = 1;
volatile MQTTClient_deliveryToken deliveredtoken;

void delivered(void *context, MQTTClient_deliveryToken dt)
{
    printf("Message with token value %d delivery confirmed\n", dt);
    deliveredtoken = dt;
}

int msgarrvd(void *context, char *topicName, int topicLen, MQTTClient_message *message)
{
    int i;
    char* payloadptr;

    printf("Message arrived\n");
    printf("     topic: %s\n", topicName);
    printf("   message: ");

    payloadptr = message->payload;
    if(strcmp(payloadptr, DISCONNECT) == 0){
        printf(" \n out!!");
        CONNECT = 0;
    }

    else {
        for(i=0; i<message->payloadlen; i++)
        {
            putchar(*payloadptr++);
        }
        printf("\n");

        MQTTClient_freeMessage(&message);
        MQTTClient_free(topicName);
    }
    return 1;
}

void connlost(void *context, char *cause)
{
    printf("\nConnection lost\n");
    printf("     cause: %s\n", cause);
}

void *subClient(void *threadid){
    long tid;
    char Payload;
    tid = (long)threadid;
    printf("Hello World! It's me, thread #%ld!\n", tid);

    MQTTClient client;
    MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
    int rc;
    int ch;

    MQTTClient_create(&client, ADDRESS, SUB_CLIENTID,
                      MQTTCLIENT_PERSISTENCE_NONE, NULL);
    conn_opts.keepAliveInterval = 20;
    conn_opts.cleansession = 1;
//    conn_opts.username = USERNAME;
//    conn_opts.password = PASSWORD;

    MQTTClient_setCallbacks(client, NULL, connlost, msgarrvd, delivered);

    if ((rc = MQTTClient_connect(client, &conn_opts)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to connect, return code %d\n", rc);
        exit(EXIT_FAILURE);
    }
    printf("Subscribing to topic %s\nfor client %s using QoS%d\n\n"
           "Press Q<Enter> to quit\n\n",SUB_TOPIC , PUB_CLIENTID, QOS);
    MQTTClient_subscribe(client, SUB_TOPIC, QOS);

    do
    {
        ch = getchar();
    } while(ch!='Q' && ch != 'q');

    MQTTClient_unsubscribe(client, SUB_TOPIC);
    MQTTClient_disconnect(client, 10000);
    MQTTClient_destroy(&client);

    pthread_exit(NULL);
}
void *pubClient(void *threadid){
    long tid;
    char payload[10000];
    tid = (long)threadid;
    int count = 0;
    printf("Hello World! It's me, thread #%ld!\n", tid);
//声明一个MQTTClient
    MQTTClient client;
    //初始化MQTT Client选项
    MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
    //#define MQTTClient_message_initializer { {'M', 'Q', 'T', 'M'}, 0, 0, NULL, 0, 0, 0, 0 }
    MQTTClient_message pubmsg = MQTTClient_message_initializer;
    //声明消息token
    MQTTClient_deliveryToken token;
    int rc;
    //使用参数创建一个client，并将其赋值给之前声明的client
    MQTTClient_create(&client, ADDRESS, PUB_CLIENTID,
                      MQTTCLIENT_PERSISTENCE_NONE, NULL);
    conn_opts.keepAliveInterval = 20;
    conn_opts.cleansession = 1;
//    conn_opts.username = USERNAME;
//    conn_opts.password = PASSWORD;
    //使用MQTTClient_connect将client连接到服务器，使用指定的连接选项。成功则返回MQTTCLIENT_SUCCESS
    if ((rc = MQTTClient_connect(client, &conn_opts)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to connect, return code %d\n", rc);
        exit(EXIT_FAILURE);
    }

    printf("Please enter the message：");
    scanf("%s",payload);

    pubmsg.payload = payload;
    pubmsg.payloadlen = strlen(payload);
    pubmsg.qos = QOS;
    pubmsg.retained = 0;

    int cnt = 0;
    while(CONNECT){
        MQTTClient_publishMessage(client, PUB_TOPIC, &pubmsg, &token);
        printf("Waiting for up to %d seconds for publication of %s\n"
               "on topic %s for client with ClientID: %s\n",
               (int)(TIMEOUT/1000), payload, PUB_TOPIC, PUB_CLIENTID);
        rc = MQTTClient_waitForCompletion(client, token, TIMEOUT);
        printf("Message with delivery token %d delivered\n", token);
        usleep(3000000L);
        if (cnt == 2)
            CONNECT = 0;
        cnt++;
    }


    MQTTClient_disconnect(client, 10000);
    MQTTClient_destroy(&client);
}
int main(int argc, char* argv[])
{
    pthread_t threads[NUM_THREADS];
    long t;
    pthread_create(&threads[0], NULL, subClient, (void *)0);
    pthread_create(&threads[1], NULL, pubClient, (void *)1);
    pthread_exit(NULL);
}