
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

## hook of how to import product
## vendor，version等产品信息定义在vendor.mk
## 各种特性开关定义在features.mk
## 加载额外定制的产品配置,product-specs.mk,实际是依次加载变量PRODUCT_SPECS指定的文件列表
define hook__import-product
$(eval include $(if $(TARGET_PRODUCT), $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/vendor.mk \
                                       $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/features.mk \
                                       $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/product-specs.mk, \
                                       $(PRODUCTS_PATH)/$(DEFAULT_PRODUCT)/vendor.mk \
                                       $(PRODUCTS_PATH)/$(DEFAULT_PRODUCT)/features.mk \
                                       $(PRODUCTS_PATH)/$(DEFAULT_PRODUCT)/product-specs.mk))
endef

## hook of how to import platform
# 如果TARGET_PLATFORM不存在，则加载$(DEFAULT_PLATFORM).mk
# platform-specs.mk用于加载额外定制的编译命令。实际是依次加载变量PLATFORM_SPECS指定的文件列表
define hook__import-platform
$(eval include $(if $(TARGET_PLATFORM), $(PLATFORMS_PATH)/$(TARGET_PLATFORM).mk, $(PLATFORMS_PATH)/$(DEFAULT_PLATFORM).mk)) \
$(eval include $(PLATFORMS_PATH)/platform-specs.mk)
endef