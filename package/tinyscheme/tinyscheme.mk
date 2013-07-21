#############################################################
#
# tinyscheme
#
#############################################################

TINYSCHEME_VERSION = 1.41
TINYSCHEME_SITE = http://downloads.sourceforge.net/project/tinyscheme/tinyscheme/tinyscheme-$(TINYSCHEME_VERSION)
TINYSCHEME_SOURCE = tinyscheme-$(TINYSCHEME_VERSION).tar.gz

define TINYSCHEME_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
        CC="$(TARGET_CC)" \
        LD="$(TARGET_CC)"
endef

define TINYSCHEME_INSTALL_TARGET_CMDS
# bin
    $(INSTALL) -m 0755 -D $(@D)/scheme $(TARGET_DIR)/usr/bin/tinyscheme
# lib
    $(INSTALL) -m 0755 -D $(@D)/libtinyscheme.so $(TARGET_DIR)/usr/lib/libtinyscheme.so
    $(INSTALL) -m 0755 -D $(@D)/libtinyscheme.a $(TARGET_DIR)/usr/lib/libtinyscheme.a
endef

define TINYSCHEME_UNINSTALL_TARGET_CMDS
# bin
    rm -f $(TARGET_DIR)/usr/bin/tinyscheme
# lib
    rm -rf $(TARGET_DIR)/usr/lib/libtinyscheme.{a, so}
endef

$(eval $(generic-package))
