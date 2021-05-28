# TLS Basic Sample application

(See the README.md file in the upper level 'examples' directory for more information about examples.)

This example connects to the broker `mqtt.eclipse.org` using ssl transport and as a demonstration subscribes/unsubscribes and send a message on certain topic.
(Please note that the public broker is maintained by the community so may not be always available, for details please see this [disclaimer](https://iot.eclipse.org/getting-started/#sandboxes))

It uses FreeRTOS coreMQTT library which implements mqtt client to connect to mqtt broker.

## How to use example

### Hardware Required

This example can be executed on any ESP32 board, the only required interface is WiFi and connection to internet.

### Configure the project

* Open the project configuration menu (`idf.py menuconfig`)
* Configure Wi-Fi or Ethernet under "Example Connection Configuration" menu. See "Establishing Wi-Fi or Ethernet Connection" section in [examples/protocols/README.md](../../README.md) for more details.
* When using Make build system, set `Default serial port` under `Serial flasher config`.

PEM certificate for this example could be extracted from an openssl `s_client` command connecting to mqtt.eclipse.org.
In case a host operating system has `openssl` and `sed` packages installed, one could execute the following command to download and save the root certificate to a file (Note for Windows users: Both Linux like environment or Windows native packages may be used).
```
echo "" | openssl s_client -showcerts -connect mqtt.eclipse.org:8883 | sed -n "1,/Root/d; /BEGIN/,/END/p" | openssl x509 -outform PEM >mqtt_eclipse_org.pem
```
Please note that this is not a general command for downloading a root certificate for an arbitrary host;
this command works with mqtt.eclipse.org as the site provides root certificate in the chain, which then could be extracted
with text operation.

### Build and Flash

Build the project and flash it to the board, then run monitor tool to view serial output:

```
idf.py -p PORT flash monitor
```

(To exit the serial monitor, type ``Ctrl-]``.)

See the Getting Started Guide for full steps to configure and use ESP-IDF to build projects.

## Example Output

```
I (2621) example_connect: Got IPv6 event: Interface "example_connect: sta" address: fe80:0000:0000:0000:260a:c4ff:fed8:f7f8, type: ESP_IP6_ADDR_IS_LINK_LOCAL
I (6621) esp_netif_handlers: example_connect: sta ip: 172.168.30.217, mask: 255.255.255.0, gw: 172.168.30.1
I (6621) example_connect: Got IPv4 event: Interface "example_connect: sta" address: 172.168.30.217
I (6631) example_connect: Connected to example_connect: sta
I (6631) example_connect: - IPv4 address: 172.168.30.217
I (6641) example_connect: - IPv6 address: fe80:0000:0000:0000:260a:c4ff:fed8:f7f8, type: ESP_IP6_ADDR_IS_LINK_LOCAL
[INFO] [MQTTDemo] [prvConnectToServerWithBackoffRetries:508] Creating a TLS connection to mqtt.eclipse.org:8883.

I (8671) tls_freertos: (Network connection 0x3ffc6d70) Connection to mqtt.eclipse.org established.
[INFO] [MQTTDemo] [prvMQTTDemoTask:407] Creating an MQTT connection to mqtt.eclipse.org.

[INFO] [MQTTDemo] [prvCreateMQTTConnectionWithBroker:585] An MQTT connection is established with mqtt.eclipse.org.
[INFO] [MQTTDemo] [prvMQTTSubscribeWithBackoffRetries:643] Attempt to subscribe to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTSubscribeWithBackoffRetries:650] SUBSCRIBE sent for topic testClient/example/topic to broker.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:770] Subscribed to the topic testClient/example/topic with maximum QoS 2.

[INFO] [MQTTDemo] [prvMQTTDemoTask:431] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:437] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:794] PUBREC received for packet id 2.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:810] PUBCOMP received for packet id 2.


[INFO] [MQTTDemo] [prvEventCallback:860] PUBLISH received for packet id 1.


[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:827] Incoming QoS : 2

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:838] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:442] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:431] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:437] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:802] PUBREL received for packet id 1.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:794] PUBREC received for packet id 3.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:810] PUBCOMP received for packet id 3.


[INFO] [MQTTDemo] [prvEventCallback:860] PUBLISH received for packet id 2.


[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:827] Incoming QoS : 2

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:838] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:442] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:431] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:437] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:802] PUBREL received for packet id 2.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:794] PUBREC received for packet id 4.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:810] PUBCOMP received for packet id 4.


[INFO] [MQTTDemo] [prvEventCallback:860] PUBLISH received for packet id 3.


[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:827] Incoming QoS : 2

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:838] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:442] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:431] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:437] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:802] PUBREL received for packet id 3.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:794] PUBREC received for packet id 5.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:810] PUBCOMP received for packet id 5.


[INFO] [MQTTDemo] [prvEventCallback:860] PUBLISH received for packet id 4.


[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:827] Incoming QoS : 2

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:838] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:442] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:431] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:437] Attempt to receive publish message from broker.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:802] PUBREL received for packet id 4.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:794] PUBREC received for packet id 6.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:810] PUBCOMP received for packet id 6.


[INFO] [MQTTDemo] [prvEventCallback:860] PUBLISH received for packet id 5.


[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:827] Incoming QoS : 2

[INFO] [MQTTDemo] [prvMQTTProcessIncomingPublish:838] 
Incoming Publish Topic Name: testClient/example/topic matches subscribed topic.
Incoming Publish Message : Hello World!

[INFO] [MQTTDemo] [prvMQTTDemoTask:442] Keeping Connection Idle...


[INFO] [MQTTDemo] [prvMQTTDemoTask:447] Unsubscribe from the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTProcessResponse:802] PUBREL received for packet id 5.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:779] Unsubscribed from the topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:459] Disconnecting the MQTT connection with mqtt.eclipse.org.

[INFO] [MQTTDemo] [prvMQTTDemoTask:474] prvMQTTDemoTask() completed an iteration successfully. Total free heap is 231128.

[INFO] [MQTTDemo] [prvMQTTDemoTask:475] Demo completed successfully.

[INFO] [MQTTDemo] [prvMQTTDemoTask:476] Short delay before starting the next iteration....
```

## Size Information on ESP-IDF v4.3

```
Total sizes:
 DRAM .data size:   17356 bytes
 DRAM .bss  size:   16824 bytes
Used static DRAM:   34180 bytes ( 146556 available, 18.9% used)
Used static IRAM:   87734 bytes (  43338 available, 66.9% used)
      Flash code:  579803 bytes
    Flash rodata:  120888 bytes
Total image size:~ 805781 bytes (.bin may be padded larger)
```