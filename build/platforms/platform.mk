# platform.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 定义编译命
CXX:=g++
CXXFLAGS:=-Wall

## 加载额外定制的编译命令配置.mk
include build/platforms/platform-specs.mk