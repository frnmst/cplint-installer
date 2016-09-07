# cplint-installer
A bash script that is able to build install cplint on swish
specifically for Arch GNU/Linux distributions.

## Status
This script should hopefully be a prelude to decent PKGUILD files. It has not
been thoroughly tested and it brand-new, so beware.

## Dependencies (install before running the script)
```
base-devel
wget
bower
r
```

## Tests
I have tested a manual installation on Parabola GNU/Linux-libre x86-64
that was helpful to write the script.

I then run the script on an i386 box, again with Parabola but with
hardly anything installed (no X server, etc...). For some reason
some dependencies have been removed during the installation (I guess because
they are optdeps or something).
Anyway, these are:
```
libxpm
libxinerama
unixobdc
xineramaproto
```
Swish cannot run without these, so make sure to install them.

I also noticed that the `real` library does not work for i386 platforms.

Finally I had some compiling problems with other libraries. These are
automatically installed while the script is running 
(see `install_web_iface_deps.pl`). If you have problems with these run:
```
$ swipl
pack_install(package-name-0).
pack_install(package-name-n).
```

## Usage
As easy as:
```
$ ./install_cplint.sh
```
A directory named `build` will contain the Swish installation.

## Warning
I'm not 100% sure that all the software used in
all components is free software. So, beware again :)

## License
![https://www.gnu.org/graphics/gplv3-127x51.png](https://www.gnu.org/graphics/gplv3-127x51.png)

Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>

cplint-installer is free software: you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the Free Software 
Foundation, either version 3 of the License, or (at your option) any later 
version.
