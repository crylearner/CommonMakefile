# executable.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 编译生成obj文件的通用规则
include build/targets/object.mk
	
## 定义可执行文件hello.exe的编译规则	
$(TARGET):	$(OBJS)
	$(CXX) $(CXXFLAGS)  -o $@ $^


all:	$(TARGET)

## 定义 目标clean，一般就是删除所有obj文件，以及可执行文件。
clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)