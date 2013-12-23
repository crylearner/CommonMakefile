# module.mk
#
# Created on: 2013-12-21
#     Author: lenovo

include build/systems/system.mk

## 定义产品信息。这里BUILD_SPECS设置为spec.mk
PRODUCT_SPECS :=src/hello/spec.mk
include build/products/product.mk

## 定义平台相关的编译命令。这里PLATFORM_SPECS为空，表示我们不做额外定制化。
PLATFORM_SPECS :=
include build/platforms/platform.mk

## 将产品信息中的定义的feature与平台定义的编译选项混合
CXXFLAGS+=$(OPTIONS)

## 只要给定源文件目录以及目标hello.exe
## 调用executable.mk，就可以自动编译得到想要的可执行文件
SRC_FILES:= src/hello/hello.cpp
TARGET:= src/hello/hello.a

## 定义了如何生成静态库的通用规则
include build/targets/static-library.mk
