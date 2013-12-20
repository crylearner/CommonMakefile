# main.mk
#
# Created on: 2013-12-20
#     Author: lenovo

RM:=rm -f

## 定义产品信息
PRODUCT_VENDOR:=common-mk
PRODUCT_VERSION:=1.0
## 定义产品功能的开关
OPTIONS:=-DENABLE_TALKING=1 -DPRODUCT_INFO=\"$(PRODUCT_VENDOR)-$(PRODUCT_VERSION)\"

CXX:=g++
CXXFLAGS:=-Wall $(OPTIONS)

OBJS:=hello.o main.o
TARGET:=hello.exe

## 定义obj文件的编译规则
hello.o : hello.cpp hello.h
	$(CXX) $(CXXFLAGS) -c $< -o $@
main.o : main.cpp hello.h
	$(CXX) $(CXXFLAGS) -c $< -o $@
	
## 定义可执行文件hello.exe的编译规则	
$(TARGET):	$(OBJS)
	$(CXX) $(CXXFLAGS)  -o $@ $^

## 约定俗成，大家已经习惯性的总是将all默认的make终极目标。
## 在这个例子中，就是生成hello.exe 
.PHONY : all
all:	$(TARGET)

## 定义 目标clean，一般就是删除所有obj文件，以及可执行文件。
.PHONY : clean
clean:
	$(RM) $(TARGET) $(OBJS)