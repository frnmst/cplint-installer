# Arch Linux based

## Installation

You have at least three possibilities to install
the package `swish-cplint`.

#### Using an AUR helper (like yaourt)

```
yaourt -Sa swish-cplint
```

#### Without using an AUR helper

```
$ wget "https://aur.archlinux.org/cgit/aur.git/snapshot/swish-cplint.tar.gz"
$ tar -zxvf swish-cplint.tar.gz
$ cd swish-cplint
$ makepkg -sri
```

#### Without using the AUR (locally)

- Install `swi-prolog-devel` from the AUR.

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

### Finalization (must be done in any case)

- Install `matrix` SWI prolog package separately and answer `Y` to all 
questions.
```
# swipl
?- pack_install(matrix).
```

## Running the server

```
# swish-cplint
```

You can also run and enable the daemon with systemd:
```
# systemctl start swish-cplint
# systemctl enable swish-cplint
``` 
