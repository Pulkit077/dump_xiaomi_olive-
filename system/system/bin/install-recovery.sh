#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:6adfb6876bb4d8b4328c4b2a4ba4dc4cf6db837b > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:de32dc4615e5d999486b08fce034b3fd11523256 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:6adfb6876bb4d8b4328c4b2a4ba4dc4cf6db837b >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
