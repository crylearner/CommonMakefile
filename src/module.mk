# module.mk
#
# Created on: 2013-12-21
#     Author: lenovo

MODULE_PATH			:= $(call current_path)
MODULE_NAME			:= main

## 定义产品信息。这里BUILD_SPECS设置为spec.mk
PRODUCT_SPECS :=
## 定义平台相关的编译命令。这里PLATFORM_SPECS为空，表示我们不做额外定制化。
PLATFORM_SPECS :=
include $(BUILD_CONFIGURE)

## 只要给定源文件目录以及目标hello.exe
## 调用executable.mk，就可以自动编译得到想要的可执行文件
SRC_FILES:= $(MODULE_PATH)/main.cpp
LDLIBS += src/hello/hello.a

## 定义了如何生成可执行文件的通用规则
$(call build_target,$(BUILD_EXECUTABLE))
