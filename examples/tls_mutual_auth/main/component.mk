#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

COMPONENT_EMBED_TXTFILES := client.crt client.key root_cert_auth.pem

COMPONENT_ADD_INCLUDEDIRS += utilities
COMPONENT_SRCDIRS += utilities