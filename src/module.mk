# module.mk
#
# Created on: 2013-12-21
#     Author: lenovo

MODULE_PATH			:= $(call current_path)
MODULE_NAME			:= main

## 定义product定制文件
PRODUCT_SPECS :=
## 定义platform定制文件
PLATFORM_SPECS :=
## 定义target定制文件
TARGET_SPECS :=

include $(BUILD_CONFIGURE)

## 只要给定源文件目录以及目标hello.exe
## 调用executable.mk，就可以自动编译得到想要的可执行文件
SRC_FILES:= $(MODULE_PATH)/main.cpp
LDLIBS += src/hello/hello.a

## 定义了如何生成可执行文件的通用规则
$(call build_target,$(BUILD_EXECUTABLE))
