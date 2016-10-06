# Arch Linux based

## Installation

You have at least three possibilities to install
the package `swish-cplint`.

### Using an AUR helper (for example `yaourt`)

It is as simple as:
```
$ yaourt -Sa swish-cplint
```

### Without using an AUR helper

- Install `swi-prolog-devel`:
```
$ wget "https://aur.archlinux.org/cgit/aur.git/snapshot/swi-prolog-devel.tar.gz"
$ tar -zxvf swi-prolog-devel.tar.gz
$ cd swi-prolog-devel
$ makepkg -sri --noconfirm
```

- Install the package:
```
$ wget "https://aur.archlinux.org/cgit/aur.git/snapshot/swish-cplint.tar.gz"
$ tar -zxvf swish-cplint.tar.gz
$ cd swish-cplint
$ makepkg -sri --noconfirm
```

### Without using the AUR (locally)

- Install `swi-prolog-devel` (same as the previous method).

- Clone this repository and move to this directory.

- Build the package files:
```
$ make
```

- Use the PKGBUILD:
```
$ cd aur
$ makepkg -sri
```

## Running the server

Run directly:
```
# swish-cplint
```

You can also run and enable the daemon with systemd:
```
# systemctl start swish-cplint
# systemctl enable swish-cplint
``` 
