#    
#    file : assert.mk
#    description: assert macro
#


# assert
# @param $(1) condition
# @param $(2) fail message
define assert
$(if $(strip $(1)),$(eval ),$(error assert failed: $(strip $(2))))
endef

# assert_not_null
# @param $(1) var
define assert_not_null
$(call assert,$1,$(if $(strip $2),$2,the variable is null))
endef

# equals
# $1 is equals $2？
define equals
$(filter $(strip $(1)),$(strip $(2)))
endef

# equal assert
# @param $(1) first condition
# @param $(2) second condition
define assert_equal
$(call assert, $(call equals $1, $2), $(1) does not equals to $(2)))
endef

# expect
# @param $(1) condition
# @param $(2) fail message
define expect
$(if $(strip $(1)),$(eval ),$(error expect failed: $(strip $(2))))
endef

# expect_not_null
# @param $(1) var
define expect_not_null
$(call expect,$1,$(if $(strip $2),$2,the variable is null))
endef

# equal assert
# @param $(1) first condition
# @param $(2) second condition
define expect_equal
$(call expect, $(call equals $1, $2), $(1) does not equals to $(2)))
endef


define trace.i
$(if $(ENABLE_TRACE),$(info $1),)
endef

define trace.w
$(if $(ENABLE_TRACE),$(warning $1),)
endef

define trace.e
$(if $(ENABLE_TRACE),$(error $1),)
endef