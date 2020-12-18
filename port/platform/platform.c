// Copyright 2020 Espressif Systems (Shanghai) PTE LTD
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "platform.h"

#ifdef ESP_PLATFORM
#include "esp_system.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"

static const char *TAG = "PLATFORM";

UBaseType_t uxRand( void )
{
    return esp_random();
}

#endif
