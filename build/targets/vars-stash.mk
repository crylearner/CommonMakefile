# vars-stash.mk
#
# Created on: 2013-12-23
#     Author: lenovo
$(info ALL_TARGETS=$(ALL_TARGETS))
$(ALL_TARGETS) : AR       := $(AR)
$(ALL_TARGETS) : ARFLAGS  := $(ARFLAGS)
$(ALL_TARGETS) : ARLIBS   := $(ARFLAGS)

$(ALL_TARGETS) : CC       := $(CC)
$(ALL_TARGETS) : CPP      := $(CPP)
$(ALL_TARGETS) : CXX      := $(CXX)
$(ALL_TARGETS) : CFLAGS   := $(CFLAGS)
$(ALL_TARGETS) : CPPFLAGS := $(CPPFLAGS)
$(ALL_TARGETS) : CXXFLAGS := $(CXXFLAGS)

$(ALL_TARGETS) : LD       := $(LD)
$(ALL_TARGETS) : LDLIBS   := $(LDLIBS)
$(ALL_TARGETS) : LDFLAGS  := $(LDFLAGS)

$(ALL_TARGETS) : OBJS  := $(OBJS)
$(ALL_TARGETS) : DEPS  := $(DEPS)
$(ALL_TARGETS) : TARGET  := $(TARGET)