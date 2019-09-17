ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SoundLock
SoundLock_FILES = $(wildcard *.mm)
SoundLock_INSTALL_PATH = /Library/PreferenceBundles
SoundLock_FRAMEWORKS = UIKit MessageUI CoreGraphics AudioToolbox AVFoundation
SoundLock_PRIVATE_FRAMEWORKS = Preferences
SoundLock_EXTRA_FRAMEWORKS += CepheiPrefs
SoundLock_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SoundLock.plist$(ECHO_END)
