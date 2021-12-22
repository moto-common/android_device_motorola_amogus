ifeq (holi,$(PRODUCT_PLATFORM))

LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles)

$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr: $(wildcard $(PRODUCT_VENDOR_KERNEL_HEADERS)/*)
	rm -rf $@
	mkdir -p $@/include
	cp -a $(PRODUCT_VENDOR_KERNEL_HEADERS)/. $@/include

endif
