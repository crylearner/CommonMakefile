# target-specs.mk
#
# Created on: 2013-12-24
#     Author: lenovo

## 逐个加载TARGET_SPECS指定的mk文。提供一种可定制化产品信息的方法
$(foreach specfile, $(TARGET_SPECS), $(eval -include $(specfile)))