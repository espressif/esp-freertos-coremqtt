#
# Component Makefile
#

set (includes)
set (srcs)
set (priv_includes)

list(APPEND includes
    "coreMQTT/source/include"
    "coreMQTT/source/interface"
    "port/include"
    "port/exponential_backoff"
    "port/logging"
    "port/network_transport"
    "port/platform"
    )

list(APPEND srcs
    "coreMQTT/source/core_mqtt_serializer.c"
    "coreMQTT/source/core_mqtt_state.c"
    "coreMQTT/source/core_mqtt.c"
    "port/exponential_backoff/exponential_backoff.c"
    "port/network_transport/tls_freertos.c"
    "port/platform/platform.c"
    )

idf_component_register(SRCS "${srcs}"
                    INCLUDE_DIRS ${includes}
                    PRIV_INCLUDE_DIRS ${priv_includes}
                    REQUIRES lwip nghttp mbedtls tcp_transport)
