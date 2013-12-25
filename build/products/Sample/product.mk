# product.mk
#
# Created on: 2013-12-20
#     Author: lenovo


## vendor，version等产品信息定义在vendor.mk
include $(PRODUCTS_PATH)/vendor.mk

## 各种特性开关定义在features.mk
include $(PRODUCTS_PATH)/features.mk

## 加载额外定制的产品配置mk
include $(PRODUCTS_PATH)/product-specs.mk