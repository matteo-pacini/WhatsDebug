THEOS_DEVICE_IP = 192.168.1.9

ARCHS=armv7 armv7s arm64
TARGET_CC = xcrun -sdk iphoneos clang 
TARGET_CXX = xcrun -sdk iphoneos clang++
TARGET_LD = xcrun -sdk iphoneos clang++
SHARED_CFLAGS = -fobjc-arc

TARGET = iphone:clang:8.1:8.0

include theos/makefiles/common.mk

TWEAK_NAME = WhatsDebug
WhatsDebug_FILES = Tweak.xm
WhatsDebug_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 WhatsApp"
