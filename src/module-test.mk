# module.mk
#
# Created on: 2013-12-21
#     Author: lenovo

MODULE_PATH			:= $(call current_path)
MODULE_NAME			:= test

## 定义product定制文件
PRODUCT_SPECS 		:= #TODO
## 定义platform定制文件
PLATFORM_SPECS 		:= #TODO
## 定义target定制文件
TARGET_SPECS 		:= #TODO

## 生成产品、平台相关的信息，在此之前不要使用相关的变量，如CXX， CPPFLAGS，会直接覆盖。
include $(BUILD_CONFIGURE)

## 定义源文件列表
SRC_FILES:= $(MODULE_PATH)/gtest_main.cpp
CXXFLAGS += -Iinc
LDLIBS += lib/libgtest.a lib/hellotest.a

## 调用目标编译规则
$(call build_target,$(BUILD_EXECUTABLE))