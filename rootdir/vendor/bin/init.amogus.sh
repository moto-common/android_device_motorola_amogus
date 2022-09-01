#!/vendor/bin/sh
device=$(getprop ro.boot.device)

# Camera
if [ "$device" = "sofia" ] || [ "$device" = "sofiar" ] || [ "$device" = "doha" ];
then
   mount -o bind /vendor/etc/camera/dual_golden_"$device".bin /vendor/etc/camera/dual_golden.bin
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
if [ "$device" = "doha" ];
then
   mount -o bind /vendor/etc/sensors/config-doha /vendor/etc/sensors/config
fi
