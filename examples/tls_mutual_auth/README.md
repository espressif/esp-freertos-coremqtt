# TLS Mutual Auth Sample application (mutual authentication)

(See the README.md file in the upper level 'examples' directory for more information about examples.)

This example connects to the broker test.mosquitto.org using ssl transport with client certificate and as a demonstration subscribes/unsubscribes and send a message on certain topic.
(Please note that the public broker is maintained by the community so may not be always available, for details please visit http://test.mosquitto.org)

It uses FreeRTOS coreMQTT library which implements mqtt client to connect to mqtt broker.

## How to use example

### Hardware Required

This example can be executed on any ESP32 board, the only required interface is WiFi and connection to internet.

### Configure the project

* Open the project configuration menu (`idf.py menuconfig`)
* Configure Wi-Fi or Ethernet under "Example Connection Configuration" menu. See "Establishing Wi-Fi or Ethernet Connection" section in [examples/protocols/README.md](../../README.md) for more details.
* When using Make build system, set `Default serial port` under `Serial flasher config`.

* Generate your client keys and certificate

Navigate to the main directory

```
cd main
```

Generate a client key and a CSR. When you are generating the CSR, do not use the default values. At a minimum, the CSR must include the Country, Organisation and Common Name fields.

```
openssl genrsa -out client.key
openssl req -out client.csr -key client.key -new
```

Paste the generated CSR in the [Mosquitto test certificate signer](https://test.mosquitto.org/ssl/index.php), click Submit and copy the downloaded `client.crt` in the `main` directory.

Please note, that the supplied files `client.crt` and `client.key` in the `main` directory are only placeholders for your client certificate and key (i.e. the example "as is" would compile but would not connect to the broker)

### Build and Flash

Build the project and flash it to the board, then run monitor tool to view serial output:

```
idf.py -p PORT flash monitor
```

(To exit the serial monitor, type ``Ctrl-]``.)

See the Getting Started Guide for full steps to configure and use ESP-IDF to build projects.

## Example Output

```
I (11130) example_connect: - IPv4 address: 172.168.30.217
I (11140) example_connect: - IPv6 address: fe80:0000:0000:0000:260a:c4ff:fed8:f7f8, type: ESP_IP6_ADDR_IS_LINK_LOCAL
[INFO] [MQTTDemo] [prvConnectToServerWithBackoffRetries:613] Creating a TLS connection to test.mosquitto.org:8884.

I (13740) tls_freertos: (Network connection 0x3ffc6d70) Connection to test.mosquitto.org established.
[INFO] [MQTTDemo] [prvMQTTDemoTask:497] Creating an MQTT connection to test.mosquitto.org.

[INFO] [MQTTDemo] [prvCreateMQTTConnectionWithBroker:713] An MQTT connection is established with test.mosquitto.org.
[INFO] [MQTTDemo] [prvMQTTSubscribeWithBackoffRetries:771] Attempt to subscribe to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTSubscribeWithBackoffRetries:778] SUBSCRIBE sent for topic testClient/example/topic to broker.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:902] Subscribed to the topic testClient/example/topic with maximum QoS 1.

[INFO] [MQTTDemo] [prvMQTTDemoTask:511] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:517] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:883] PUBACK received for packet Id 2.

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:938] Incoming QoS : 1

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:949] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:522] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:511] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:517] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:883] PUBACK received for packet Id 3.

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:938] Incoming QoS : 1

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:949] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:522] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:511] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:517] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:883] PUBACK received for packet Id 4.

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:938] Incoming QoS : 1

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:949] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:522] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:511] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:517] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:883] PUBACK received for packet Id 5.

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:938] Incoming QoS : 1

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:949] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:522] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:511] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:517] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:883] PUBACK received for packet Id 6.

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:938] Incoming QoS : 1

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:949] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:522] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:527] Unsubscribe from the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:911] Unsubscribed from the topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:541] Disconnecting the MQTT connection with test.mosquitto.org.

[INFO] [MQTTDemo] [prvMQTTDemoTask:559] prvMQTTDemoTask() completed an iteration successfully. Total free heap is 232832.

[INFO] [MQTTDemo] [prvMQTTDemoTask:560] Demo completed successfully.

[INFO] [MQTTDemo] [prvMQTTDemoTask:561] Short delay before starting the next iteration.... 
```

