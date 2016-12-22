# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

AICP_BRANCH=n

# AICP RELEASE VERSION
AICP_VERSION_MAJOR = 12
AICP_VERSION_MINOR = 1
AICP_VERSION_MAINTENANCE =

VERSION := $(AICP_VERSION_MAJOR).$(AICP_VERSION_MINOR)$(AICP_VERSION_MAINTENANCE)

ifndef AICP_BUILDTYPE
    ifdef RELEASE_TYPE
        RELEASE_TYPE := yukkarin
        AICP_BUILDTYPE := $(RELEASE_TYPE)
    else
        AICP_BUILDTYPE := yukkarin
    endif
endif

ifdef AICP_BUILDTYPE
    ifeq ($(AICP_BUILDTYPE), RELEASE)
       AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-RELEASE-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), NIGHTLY)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), EXPERIMENTAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), yukkarin)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-yukkarin-$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-yukkarin-$(shell date -u +%Y%m%d)
endif



PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(VERSION)-yukkarin

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=0
