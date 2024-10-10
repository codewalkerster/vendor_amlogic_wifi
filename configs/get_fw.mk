WIFI_MODULE := $(shell cat $(TOP_DIR)/driver_modules/wifi_bt/wifi/configs/wifi_module_list.bzl)

WIFI_FW_LIST_FILE := $(TOP_DIR)/driver_modules/wifi_bt/wifi/configs/wifi_fw_list.txt

ifneq ($(findstring w1,$(WIFI_MODULE)),)
	W1_TXT := driver_modules/wifi_bt/wifi/amlogic/w1/wifi/project_w1/vmac/*.txt:wifi/w1/
endif

ifneq ($(findstring w1u,$(WIFI_MODULE)),)
	W1U_FW := driver_modules/wifi_bt/wifi/amlogic/w1u/project_w1u/vmac/*.bin:wifi/
	W1U_TXT := driver_modules/wifi_bt/wifi/amlogic/w1u/project_w1u/vmac/*.txt:wifi/w1u/
endif

ifneq ($(findstring w2,$(WIFI_MODULE)),)
	W2_FW := driver_modules/wifi_bt/wifi/amlogic/w2/common/*.bin:wifi/
	W2_TXT := driver_modules/wifi_bt/wifi/amlogic/w2/common/*.txt:wifi/
endif

ifneq ($(findstring w2l,$(WIFI_MODULE)),)
	W2L_FW := driver_modules/wifi_bt/wifi/amlogic/w2l/common/*.bin:wifi/w2l/
	W2L_TXT := driver_modules/wifi_bt/wifi/amlogic/w2l/common/*.txt:wifi/w2l/
endif

all:
	@echo "" > ${WIFI_FW_LIST_FILE}
	@echo ${W1_TXT} >> ${WIFI_FW_LIST_FILE}
	@echo ${W1U_FW} >> ${WIFI_FW_LIST_FILE}
	@echo ${W1U_TXT} >> ${WIFI_FW_LIST_FILE}
	@echo ${W2_FW} >> ${WIFI_FW_LIST_FILE}
	@echo ${W2_TXT} >> ${WIFI_FW_LIST_FILE}
	@echo ${W2L_FW} >> ${WIFI_FW_LIST_FILE}
	@echo ${W2L_TXT} >> ${WIFI_FW_LIST_FILE}
