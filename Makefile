## makefile 
#

## TARGET_PRODUCT, TARGET_PLATFORM应该由命令行参数输入，
## 这里为测试方便，直接在makefile中定义
TARGET_PRODUCT := Sample
TARGET_PLATFORM := 

BUILD_SYSTEM_PATH := build
include $(BUILD_SYSTEM_PATH)/main.mk
