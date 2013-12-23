# executable.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 编译生成obj文件的通用规则
include build/targets/object.mk
	
## 利用多规则定义，将clean目标转发给$(TARGET).clean,从而避免出现clean目标重定义的问题
## 对all，不需要额外处理，因为$(TARGET)本身就要求不同模块目标不同
all:	$(TARGET)
clean: $(TARGET).clean

## 定义可执行文件hello.exe的编译规则	
$(TARGET) :	$(OBJS) $(LIBS)
	$(LD) $(LDFLAGS)  -o $@ $^
	
## 定义 目标clean，一般就是删除所有obj文件，以及可执行文件。
.PHONY: $(TARGET).clean
$(TARGET).clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)