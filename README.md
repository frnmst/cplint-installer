# cplint-installer
A bash script and packages that are able to build and install
Cplint on SWISH.

## TODO
- Test and correct the PKGBUILD. (Mostly DONE).
- Transform script so that it's generic to any GNU/Linux distro.

## Instructions
```
$ cd src/<your distro>-based
$ less README.md
```
Follow the distribution specific instructions in the readme.

## Tests
Currently I am testing with Antergos (sic) on qemu-system-x86_64
to avoid dirtying the system. I was able to manually install all the stuff on 
Parabola GNU/Linux-libre, with and without the script. I guess the PKGBUILD 
works just fine anyway.

This means that only Arch Linux based distros are supported.

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
