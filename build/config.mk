# config.mk
#
# Created on: 2013-11-14
#     Author: lenovo

DEFAULT_PLATFORM 		:= x86-linux
DEFAULT_PRODUCT  		:= Sample
DEFAULT_BUILD_TYPE		:= debug
ifeq "$(TARGET_BUILD_TYPE)" ""
TARGET_BUILD_TYPE=debug
endif

PRODUCTS_PATH			:=$(BUILD_SYSTEM_PATH)/products
PLATFORMS_PATH			:=$(BUILD_SYSTEM_PATH)/platforms
SYSTEMS_PATH			:=$(BUILD_SYSTEM_PATH)/systems
TARGETS_PATH			:=$(BUILD_SYSTEM_PATH)/targets
PATH_SPECS				:=$(BUILD_SYSTEM_PATH)/path.mk

BUILD_EXECUTABLE 		:=$(TARGETS_PATH)/executable.mk
BUILD_STATIC_LIBRARY 	:=$(TARGETS_PATH)/static-library.mk
BUILD_SHARED_LIBRARY	:=$(TARGETS_PATH)/shared-library.mk


## define how to import product
## vendor，version等产品信息定义在vendor.mk
## 各种特性开关定义在features.mk
## 加载额外定制的产品配置,product-specs.mk,实际是依次加载变量PRODUCT_SPECS指定的文件列表
define import_product
$(eval include $(if $(TARGET_PRODUCT), $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/vendor.mk \
                                       $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/features.mk \
                                       $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/product-specs.mk, \
                                       $(PRODUCTS_PATH)/$(DEFAULT_PRODUCT)/vendor.mk \
                                       $(PRODUCTS_PATH)/$(DEFAULT_PRODUCT)/features.mk \
                                       $(PRODUCTS_PATH)/$(DEFAULT_PRODUCT)/product-specs.mk))
endef

## define how to import platform
# 如果TARGET_PLATFORM不存在，则加载$(DEFAULT_PLATFORM).mk
# platform-specs.mk用于加载额外定制的编译命令。实际是依次加载变量PLATFORM_SPECS指定的文件列表
define import_platform
$(eval include $(if $(TARGET_PLATFORM), $(PLATFORMS_PATH)/$(TARGET_PLATFORM).mk, $(PLATFORMS_PATH)/$(DEFAULT_PLATFORM).mk)) \
$(eval include $(PLATFORMS_PATH)/platform-specs.mk)
endef


##build target <target class> <target>
# 做一些必要条件检查， 如果target没有指定，则设定默认TARGET名字
# $1 指定编译可执行文件，或者lib，或者so
# $2 指定生成的目标文件名称，如果没有指定，则会设定默认名字。
define build_target
$(info $1  $2) \
$(call assert_not_null, $(INTERMEDIATE_OBJ_PATH), INTERMEDIATE_OBJ_PATH is not set) \
$(call assert_not_null, $(INTERMEDIATE_LIB_PATH), INTERMEDIATE_LIB_PATH is not set) \
$(call assert_not_null, $(INTERMEDIATE_BIN_PATH), INTERMEDIATE_BIN_PATH is not set) \
$(call expect_not_null, $(SRC_FILES), no source file is included) \
$(if $(strip $2),\
	$(eval TARGET :=$(strip $2)), \
	$(if $(call equals, $1, $(BUILD_EXECUTABLE)), $(eval TARGET := $(INTERMEDIATE_BIN_PATH)/$(MODULE_NAME))) \
	$(if $(call equals, $1, $(BUILD_STATIC_LIBRARY)), $(eval TARGET := $(INTERMEDIATE_LIB_PATH)/$(MODULE_NAME).a)) \
	$(if $(call equals, $1, $(BUILD_SHARED_LIBRARY)), $(eval TARGET := $(INTERMEDIATE_LIB_PATH)/$(MODULE_NAME).so)) \
	) \
$(eval include $1)
endef
