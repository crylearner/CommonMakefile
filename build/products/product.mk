# product.mk
#
# Created on: 2013-12-20
#     Author: lenovo

## 定义产品信息
PRODUCT_VENDOR:=common-mk
PRODUCT_VERSION:=1.0
## 定义产品功能的开关
OPTIONS:=-DENABLE_TALKING=1 -DPRODUCT_INFO=\"$(PRODUCT_VENDOR)-$(PRODUCT_VERSION)\"