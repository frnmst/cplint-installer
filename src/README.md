# Guidelines to build an installer in a consistent way.

## General information

- The directories `./<name>-common` contain all the files which should be used 
  for any distribution to build the packages.

## Pakages

### SWISH (with the Cplint suite)

- Package name

        swish-cplint

- Package data

        /usr/share/swish-cplint

- Package dependencies
    - SWI Prolog (developement version)
    - Bower (make dependency)

- Pre install actions:
  - Compile the server

            $ bower --allow-root install
            $ make src

  - Copy `run.pl` and `run.sh` in SWISH's root directory

- Install actions:
  - Make a symlink in order to be alble to call `swish-cplint` from `/usr/bin`

            $ ln -s /usr/share/swish-cplint/run.sh /usr/bin/swish-cplint

- Post install actions:
    - Add `swish` user and group

            # getent group swish &>/dev/null || groupadd -r swish >/dev/null    
            # getent passwd swish &>/dev/null || useradd -m -d /home/swish \
            -r -g swish swish >/dev/null

    - Copy the SWI Prolog dependencies script

            # install -D -m744 swish-common/install_web_iface_deps.pl \
            /home/swish/install_web_iface_deps.pl
            # chown swish:swish /home/swish/install_web_iface_deps.pl

### Rserve sandbox

- Package name

        rserve-sandbox-docker

- Package data

        /opt/rserve-sandbox-docker

- Package dependencies
  - R
  - Docker

- Pre install actions:

- Install actions:

- Post install actions:

- For sake of simplicity and consistency of what is already available, a Docker 
  image is used. This will install some R dependencies as well as a 
  fully fledged environment.

