# config.mk
#
# Created on: 2013-11-14
#     Author: lenovo

DEFAULT_PLATFORM := $(strip x86-linux)
DEFAULT_PRODUCT  := $(strip Sample)

PRODUCTS_PATH	:=$(BUILD_SYSTEM_PATH)/products
PLATFORMS_PATH	:=$(BUILD_SYSTEM_PATH)/platforms
SYSTEMS_PATH	:=$(BUILD_SYSTEM_PATH)/systems
TARGETS_PATH	:=$(BUILD_SYSTEM_PATH)/targets
PATHS_PATH 		:=$(BUILD_SYSTEM_PATH)/paths

BUILD_EXECUTABLE := $(TARGETS_PATH)/executable.mk
BUILD_STATIC_LIBRARY := $(TARGETS_PATH)/static_library.mk
BUILD_SHARED_LIBRARY := $(TARGETS_PATH)/shared_library.mk

