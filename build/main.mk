# main.mk
#
# Created on: 2013-12-20
#     Author: lenovo

## 约定俗成，大家已经习惯性的总是将all默认的make终极目标。
## 在这个例子中，就是生成hello.exe 
.PHONY : all clean distclean
all:


## 定义一些全局使用的固定常量
PRODUCTS_PATH			:=$(BUILD_SYSTEM_PATH)/products
PLATFORMS_PATH			:=$(BUILD_SYSTEM_PATH)/platforms
SYSTEMS_PATH			:=$(BUILD_SYSTEM_PATH)/systems
TARGETS_PATH			:=$(BUILD_SYSTEM_PATH)/targets
PATH_SPECS				:=$(BUILD_SYSTEM_PATH)/path.mk

BUILD_CONFIGURE := $(BUILD_SYSTEM_PATH)/config.mk

BUILD_EXECUTABLE 		:=$(TARGETS_PATH)/executable.mk
BUILD_STATIC_LIBRARY 	:=$(TARGETS_PATH)/static-library.mk
BUILD_SHARED_LIBRARY	:=$(TARGETS_PATH)/shared-library.mk

## 导入通用工具函数
include $(BUILD_SYSTEM_PATH)/utility.mk


## 调用哪个模块mk,就编译哪个模块。也可以同时将多个模块导入
ifneq "$(SHOT_MODULE)" ""
include $(SHOT_MODULE)
else
#include src/hello/module.mk src/module.mk
include test/module.mk src/hello/module.mk src/module.mk src/module-test.mk src/hello/module-test.mk
endif
