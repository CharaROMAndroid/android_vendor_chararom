PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
# Android base version
ANDROID_VERSION := 16

# CharaROM versioning
CHARAROM_VERSION := 1.0
CHARAROM_CODENAME := Hershey
CHARAROM_STATUS := Alpha

# Build date (append time if requested)
ifeq ($(LINEAGE_VERSION_APPEND_TIME_OF_DAY),true)
    LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Determine build type (compatible with Jenkins / RELEASE_TYPE env)
ifndef LINEAGE_BUILDTYPE
    ifdef RELEASE_TYPE
        # Strip optional "LINEAGE_" prefix
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^LINEAGE_||g')
        LINEAGE_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Default to UNOFFICIAL if build type is unrecognized
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(LINEAGE_BUILDTYPE)),)
    LINEAGE_BUILDTYPE := UNOFFICIAL
endif


# Version suffix for internal and display versions
LINEAGE_VERSION_SUFFIX := $(LINEAGE_BUILD_DATE)-$(LINEAGE_BUILDTYPE)-$(CHARAROM_STATUS)-$(LINEAGE_BUILD)

# Internal version (full)
LINEAGE_VERSION := CharaROM-v$(CHARAROM_VERSION)-Android$(ANDROID_VERSION)-$(LINEAGE_VERSION_SUFFIX)

# Display version (shown in Settings, etc.)
LINEAGE_DISPLAY_VERSION := v$(CHARAROM_VERSION)-$(LINEAGE_VERSION_SUFFIX)

# CharaROM system properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.chara.build.version=$(CHARAROM_VERSION) \
    ro.chara.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.chara.version=$(CHARAROM_VERSION) \
    ro.crdroid.build.version=$(CHARAROM_VERSION) \
    ro.chara.build.codename=$(CHARAROM_CODENAME) \
    ro.chara.status=$(CHARAROM_STATUS) \
    ro.chara.build.status=$(LINEAGE_BUILDTYPE)\
    ro.chararom.device=$(LINEAGE_BUILD)