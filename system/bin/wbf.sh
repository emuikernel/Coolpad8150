echo  "use labtool and mfg "
	cd /system/lib/modules/
	insmod mlan.ko
	insmod  sd8787.ko "mfg_mode=1 drv_mode=1 fw_name=mrvl/sd8787.bin"
	insmod bt8787.ko
	cd  /system/bin
	chmod 777   mfgbridge
	chmod 777   bridge_init.conf
	echo 1 >/sys/class/rfkill/rfkill0/state
	hciconfig hci0 up
	ifconfig usb0 192.168.1.101 up
	./mfgbridge 
