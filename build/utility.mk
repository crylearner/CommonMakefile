
include $(BUILD_SYSTEM_PATH)/assert.mk

## get the path of current module
#  @return current module path
define current_path
$(patsubst %/,%, \
		$(dir $(word $(words $(MAKEFILE_LIST)), $(MAKEFILE_LIST))))
endef


## hide command
#  wrap @
define hide
@
endef

		   