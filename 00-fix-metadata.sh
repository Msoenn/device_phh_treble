#!/system/bin/sh
# If no real metadata partition was mounted by first-stage init,
# overlay the empty rootfs stub with tmpfs so aconfigd and other
# services that write to /metadata can function.
#
# Only on devices that have NO metadata partition. If the fstab declares
# /metadata (or a by-name/metadata partition exists) but first-stage init
# could not mount it, e.g. because it is blank after `fastboot erase
# metadata`, leave it unmounted: `mount_all --early` then formats and mounts
# it. A tmpfs here would hide the real partition for good, vold would keep
# the /data metadata-encryption key in RAM, and every boot after the first
# would fail with init_user0_failed and land in recovery.

mountpoint -q /metadata && exit 0
if [ -e /dev/block/by-name/metadata ] || \
   grep -qsE '^[^#]*[[:space:]]/metadata[[:space:]]' /vendor/etc/fstab.* /odm/etc/fstab.*; then
    echo "fix-metadata: /metadata not mounted by first-stage init; no tmpfs, leaving it to mount_all (formattable)" > /dev/kmsg
    exit 0
fi
mount -t tmpfs tmpfs /metadata -o mode=0775,uid=0,gid=1000
