# platform.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 定义编译命
PLATFORM_NAME := x86-linux

AR := ar
ARFLAGS := -rv

CC := gcc
CPP := gcc -E
CXX := g++
CPPFLAGS := 
CFLAGS := -Wall
CXXFLAGS := -Wall

LD := $(CXX)
LDLIBS :=
LDFLAGS :=


## 加载额外定制的编译命令配置.mk
include build/platforms/platform-specs.mk