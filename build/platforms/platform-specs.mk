# platform-specs.mk
#
# Created on: 2013-12-21
#     Author: lenovo

## 逐个加载PLATFORM_SPECS指定的mk文。提供一种可定制化产品信息的方法
$(foreach specfile, $(PLATFORM_SPECS), $(eval -include $(specfile)))