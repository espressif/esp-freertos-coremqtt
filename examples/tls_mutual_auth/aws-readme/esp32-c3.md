# ESP32-C3 Getting Started Guide for AWS IoT Core

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
11. [Debugging](#11-debugging)
12. [Troubleshooting](#12-troubleshooting)

# 1. Document Information
## 1.1 Naming Conventions
None
## 1.2 Glossary
None
## 1.3 Revision History (Version, Date, Description of change)
0.125-Feb-2021Initial Draft
# 2. Overview
This user guide will help you get started with ESP32-C3 and AWS IoT.
ESP32-C3-DevKitM-1 is an entry-level development board based on [ESP32-C3-MINI-1](https://www.espressif.com/en/products/modules), a module named for its small size. This board integrates complete Wi-Fi and Bluetooth LE functions.
Most of the I/O pins on the ESP32-C3-MINI-1 module are broken out to the pin headers on both sides of this board for easy interfacing. Developers can either connect peripherals with jumper wires or mount ESP32-C3-DevKitM-1 on a breadboard.

![ESP32-C3-DevKitM-1](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/_images/esp32-c3-devkitm-1-v1-isometric.png)

Refer to the Product Overview section in the [product data sheet](https://www.espressif.com/sites/default/files/documentation/esp32-c3_datasheet_en.pdf). 

# 3. Hardware Description
## 3.1 DataSheet
The product data sheet is available [here](https://www.espressif.com/sites/default/files/documentation/esp32-c3_datasheet_en.pdf).
## 3.2 Standard Kit Contents
Refer to the section Contents and Packaging in the [User Guide](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/hw-reference/esp32c3/user-guide-devkitm-1.html)
## 3.3 User Provided items
USB 2.0 cable (Standard A to Micro-B)
Computer running Windows, Linux or mac OS
## 3.4 3rd Party purchasable items
None
## 3.5 Additional Hardware References
Refer to the [User Guide](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/hw-reference/esp32c3/user-guide-devkitm-1.html).

# 4. Set up your Development Environment
## 4.1 Tools Installation (IDEs, Toolchains, SDKs)
You have a choice to either download and install the following software manually
- **Toolchain** to compile code for ESP32-C3
- **Build tools** - CMake and Ninja to build a full **Application** for ESP32-C3
- **ESP-IDF** that essentially contains API (software libraries and source code) for ESP32-C3 and scripts to operate the **Toolchain**
**or** get through the onboarding process using the following official plugins for integrated development environments (IDE) described in separate documents
- [Eclipse Plugin](https://github.com/espressif/idf-eclipse-plugin) ([installation link](https://github.com/espressif/idf-eclipse-plugin#installing-idf-plugin-using-update-site-url))
- [VS Code Extension](https://github.com/espressif/vscode-esp-idf-extension) ([onboarding](https://github.com/espressif/vscode-esp-idf-extension/blob/master/docs/ONBOARDING.md))

![Development of applications for ESP32-C3](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/_images/what-you-need.png)

For further instructions, refer to [Step-by-step installation.](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/index.html#installation-step-by-step)
## 4.2 Other software required to develop and debug applications for the device
Please use *install.sh* (for Linux and macOS) or *install.bat* (for Windows)* scripts provided with ESP-IDF to install required software on the development host.
## 4.3 Other pre-requisites
None.
## 4.4 Additional Software References
- [Establish Serial Connection with ESP32-C3](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/establish-serial-connection.html)
- [Build and Flash with Eclipse IDE](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/eclipse-setup.html)
- [Getting Started with VS Code IDE](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/vscode-setup.html)
- [IDF Monitor](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-guides/tools/idf-monitor.html)
- [Customized Setup of Toolchain](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/toolchain-setup-scratch.html)

# 5. Set up your hardware
[Hardware reference](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/hw-reference/esp32c3/user-guide-devkitm-1.html#hardware-reference) 

[Block diagram](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/hw-reference/esp32c3/user-guide-devkitm-1.html#block-diagram)

[Description of Components](https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/hw-reference/esp32c3/user-guide-devkitm-1.html#description-of-components)

Please refer to above links for the hardware setup. ESP32-C3-DevKit-M1 requires only a USB connection to the development host computer. The same USB connection is used for supplying the power, programming the board and getting serial console access.

The Red power LED will glow indicating the power supply to the development board.

Generally no special key-press is required to put the development board in the UART boot mode for programming. In case the Windows driver fails to put the development board, please press "BOOT" and "RST" button together and release only “RST" button first.

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
idf.py set-target esp32c3
```

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
