# ADB Keys
ifeq ($(EXT_PERSONAL_BUILD), true)
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys \
    vendor/extra/adb_keys:recovery/root/adb_keys

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys
endif

# GApps
ifeq ($(WITH_GMS), true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
endif

# Overlay
ifeq ($(EXT_PERSONAL_BUILD), true)
PRODUCT_PACKAGES += \
    FrameworkResOverlayExtra
endif

# Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true

# SUW
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

# VBMeta
ifeq ($(EXT_PERSONAL_BUILD), true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vbmeta.digest=dc920a5bdf45ba0358830a8a1454fb7fdffea0d9cd3b72a18de11eca802e2eb7 \
    ro.boot.vbmeta.public_key_digest=76a977f7bbd07753073408b8e43f204f95b9d851c094429d1bbf43ffd1d4b9eb \
    ro.boot.vbmeta.avb_version=1.3 \
    ro.boot.vbmeta.device_state=locked \
    ro.boot.vbmeta.hash_alg=sha256 \
    ro.boot.vbmeta.invalidate_on_error=yes \
    ro.boot.vbmeta.size=5760    
endif
