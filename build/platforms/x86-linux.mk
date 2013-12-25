# x86-linux.mk
#
# Created on: 2013-12-25
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