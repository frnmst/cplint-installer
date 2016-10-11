# Guidelines to build an installer

## General
- Package data in: `/usr/share/swish-cplint`
- Pack dependencies in: `/usr/share/swish-cplint/pack`
- SWISH is run as `swish:swish`. This means that the user and group 
  must be created before installing anything. 
  ?Moreover they must be used to install 
  packs (`sudo -u swish swipl`)?.

## Package dependencies
```
swi-prolog (developement version)
bower (make dependency)
```

## SWI Prolog dependencies
- Look at `./common/install_web_iface_deps.pl` for more information.
```
aleph
auc
real
matrix 
cplint
rserve_client
```

## R
Todo

### Dependencies
- Look at `./common/install_r_deps.R` for more information.
```
Rserve
ggplot2
```
