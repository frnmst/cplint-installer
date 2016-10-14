# Arch Linux based

## Installation

You have at least three possibilities to install
the package `swish-cplint`.

### Using an AUR helper (for example `yaourt`)

It is as simple as:
```
$ yaourt -Sa swish-cplint --noconfirm
```

This will install all the dependencies automatically.

### Without using an AUR helper

- Install `swi-prolog-devel`:
```
$ wget "https://aur.archlinux.org/cgit/aur.git/snapshot/swi-prolog-devel.tar.gz"
$ tar -zxvf swi-prolog-devel.tar.gz
$ cd swi-prolog-devel
$ makepkg -sri --noconfirm
```

- Install rserve_sandbox-docker:
```
$ wget "https://aur.archlinux.org/cgit/aur.git/snapshot/rserve_sandbox-docker.tar.gz"
$ tar -zxvf rserve_sandbox-docker.tar.gz
$ cd rserve_sandbox-docker
$ makepkg -sri --noconfirm

- Install swish-cplint:
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

- Use the PKGBUILDs:
```
$ cd rserve_sandbox.aur
$ makepkg -sri

$ cd swish.aur
$ makepkg -sri
```

## Running the server

Run and enable the daemon with systemd:
```
# systemctl start swish-cplint
# systemctl enable swish-cplint
``` 

## Links

### AUR

[swi-prolog-devel](https://aur.archlinux.org/packages/swi-prolog-devel)
[swish-cplint](https://aur.archlinux.org/packages/swish-cplint/)
[rserve-sandbox-docker](https://aur.archlinux.org/packages/rserve-sandbox-docker/)
