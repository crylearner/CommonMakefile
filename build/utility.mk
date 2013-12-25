
include $(BUILD_SYSTEM_PATH)/assert.mk

## get the path of current module
#  @return current module path
define current_path
$(patsubst %/,%, \
		$(dir $(word $(words $(MAKEFILE_LIST)), $(MAKEFILE_LIST))))
endef


## hide command
#  wrap @
define hide
@
endef

## hook of how to import platform
# 如果TARGET_PLATFORM不存在，则加载$(DEFAULT_PLATFORM).mk
# platform-specs.mk用于加载额外定制的编译命令。具体使用变量PLATFORM_SPECS指定实际定制文件
define hook__import-platform
$(eval include $(if $(TARGET_PLATFORM), $(PLATFORMS_PATH)/$(TARGET_PLATFORM).mk, $(PLATFORMS_PATH)/$(DEFAULT_PLATFORM).mk)) \
$(eval include $(PLATFORMS_PATH)/platform-specs.mk)
endef