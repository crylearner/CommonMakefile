# config.mk
#
# Created on: 2013-11-14
#     Author: lenovo

############################################################################
############################################################################

## define how to import system info
define import_system
$(eval include $(SYSTEMS_PATH)/system.mk)
endef

## define how to import product
## vendor，version等产品信息定义在vendor.mk
## 各种特性开关定义在features.mk
## 加载额外定制的产品配置,product-specs.mk,实际是依次加载变量PRODUCT_SPECS指定的文件列表
define import_product
$(eval include $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/vendor.mk \
               $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/features.mk \
               $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/product-specs.mk)
endef

## define how to import platform
# platform-specs.mk用于加载额外定制的编译命令。实际是依次加载变量PLATFORM_SPECS指定的文件列表
define import_platform
$(eval include $(PLATFORMS_PATH)/$(TARGET_PLATFORM).mk \
               $(PLATFORMS_PATH)/platform-specs.mk)
endef


##build target <target class> <target>
# 做一些必要条件检查， 如果target没有指定，则设定默认TARGET名字
# $1 指定编译可执行文件，或者lib，或者so
# $2 指定生成的目标文件名称，如果没有指定，则会设定默认名字。
define build_target
$(call assert_not_null, $(INTERMEDIATE_OBJ_PATH), INTERMEDIATE_OBJ_PATH is not set) \
$(call assert_not_null, $(INTERMEDIATE_LIB_PATH), INTERMEDIATE_LIB_PATH is not set) \
$(call assert_not_null, $(INTERMEDIATE_BIN_PATH), INTERMEDIATE_BIN_PATH is not set) \
$(call expect_not_null, $(SRC_FILES), no source file is included) \
$(if $(strip $2),\
	$(eval TARGET :=$(strip $2)), \
	$(if $(call equals, $1, $(BUILD_EXECUTABLE)), $(eval TARGET := $(INTERMEDIATE_BIN_PATH)/$(MODULE_NAME))) \
	$(if $(call equals, $1, $(BUILD_STATIC_LIBRARY)), $(eval TARGET := $(INTERMEDIATE_LIB_PATH)/$(MODULE_NAME).a)) \
	$(if $(call equals, $1, $(BUILD_SHARED_LIBRARY)), $(eval TARGET := $(INTERMEDIATE_LIB_PATH)/lib$(MODULE_NAME).so)) \
	) \
$(eval include $1 \
               $(TARGETS_PATH)/target-specs.mk)
endef




##############################################################################################
##############################################################################################

## 配置默认编译产品，默认编译平台，默认debug版本
DEFAULT_PRODUCT  		:= Sample
DEFAULT_PLATFORM 		:= x86-linux
DEFAULT_BUILD_TYPE		:= debug
TARGET_PRODUCT		:=$(if $(TARGET_PRODUCT),$(TARGET_PRODUCT),$(DEFAULT_PRODUCT))
TARGET_PLATFORM		:=$(if $(TARGET_PLATFORM),$(TARGET_PLATFORM),$(DEFAULT_PLATFORM))
TARGET_BUILD_TYPE	:=$(if $(TARGET_BUILD_TYPE),$(TARGET_BUILD_TYPE),$(DEFAULT_BUILD_TYPE))

## 导入需要的产品信息、编译平台信息
$(call import_system)
$(call import_product)
$(call import_platform)

## 将产品信息中的定义的feature与平台定义的编译选项混合
CPPFLAGS+=$(OPTIONS)
## 如果是debug版本，打开debug宏
ifeq "$(BUILD_TYPE)"  "debug"
CPPFLAGS +=-DDEBUG -D__DEBUG__
endif

## 导入中间文件路径配置
#ENABLE_PLATFORM_SUFFIX
include $(PATH_SPECS)
