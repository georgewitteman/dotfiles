# Installing Arch Linux

## Verify the boot mode
```sh
ls /sys/firmware/efi/efivars
```

## Update the system clock
```sh
timedatectl set-ntp true
```

## Partition the disks
Get the correct disk with `fdisk -l`

### Partition table
Make sure the partition table is `gpt`. Use `fdisk`. It has a useful help command. There should be 3 partitions:
1. **EFI system partition:** This is the required EFI partition. Set to 512MB.
1. **Linux swap:** More than 512MB.
1. **Linux x86-64 root:** Remainder of the device.

## Format the partitions
```sh
mkfs.fat -F 32 /dev/PARTITION

mkswap /dev/PARTITION
swapon /dev/PARTITION

mkfs.ext4 /dev/PARTITION
```

## Mount the file systems
```sh
mount /dev/ROOT_PARTITION /mnt
mkdir -p /mnt/boot
mount /dev/EFI_PARTITION /mnt/boot
```

## Reflector command
Use reflector to get a list of the fastest mirrors for installation.
```sh
pacman -Syy
pacman -S reflector
reflector --verbose --country 'United States' --latest 200 --age 24 --sort rate --fastest 25 --save /etc/pacman.d/mirrorlist
```

## Install essential packages
```sh
pacstrap /mnt base linux linux-firmware vim dhcpcd man-db man-pages openssh opendoas reflector
```

## Generate `/etc/fstab`
**SKIPPING THIS BECAUSE I'M GOING TO TRY USING SYSTEMD**
Note: I'm overwriting the file here, which is different from the official installation guide, which uses `>>` to append.
```sh
# -U for UUIDs, -L for labels
genfstab -U /mnt > /mnt/etc/fstab
```

## Chroot
```sh
arch-chroot /mnt
```

## Time zone
```sh
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc
```

## Localization
### `locale-gen`
Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`. Then run `locale-gen` to generate the locales.

### `/etc/locale.conf`
```
LANG=en_US.UTF-8
```

### Test Locale
Run `locale` and everything should output normally (i.e. there are no errors).

## Network Configuration
### `/etc/hostname`
```
myhostname
```

### `/etc/hosts`
```
127.0.0.1    localhost
::1          localhost
127.0.0.1    myhostname.localdomain scott
```

## Set the root password
```sh
passwd
```

## Re-run above `reflector` command
See above.

## Enable dhcpcd
```sh
systemctl enable dhcpcd.service
```

## Install a bootloader (EFISTUB)
**TRYING OUT systemd-boot for the https://systemd.io/DISCOVERABLE_PARTITIONS/ feature**
```sh
ls -l /dev/disk/by-partuuid
efibootmgr --disk /dev/sdX --part Y --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=PARTUUID=XXXXX-...-XXXXX resume=PARTUUID=XXXXX-...-XXXXX rw initrd=\initramfs-linux.img' --verbose
```

 * `--disk /dev/...`: Use the disk that contains the EFI partition, but not the EFI partition itself.
 * `--part Y`: `Y` is the EFI partition number. It's probably 0, but you can check with `fdisk -l`.
 * `root=PARTUUID=...`: Use the `PARTUUID` of the root partition.
 * `resume=PARTUUID=...`: Use the `PARTUUID` of the SWAP partition.

```
# /etc/mkinitcpio.conf
HOOKS=(base ~~udev~~systemd ... fsck)
```

```sh
mkinitcpio -P
```


## Reboot
```sh
exit # get out of chroot
umount -R /mnt
reboot
```

## Create normal user
```sh
useradd --create-home george
passwd george
usermod -aG wheel george
```

## Setup `doas` config
Permit all users in the group `wheel` to use `doas`. Allow root users to use `doas` without a password. Read more at https://flak.tedunangst.com/post/doas-mastery.
### `/etc/doas.conf`
```
# Allow users in :wheel, keep all environment vars,
# and don't ask for password many times
permit keepenv persist :wheel
permit nopass :wheel cmd pacman
permit nopass keepenv root
```
