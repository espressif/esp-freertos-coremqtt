# TLS Mutual Auth Sample application (mutual authentication)

(See the README.md file in the upper level 'examples' directory for more information about examples.)

For connecting to AWS IoT using this example, follow the README for your chip instead.
[ESP32-C3](aws-readme/esp32-c3.md)
[ESP32-S2](aws-readme/esp32-s2.md)

This guide is for using the example to connect to the broker test.mosquitto.org using ssl transport with client certificate and as a demonstration subscribes/unsubscribes and send a message on certain topic.
(Please note that the public broker is maintained by the community so may not be always available, for details please visit http://test.mosquitto.org)

It uses FreeRTOS coreMQTT library which implements mqtt client to connect to mqtt broker.

## How to use example

### Hardware Required

This example can be executed on any ESP board, the only required interface is WiFi and connection to internet.

### Set the target chip

```
idf.py set-target <target>
# choose between esp32|esp32s2|esp32c3|esp32s3|linux
```

### Configure the project

* Open the project configuration menu (`idf.py menuconfig`)
* Configure Wi-Fi or Ethernet under "Example Connection Configuration" menu. See "Establishing Wi-Fi or Ethernet Connection" section in [examples/protocols/README.md](../../README.md) for more details.
* Configure MQTT client identifier, broker endpoint and port under "Example Configuration" menu.
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

Please paste the contents of your root certificate auth in PEM format in the `root_cert_auth.pem` file.

Please note, that the supplied files `client.crt`, `client.key` and `root_cert_auth.pem` in the `main` directory are only placeholders for your client certificate, key and root certificate (i.e. the example "as is" would compile but would not connect to the broker)

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

## Size Information on ESP-IDF v4.3

```
Total sizes:
 DRAM .data size:   16040 bytes
 DRAM .bss  size:   19416 bytes
Used static DRAM:       0 bytes (      0 available, nan% used)
Used static IRAM:       0 bytes (      0 available, nan% used)
Used stat D/IRAM:  118395 bytes ( 258437 available, 31.4% used)
      Flash code:  553107 bytes
    Flash rodata:  121148 bytes
Total image size:~ 773234 bytes (.bin may be padded larger)
```