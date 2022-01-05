#!/vendor/bin/sh
device=`getprop ro.boot.device`

rav()
{
    setprop ro.boot.product.vendor.sku rav
    setprop ro.sf.lcd_density 280
    setprop persist.vendor.audio.calfile0 /vendor/etc/acdbdata/rav/Bluetooth_cal.acdb
    setprop persist.vendor.audio.calfile1 /vendor/etc/acdbdata/rav/General_cal.acdb
    setprop persist.vendor.audio.calfile2 /vendor/etc/acdbdata/rav/Global_cal.acdb
    setprop persist.vendor.audio.calfile3 /vendor/etc/acdbdata/rav/Handset_cal.acdb
    setprop persist.vendor.audio.calfile4 /vendor/etc/acdbdata/rav/Hdmi_cal.acdb
    setprop persist.vendor.audio.calfile5 /vendor/etc/acdbdata/rav/Headset_cal.acdb
    setprop persist.vendor.audio.calfile6 /vendor/etc/acdbdata/rav/Speaker_cal.acdb
    mount -o bind /vendor/etc/sensors/config-rav /vendor/etc/sensors/config
    setprop persist.vendor.camera.customer.config camera_config_rav.xml
}
sofia()
{
    setprop ro.boot.product.vendor.sku sofia
    setprop ro.sf.lcd_density 380
    setprop persist.vendor.audio.calfile0 /vendor/etc/acdbdata/sofia/Bluetooth_cal.acdb
    setprop persist.vendor.audio.calfile1 /vendor/etc/acdbdata/sofia/General_cal.acdb
    setprop persist.vendor.audio.calfile2 /vendor/etc/acdbdata/sofia/Global_cal.acdb
    setprop persist.vendor.audio.calfile3 /vendor/etc/acdbdata/sofia/Handset_cal.acdb
    setprop persist.vendor.audio.calfile4 /vendor/etc/acdbdata/sofia/Hdmi_cal.acdb
    setprop persist.vendor.audio.calfile5 /vendor/etc/acdbdata/sofia/Headset_cal.acdb
    setprop persist.vendor.audio.calfile6 /vendor/etc/acdbdata/sofia/Speaker_cal.acdb
    setprop persist.vendor.camera.customer.config camera_config_sofia.xml
    mount -o bind /vendor/etc/sensors/config-sofia /vendor/etc/sensors/config
    mount -o bind /vendor/etc/camera/dual_golden_sofia.bin /vendor/etc/camera/dual_golden.bin
    mount -o bind /vendor/lib/libmmcamera_mot_ov02a_sofia.so /vendor/lib/libmmcamera_mot_ov02a.so
    moutn -o bind /vendor/lib/libmmcamera_mot_s5k4h7_sofia.so /vendor/lib/libmmcamera_mot_s5k4h7.so
}
sofiap()
{
    setprop persist.vendor.camera.customer.config camera_config_sofiap.xml
}
sofiar()
{
    mount -o bind /vendor/etc/camera/dual_golden_sofiar.bin /vendor/etc/camera/dual_golden.bin
    setprop persist.vendor.camera.customer.config camera_config_sofiar.xml
}

case "$device" in
    "rav")
    rav
    ;;
    "sofia")
    sofia
    ;;
    "sofiap")
    sofia
    sofiap
    ;;
    "sofiap_sprout")
    sofia
    sofiap
    ;;
    "sofiar")
    sofia
    sofiar
    ;;
esac

if [ $(getprop ro.boot.dualsim) == "true" ];
then
  setprop persist.radio.multisim.config dsds
fi
