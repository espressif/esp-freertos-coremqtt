# ESP32-C3-DevKitM-1 Getting Started Guide for AWS IoT Core

## Table of Contents

1. [Document Information](#1-document-information)
2. [Overview](#2-overview)
3. [Hardware Description](#3-hardware-description) 
4. [Set up your Development Environment](#4-set-up-your-development-environment)
5. [Set up your hardware](#5-set-up-your-hardware)
6. [Setup your AWS account and Permissions](#6-setup-your-aws-account-and-permissions) 
7. [Create Resources in AWS IoT](#7-create-resources-in-aws-iot) 
8. [Provision the Device with credentials](#8-provision-the-device-with-credentials) 
9. [Build your first project](#9-build-your-first-project) 
10. [Run the demo](#10-run-the-demo)
12. [Debugging](#11-debugging)
13. [Troubleshooting](#12-troubleshooting)

# 1. Document Information
## 1.1 Naming Conventions
None
## 1.2 Glossary
None
## 1.3 Revision History (Version, Date, Description of change)
0.1	25-Feb-2021	Initial Draft
# 2. Overview
This user guide will help you get started with your ESP chip and AWS IoT.

# 3. Hardware Description
# 4. Set up your Development Environment
# 5. Set up your hardware
For steps 3 to 5, follow the link for your specific chip:
[ESP32-C3](esp32-c3.md)
[ESP32-S2](esp32-s2.md)

# 6. Setup your AWS account and Permissions
Refer to the instructions at [Set up your AWS Account](https://docs.aws.amazon.com/iot/latest/developerguide/setting-up.html).  Follow the steps outlined in these sections to create your account and a user and get started:

- Sign up for an AWS account and 
- Create a user and grant permissions. 
- Open the AWS IoT console

Pay special attention to the Notes.

# 7. Create Resources in AWS IoT
Refer to the instructions at [Create AWS IoT Resources](https://docs.aws.amazon.com/iot/latest/developerguide/create-iot-resources.html).  Follow the steps outlined in these sections to provision resources for your device:

- Create an AWS IoT Policy
- Create a thing object and certificate
- Download each of the certificate and key files and save them for later.
This will be needed in the next step.

Pay special attention to the Notes.

# 8. Provision the Device with credentials

Ensure that you have downloaded the device certificate and key files in the previous step.

- In order to load the Device certificate, copy the contents of the Device certificate file to the file named `client.crt` in the main folder.
- In order to load the Private key, copy the contents of the private key file to the file named `client.key` in the main folder.
- In order to load the Root CA certificate, copy the contents of the file `AmazonRootCA1.pem` obtained from [here](https://docs.aws.amazon.com/iot/latest/developerguide/server-authentication.html#server-authentication-certs) to the file named `root_cert_auth.pem` in the main folder.


# 9. Build your first project
Refer to the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/index.html#creating-your-first-project) to:

- Start a Project
- Connect Your Device
- Configure
- Build the Project
- Flash onto the device

# 10. Run the demo

## 10.1 Set the target chip to your chip

```
idf.py set-target <target>
# choose between esp32s2, esp32c3
```
> **_NOTE:_**  When viewing any documentation page from ESP-IDF docs, please ensure that you have selected the correct chip.

## 10.2 Configuring the demo example

* Open the project configuration menu (`idf.py menuconfig`)
* Configure Wi-Fi or Ethernet under "Example Connection Configuration" menu. See "Establishing Wi-Fi or Ethernet Connection" section in [examples/protocols/README.md](../../README.md) for more details.
* Configure MQTT client identifier, broker endpoint and port under "Example Configuration" menu.
* When using Make build system, set `Default serial port` under `Serial flasher config`.

## 10.3 Running the application

Build the project and flash it to the board, then run monitor tool to view serial output:

```
idf.py -p PORT flash monitor
```

(To exit the serial monitor, type ``Ctrl-]``.)

To ensure your application is running correctly, refer to the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/index.html#step-10-monitor).

# 11. Debugging

## 11.1 View device console output
Refer to the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/index.html#step-10-monitor).

## 11.2 Debugging Examples

Refer to the examples given [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-guides/jtag-debugging/index.html#jtag-debugging-examples) for [Using the debugger](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-guides/jtag-debugging/using-debugger.html).

## 11.3 Example Output
```
I (2447) example_connect: Got IPv6 event: Interface "example_connect: sta" address: fe80:0000:0000:0000:7edf:a1ff:fe40:2018, type: ESP_IP6_ADDR_IS_LINK_LOCAL
I (6447) esp_netif_handlers: example_connect: sta ip: 192.168.1.41, mask: 255.255.255.0, gw: 192.168.1.1
I (6447) example_connect: Got IPv4 event: Interface "example_connect: sta" address: 192.168.1.41
I (6457) example_connect: Connected to example_connect: sta
I (6457) example_connect: - IPv4 address: 192.168.1.41
I (6467) example_connect: - IPv6 address: fe80:0000:0000:0000:7edf:a1ff:fe40:2018, type: ESP_IP6_ADDR_IS_LINK_LOCAL
[INFO] [MQTTDemo] [prvConnectToServerWithBackoffRetries:614] Creating a TLS connection to t37g78e7jrczce.deviceadvisor.iot.us-east-1.amazonaws.com:8883.

W (6507) wifi:<ba-add>idx:0 (ifx:0, 7c:a9:6b:4f:6a:15), tid:0, ssn:5, winSize:64
I (9507) tls_freertos: (Network connection 0x3fca6a84) Connection to t37g78e7jrczce.deviceadvisor.iot.us-east-1.amazonaws.com established.
[INFO] [MQTTDemo] [prvMQTTDemoTask:498] Creating an MQTT connection to t37g78e7jrczce.deviceadvisor.iot.us-east-1.amazonaws.com.

[INFO] [MQTTDemo] [prvCreateMQTTConnectionWithBroker:714] An MQTT connection is established with t37g78e7jrczce.deviceadvisor.iot.us-east-1.amazonaws.com.
[INFO] [MQTTDemo] [prvMQTTSubscribeWithBackoffRetries:772] Attempt to subscribe to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTSubscribeWithBackoffRetries:779] SUBSCRIBE sent for topic testClient/example/topic to broker.


[INFO] [MQTTDemo] [prvMQTTProcessResponse:903] Subscribed to the topic testClient/example/topic with maximum QoS 1.

[INFO] [MQTTDemo] [prvMQTTDemoTask:512] Publish to the MQTT topic testClient/example/topic.

[INFO] [MQTTDemo] [prvMQTTDemoTask:518] Attempt to receive publish message from broker.
```

## 11.4 Logging with different Debug Levels and Interpreting Errors
Please refer to following pages for:
- [Logging library](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-reference/system/log.html)
- [Error Code Reference](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-reference/error-codes.html#error-codes-reference)

## 11.5 Debugging using Software and Hardware debuggers
Please follow the steps mentioned [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-guides/jtag-debugging/index.html).

# 12 Troubleshooting
Refer to [Flashing Issues](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/index.html#encountered-issues-while-flashing).