#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:67108864:8a998a0c6f0ffd07f5b64c2f5dc7254f1d63cd84; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:33554432:960a9701fd48e7d8dc20d7786bd6c7b179f05496 EMMC:/dev/block/bootdevice/by-name/recovery 8a998a0c6f0ffd07f5b64c2f5dc7254f1d63cd84 67108864 960a9701fd48e7d8dc20d7786bd6c7b179f05496:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
