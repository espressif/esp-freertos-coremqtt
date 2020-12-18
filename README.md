# ESP FreeRTOS CoreMQTT

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#get-started)
- [Monitoring Results](#monitoring)
- [Troubleshooting](#troubleshooting)

## Introduction

<a name="introduction"></a>

The ESP FreeRTOS CoreMQTT is based on [coreMQTT](https://github.com/FreeRTOS/coreMQTT) and enables users to connect their ESP32 based devices to any MQTT broker. It provides some examples which can help understand most common use cases.

## Getting Started

<a name="get-started"></a>

### Hardware

You will basically just need a development host and an [ESP32 development board](https://www.espressif.com/en/products/hardware/development-boards) to get started.

### Development Host Setup

This project is to be used with Espressif's IoT Development Framework, [ESP IDF](https://github.com/espressif/esp-idf). Follow these steps to get started:

- Setup ESP IDF development environment by following the steps [here](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/index.html).
- In a separate folder, clone the esp-freertos-coremqtt project as follows (please note the --recursive option, which is required to clone the various git submodules required by esp-freertos-coremqtt)

``` bash
$ git clone --recursive https://github.com/espressif/esp-freertos-coremqtt.git
```

> Note that if you ever change the branch or the git head of either esp-idf or esp-freertos-coremqtt, ensure that all the submodules of the git repo are in sync by executing `git submodule update --init --recursive`

## Monitoring Results

<a name="monitoring"></a>
 
To monitor activity on your ESP device, run:

 `$ make monitor`

## Troubleshooting
<a name="troubleshooting"></a>

1. Some common problems can be fixed by disabling the firewall.

2. You can try with the followings, if your build fails:
	- `$ git submodule update --init --recursive`
	- Check the compiler version and verify that it is the correct one for your ESP IDF version.
	- Check if the IDF_PATH is set correctly
	- Clean the project with `make clean` and if required, using `rm -rf build sdkconfig sdkconfig.old`
