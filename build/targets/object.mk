# object.mk
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
