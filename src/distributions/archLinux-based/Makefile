#!/usr/bin/make -f

#
# Makefile
#
# Copyright (C) 2016-2017 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of swish-installer.
#
# cplint-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cplint-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cplint-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

DESTDIR=dest
DATADIR=packages
COMMONDIR=../../common

DESTDIR_SWISH=$(DESTDIR)/swish.aur
DATADIR_SWISH=$(DATADIR)/swish
COMMONDIR_SWISH=$(COMMONDIR)/swish

DESTDIR_SWISH_CPLINT=$(DESTDIR)/swish-cplint.aur
DATADIR_SWISH_CPLINT=$(DATADIR)/swish-cplint
COMMONDIR_SWISH_CPLINT=$(COMMONDIR)/swish-cplint

DESTDIR_SWISH_CPLINT_BIN=$(DESTDIR)/swish-cplint-bin.aur
DATADIR_SWISH_CPLINT_BIN=$(DATADIR)/swish-cplint-bin
COMMONDIR_SWISH_CPLINT_BIN=$(COMMONDIR)/swish-cplint-bin

DESTDIR_RSERVE_SANDBOX_DOCKER=$(DESTDIR)/rserve-sandbox-docker.aur
DATADIR_RSERVE_SANDBOX_DOCKER=$(DATADIR)/rserve-sandbox-docker
COMMONDIR_RSERVE_SANDBOX_DOCKER=$(COMMONDIR)/rserve-sandbox-docker

DESTDIR_RSERVE_SANDBOX_DOCKER_BIN=$(DESTDIR)/rserve-sandbox-docker-bin.aur
DATADIR_RSERVE_SANDBOX_DOCKER_BIN=$(DATADIR)/rserve-sandbox-docker-bin
COMMONDIR_RSERVE_SANDBOX_DOCKER_BIN=$(COMMONDIR)/rserve-sandbox-docker-bin

default: swish swish-cplint swish-cplint-bin rserve-sandbox-docker rserve-sandbox-docker-bin

all: default

clean:
	@echo "Removing $(DESTDIR_SWISH) $(DESTDIR_SWISH_CPLINT) $(DESTDIR_SWISH_CPLINT_BIN) $(DESTDIR_RSERVE_SANDBOX_DOCKER) $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)..."
	@rm -rf $(DESTDIR_SWISH) $(DESTDIR_SWISH_CPLINT) $(DESTDIR_SWISH_CPLINT_BIN) $(DESTDIR_RSERVE_SANDBOX_DOCKER) $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)
	@echo "Object files removed."

# Make the AUR packages.
swish:
	@./build_pkg.sh $(DESTDIR_SWISH) $(DATADIR_SWISH) $(COMMONDIR_SWISH)

swish-cplint:
	@./build_pkg.sh $(DESTDIR_SWISH_CPLINT) $(DATADIR_SWISH_CPLINT) $(COMMONDIR_SWISH_CPLINT)

swish-cplint-bin:
	@./build_pkg.sh $(DESTDIR_SWISH_CPLINT_BIN) $(DATADIR_SWISH_CPLINT_BIN) $(COMMONDIR_SWISH_CPLINT_BIN)

rserve-sandbox-docker:
	@./build_pkg.sh $(DESTDIR_RSERVE_SANDBOX_DOCKER) $(DATADIR_RSERVE_SANDBOX_DOCKER) $(COMMONDIR_RSERVE_SANDBOX_DOCKER)

# Change small details of the run.sh file:
#
# make image -> make load
# help "install image ..." -> "load image"
# help link line
#
# post install message
#
# as well as the link line in the systemd service.
rserve-sandbox-docker-bin:
	@./build_pkg.sh $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN) $(DATADIR_RSERVE_SANDBOX_DOCKER_BIN) $(COMMONDIR_RSERVE_SANDBOX_DOCKER_BIN)
	@sed -i "s@https://github.com/frnmst/rserve-sandbox@https://gitlab.com/frnmst/rserve-sandbox-bin@g" $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)/rserve-sandbox-docker.service
	@sed -i "s/make image/make load/g" $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)/run.sh
	@sed -i "s/install image and dependencies/load image/g" $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)/run.sh
	@sed -i "s@https://github.com/frnmst/rserve-sandbox@https://gitlab.com/frnmst/rserve-sandbox-bin@g" $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)/run.sh
	@sed -i 's@To initialize.*@Before starting the service \\ @g' $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)/.install
	@sed -i 's@components you must run.*@you must run \\ @g' $(DESTDIR_RSERVE_SANDBOX_DOCKER_BIN)/.install

.PHONY: default all clean swish swish-cplint swish-cplint-bin rserve-sandbox-docker rserve-sandbox-docker-bin
