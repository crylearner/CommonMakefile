## makefile 
#

## TARGET_PRODUCT, TARGET_PLATFORM应该由命令行参数输入，
## 这里为测试方便，直接在makefile中定义
TARGET_PRODUCT := 
TARGET_PLATFORM := 

## 去掉空格等字符
TARGET_PRODUCT := $(strip $(TARGET_PRODUCT))
TARGET_PLATFORM:= $(strip $(TARGET_PLATFORM))
TARGET_BUILD_TYPE:= $(strip $(TARGET_BUILD_TYPE))

BUILD_SYSTEM_PATH := build
include $(BUILD_SYSTEM_PATH)/main.mk
