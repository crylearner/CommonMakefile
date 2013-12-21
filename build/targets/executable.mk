# executable.mk
#
# Created on: 2013-12-21
#     Author: lenovo

OBJS:=$(SRC_FILES:.cpp=.o)
DEPS:=$(OBJS:.o=.d)


## -MMD 可以用于自动生成头文件依赖关系
%.o : %.cpp
	$(CXX) $(CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@" 

ifneq "$(MAKECMDGOALS)" "clean"
-include $(DEPS)
endif
	
## 定义可执行文件hello.exe的编译规则	
$(TARGET):	$(OBJS)
	$(CXX) $(CXXFLAGS)  -o $@ $^


all:	$(TARGET)

## 定义 目标clean，一般就是删除所有obj文件，以及可执行文件。
clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)