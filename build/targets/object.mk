# object.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 从源文件列表中分别提取出C文件和C++文件
C_OBJS  := $(patsubst %.c, %.o, $(filter %.c, $(SRC_FILES)))
CPP_OBJS:= $(patsubst %.cpp, %.o, $(filter %.cpp, $(SRC_FILES)))
OBJS    := $(C_OBJS) $(CPP_OBJS)
DEPS    := $(OBJS:.o=.d)


## -MMD 可以用于自动生成头文件依赖关系
%.o : %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@" 
%.o : %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@" 

ifneq "$(MAKECMDGOALS)" "clean"
-include $(DEPS)
endif
