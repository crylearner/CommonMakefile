# main.mk
#
# Created on: 2013-12-20
#     Author: lenovo

include build/systems/system.mk

## 定义产品信息。这里BUILD_SPECS设置为spec.mk
PRODUCT_SPECS :=build/spec.mk
include build/products/product.mk

## 定义平台相关的编译命令。这里PLATFORM_SPECS为空，表示我们不做额外定制化。
PLATFORM_SPECS :=
include build/platforms/platform.mk

## 将产品信息中的定义的feature与平台定义的编译选项混合
CXXFLAGS+=$(OPTIONS)


SRC_FILES:= hello.cpp main.cpp
OBJS:=$(SRC_FILES:.cpp=.o)
DEPS:=$(OBJS:.o=.d)
TARGET:=hello.exe

## -MMD 可以用于自动生成头文件依赖关系
%.o : %.cpp
	$(CXX) $(CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@" 

ifneq "$(MAKECMDGOALS)" "clean"
-include $(DEPS)
endif
	
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
	$(RM) $(TARGET) $(OBJS) $(DEPS)