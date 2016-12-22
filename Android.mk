LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        main.c      
LOCAL_MODULE := vpu_apiDemo

LOCAL_STATIC_LIBRARIES :=
		
LOCAL_SHARED_LIBRARIES := \
	libvpu \
	libcutils \
	liblog \
	libdl 
			     
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(TOP)/hardware/rk29/libon2/ \
	$(TOP)/hardware/rockchip/librkvpu \

ifeq ($(PLATFORM_VERSION),4.0.4)
	LOCAL_CFLAGS := -DAVS40
endif

ifeq ($(PLATFORM_VERSION),4.4.4)
   LOCAL_SHARED_LIBRARIES += librk_on2   
else
       LOCAL_SHARED_LIBRARIES += librk_vpuapi
       LOCAL_CFLAGS += -DRKVPU    
endif

LOCAL_32_BIT_ONLY := true
	
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -DOSCL_IMPORT_REF= -DOSCL_UNUSED_ARG= -DOSCL_EXPORT_REF=

include $(BUILD_EXECUTABLE)
