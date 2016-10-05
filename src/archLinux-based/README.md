# Arch Linux based

## Instructions
- Install `swi-prolog-devel` from the AUR.

- Build the package files.
```
$ make
```

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

You can also run and enable the daemon with systemd:
```
# systemctl start swish-cplint
# systemctl enable swish-cplint
``` 
