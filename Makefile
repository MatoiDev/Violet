export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.6
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk

INSTALL_TARGET_PROCESSES = SpringBoard

TWEAK_NAME = Violet

Violet_FILES = Violet.x
Violet_CFLAGS = -fobjc-arc
Violet_FRAMEWORKS = UIKit
Violet_EXTRA_FRAMEWORKS += Cephei

SUBPROJECTS += violetpreferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

