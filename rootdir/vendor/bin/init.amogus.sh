#!/vendor/bin/sh
device=$(getprop ro.boot.device)

# Audio
setprop persist.vendor.audio.calfile0 /vendor/etc/acdbdata/"$device"/Bluetooth_cal.acdb
setprop persist.vendor.audio.calfile1 /vendor/etc/acdbdata/"$device"/General_cal.acdb
setprop persist.vendor.audio.calfile2 /vendor/etc/acdbdata/"$device"/Global_cal.acdb
setprop persist.vendor.audio.calfile3 /vendor/etc/acdbdata/"$device"/Handset_cal.acdb
setprop persist.vendor.audio.calfile4 /vendor/etc/acdbdata/"$device"/Hdmi_cal.acdb
setprop persist.vendor.audio.calfile5 /vendor/etc/acdbdata/"$device"/Headset_cal.acdb
setprop persist.vendor.audio.calfile6 /vendor/etc/acdbdata/"$device"/Speaker_cal.acdb
setprop ro.boot.product.vendor.sku "$device"

# Camera
setprop persist.vendor.camera.customer.config camera_config_"$device".xml
setprop ro.product.bevice "$device"
if [ "$device" = "sofia" ] || [ "$device" = "sofiar" ];
then
   mount -o bind /vendor/etc/camera/dual_golden_"$device".bin /vendor/etc/camera/dual_golden.bin
fi

# Density
if [ "$device" = "rav" ];
then
   setprop ro.sf.lcd_density 280
else
   setprop ro.sf.lcd_density 380
fi

# DualSim
dualsim=$(getprop ro.boot.dualsim)
if [ "$dualsim" = "true" ];
then
   setprop persist.radio.multisim.config dsds
fi

# Sensors
if [ "$device" = "sofia" ] || [ "$device" = "sofiar" ] || [ "$device" = "sofiap" ];
then
   mount -o bind /vendor/etc/sensors/config-sofia /vendor/etc/sensors/config
fi
if [ "$device" = "sofiar" ];
then
   mount -o bind /vendor/etc/sensors/config-sofiar/nicobar_ak991x_0.json /vendor/etc/sensors/config/nicobar_ak991x_0.json
   mount -o bind /vendor/etc/sensors/config-sofiar/nicobar_icm4x6xx_0-i3c.json /vendor/etc/sensors/config/nicobar_icm4x6xx_0-i3c.json
   mount -o bind /vendor/etc/sensors/config-sofiar/nicobar_lsm6dso_0.json /vendor/etc/sensors/config/nicobar_lsm6dso_0.json
   mount -o bind /vendor/etc/sensors/config-sofiar/nicobar_mn29xxx_0.json /vendor/etc/sensors/config/nicobar_mn29xxx_0.json
   mount -o bind /vendor/etc/sensors/config-sofiar/nicobar_mn59xxx_0.json /vendor/etc/sensors/config/nicobar_mn59xxx_0.json
fi
