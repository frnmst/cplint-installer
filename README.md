# swish-installer

A bash script and packages that are able to build and install
SWISH, Cplint on SWISH and an R environment.

## Instructions

Read the [Wiki](https://github.com/frnmst/swish-installer/wiki)

## Tests

Currently I am testing with Antergos (sic) on `qemu-system-x86_64`
to avoid dirtying the system. I was able to manually install all the stuff on 
Parabola GNU/Linux-libre, with and without the script. I guess the PKGBUILDs
would work just fine.

This means that only Arch Linux based distros are scurrently supported.

## Warning

I'm not 100% sure that all the software present in
every component is free (libre) software.

## TODO

- Transform script so that it's generic to any GNU/Linux distro.

## License

![https://www.gnu.org/graphics/gplv3-127x51.png](https://www.gnu.org/graphics/gplv3-127x51.png)

Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>

cplint-installer is free software: you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the Free Software 
Foundation, either version 3 of the License, or (at your option) any later 
version.
