ARCHS = armv7 arm64 arm64e

SDK = iPhoneOS12.1.2
FINALPACKAGE = 1
THEOS_DEVICE_IP = 10.0.0.12

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SoundLock
SoundLock_FILES = Tweak.xm
SoundLock_FRAMEWORKS = UIKit CoreGraphics AVFoundation AudioToolbox
SoundLock_EXTRA_FRAMEWORKS += Cephei
SoundLock += -Wl,-segalign,4000
SoundLock_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += soundlock
include $(THEOS_MAKE_PATH)/aggregate.mk
