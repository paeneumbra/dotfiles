# Archlinux installation

Documenting steps taken in hopes of a reproducible installation

Based on [archlinux documentation](https://wiki.archlinux.org/title/Installation_guide)

## ISO

- <https://wiki.archlinux.org/title/USB_flash_installation_medium#Using_basic_command_line_utilities>

Download archlinux ISO, and create a installation ISO

```shell
dd bs=4M if={{path/to/archlinux-version-x86_64.iso}} of={{/dev/disk/by-id/usb-My_flash_drive}} conv=fsync oflag=direct status=progress
```

Example

```shell
dd bs=4M if=Downloads/archlinux-2024.11.01-x86_64.iso of=/dev/sdb conv=fsync oflag=direct status=progress
```

## Validate UEFI

```shell
cat /sys/firmware/efi/fw_platform_size
```

Should return `64`

## Wireless

Launch `iwctl`

```shell
station wlan0 scan
station wlan0 get-networks
station wlan0 connect {{SSID}}
```

Test connection

```shell
ping -c 3 archlinux.org
```
