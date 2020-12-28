#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

COMPONENT_EMBED_TXTFILES := mqtt_eclipse_org.pem

COMPONENT_ADD_INCLUDEDIRS += utilities
COMPONENT_SRCDIRS += utilities