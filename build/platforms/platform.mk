# platform.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 定义编译命
PLATFORM_NAME := x86-linux

## 编译静态库
AR := ar
ARFLAGS := -rv

## 编译obj
CC := gcc
CPP := gcc -E
CXX := g++
CPPFLAGS := 
CFLAGS := -Wall
CXXFLAGS := -Wall

## 链接命令
LD := $(CXX)
LDLIBS :=
LDFLAGS :=


## 加载额外定制的编译命令配置.mk
include build/platforms/platform-specs.mk