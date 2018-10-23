KDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default: modules

modules modules_install clean mrproper:
	$(MAKE) -C $(KDIR) M=$(PWD) $@
