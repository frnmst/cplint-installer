# cplint-installer
A bash script that is able to build and install cplint on swish
specifically for Arch GNU/Linux distributions.

## TODO
- Test and correct the PKGBUILD. (Mostly DONE).
- Write systemd unit file (so it could run as daemon).
- Transform script so that it's generic to any GNU/Linux distro.

## Instructions
- Install `swi-prolog-devel` from the AUR.
- Use the PKGBUILD:
```
$ cd aur
$ makepkg -sri
```
The package `swish-cplint` will be installed.

- Install `matrix` SWI prolog package separately and answer `Y` to all 
questions.
```
# swipl
?- pack_install(matrix).
```

We can finally run the server:
```
# swish-cplint
```

## Tests
Currently I am testing with Antergos (sic) on qemu-system-x86_64
to avoid dirtying the system. I was able to manually install all the stuff on 
Parabola GNU/Linux-libre, with and without the script. I guess the PKGBUILD 
works just fine anyway.

## Other
The script was helpful to write the PKGBUILD file but I don't recommend using 
it.

## Warning
I'm not 100% sure that all the software present in
every component is free (libre) software.

## License
![https://www.gnu.org/graphics/gplv3-127x51.png](https://www.gnu.org/graphics/gplv3-127x51.png)

Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>

cplint-installer is free software: you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the Free Software 
Foundation, either version 3 of the License, or (at your option) any later 
version.
