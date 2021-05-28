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