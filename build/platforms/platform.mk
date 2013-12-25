# platform.mk
#
# Created on: 2013-12-21
#     Author: lenovo

include $(if $(TARGET_PLATFORM), $(PLATFORMS_PATH)/$(TARGET_PLATFORM).mk, $(PLATFORMS_PATH)/$(DEFAULT_PLATFORM).mk)

## 加载额外定制的编译命令配置.mk
include $(PLATFORMS_PATH)/platform-specs.mk