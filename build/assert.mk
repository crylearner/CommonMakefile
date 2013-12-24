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
  $(call assert,$1,$1 is null)
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
  $(call assert, $(call equal $1, $2), $(1) does not equals to $(2)))
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