# main.mk
#
# Created on: 2013-12-20
#     Author: lenovo

## 约定俗成，大家已经习惯性的总是将all默认的make终极目标。
## 在这个例子中，就是生成hello.exe 
.PHONY : all clean
all:

include build/utility.mk

## 调用哪个模块mk,就编译哪个模块。
## 也可以同时将多个模块导入
include src/hello/module.mk src/module.mk 
