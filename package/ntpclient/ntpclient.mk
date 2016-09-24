NTPCLIENT_VERSION = 2015_365
NTPCLIENT_SOURCE = ntpclient_$(NTPCLIENT_VERSION).tar.gz
NTPCLIENT_SITE = http://doolittle.icarus.com/ntpclient
NTPCLIENT_DEPENDENCIES = uclibc
NTPCLIENT_BINARY = ntpclient

define NTPCLIENT_BUILD_CMDS
	$(MAKE) GCC="$(TARGET_CC)" CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(@D) all
endef

define NTPCLIENT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/$(NTPCLIENT_BINARY) $(TARGET_DIR)/usr/local/bin/$(NTPCLIENT_BINARY)
endef
	

$(eval $(generic-package))
