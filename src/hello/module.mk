# module.mk
#
# Created on: 2013-12-21
#     Author: lenovo

MODULE_PATH			:= $(call current_path)
MODULE_NAME			:= hello

include $(SYSTEMS_PATH)/system.mk

## 定义产品信息。这里BUILD_SPECS设置为spec.mk
PRODUCT_SPECS :=src/hello/spec.mk
$(call import_product)

## 定义平台相关的编译命令。这里PLATFORM_SPECS为空，表示我们不做额外定制化。
PLATFORM_SPECS :=
$(call import_platform)

## 将产品信息中的定义的feature与平台定义的编译选项混合
CXXFLAGS+=$(OPTIONS) 
ifeq "$(TARGET_BUILD_TYPE)"  "debug"
  CPPFLAGS +=-DDEBUG -D__DEBUG__
endif  
include $(PATH_SPECS)

## 只要给定源文件目录以及目标hello.exe
## 调用executable.mk，就可以自动编译得到想要的可执行文件
SRC_FILES:= $(MODULE_PATH)/hello.cpp

## 定义了如何生成静态库的通用规则
$(call build_target,$(BUILD_STATIC_LIBRARY), $(MODULE_PATH)/hello.a)
