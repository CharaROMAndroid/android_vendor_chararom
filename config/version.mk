PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 0

# Increase CharaROM Version with each major release.
CHARAROM_VERSION := 1.0

# Internal version
LINEAGE_VERSION := CharaROM-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(CHARAROM_VERSION)

# Display version
LINEAGE_DISPLAY_VERSION := v$(CHARAROM_VERSION)-$(shell date +%Y%m%d)

# LineageOS version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.chara.build.version=$(CHARAROM_VERSION) \
    ro.chara.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.chara.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
