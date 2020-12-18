#
# Component Makefile
#

COMPONENT_ADD_INCLUDEDIRS := coreMQTT/source/include
COMPONENT_ADD_INCLUDEDIRS += coreMQTT/source/interface
COMPONENT_ADD_INCLUDEDIRS += port/include
COMPONENT_ADD_INCLUDEDIRS += port/exponential_backoff
COMPONENT_ADD_INCLUDEDIRS += port/logging
COMPONENT_ADD_INCLUDEDIRS += port/network_transport 
COMPONENT_ADD_INCLUDEDIRS += port/platform
COMPONENT_SRCDIRS := coreMQTT/source port/exponential_backoff port/network_transport port/platform
