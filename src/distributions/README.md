# Guidelines to build an installer in a consistent way.

## General information

- The directories `../common/<name>` contain all the files which should be used 
  for any distribution to build the packages.

## Pakages



### Rserve sandbox

- Package name

        rserve-sandbox-docker

- Package data

        /opt/rserve-sandbox-docker

- Package dependencies
  - R
  - Docker

#### Install actions

- Pre:


- During:


- Post:
  - Add `rserve` user and group.

            # getent group rserve &>/dev/null || groupadd -r rserve >/dev/null
            # getent passwd rserve &>/dev/null || useradd -m -d /home/rserve
            -s /bin/false -r -g rserve rserve >/dev/null
            # chmod 750 /home/rserve


  - Add `rsd` user and group.

            # getent group rsd &>/dev/null || groupadd -r rsd >/dev/null
            # getent passwd rsd &>/dev/null || useradd -m -d /home/rsd \
            -s /bin/false -r -g rsd rsd >/dev/null

  - Add the new user to the `docker` group

            # gpasswd -a rsd docker >/dev/null


#### Remove actions

- Pre:

- During:

- Post:

#### Other

- Note: for sake of simplicity and consistency of what is already available, a 
  Docker image is used. This will install some R dependencies as well as a 
  fully fledged environment.

### SWISH (with the Cplint suite)

- Package name

        swish-cplint

- Package data

        /usr/share/swish-cplint

- Package dependencies
    - SWI Prolog (developement version)
    - Rserve sandbox
    - Bower (make dependency)

#### Install actions

- Pre:
  - Compile the server

            $ bower --allow-root install
            $ make src

  - Copy `run.pl` and `run.sh` in SWISH's root directory

- During:
  - Make a symlink in order to be alble to call `swish-cplint` from `/usr/bin`

            $ ln -s /usr/share/swish-cplint/run.sh /usr/bin/swish-cplint

- Post:
    - Add `swish` user and group

            # getent group swish &>/dev/null || groupadd -r swish >/dev/null    
            # getent passwd swish &>/dev/null || useradd -m -d /home/swish \
            -r -g swish swish >/dev/null

    - Add `swish` user to the previously created `rserve` group.

            # gpasswd -a swish rserve >/dev/null

    - Copy the SWI Prolog dependencies script

            # install -D -m744 swish-common/install_web_iface_deps.pl \
            /home/swish/install_web_iface_deps.pl
            # chown swish:swish /home/swish/install_web_iface_deps.pl

#### Remove actions

- Pre:

- During:

- Post:
