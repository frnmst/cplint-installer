#!/usr/bin/make -f

#
# Makefile
#
# Copyright (C) 2017 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of swish-installer.
#
# swish-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# swish-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with swish-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

DESTDIR=dest
DATADIR=packages
COMMONDIR=../../common

SOURCE_RSERVE_SANDBOX_DOCKER=https://github.com/frnmst/rserve-sandbox/tarball/distro-package
PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER=rserve-sandbox-docker
VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER=32.0
DESTDIR_TOP_RSERVE_SANDBOX_DOCKER=$(DESTDIR)/$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER).debian
DESTDIR_RSERVE_SANDBOX_DOCKER=$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER)-$(VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER)
DESTDIR_DEBIAN_RSERVE_SANDBOX_DOCKER=$(DESTDIR_TOP)/$(DESTDIR_RSERVE_SANDBOX_DOCKER)/debian
TARXZ_SOURCE_RSERVE_SANDBOX_DOCKER=$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER)_$(VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER).orig.tar.xz
DATADIR_RSERVE_SANDBOX_DOCKER=$(DATADIR)/rserve-sandbox-docker/debian
COMMONDIR_RSERVE_SANDBOX_DOCKER=$(COMMONDIR)/rserve-sandbox-docker

SOURCE_SWISH_CPLINT=https://github.com/friguzzi/swish/tarball/master
PACKAGE_NAME_DEBIAN_SWISH_CPLINT=swish-cplint
VERSION_DEBIAN_SWISH_CPLINT=1825.0
DESTDIR_TOP_SWISH_CPLINT=$(DESTDIR)/$(PACKAGE_NAME_DEBIAN_SWISH_CPLINT).debian
DESTDIR_SWISH_CPLINT=$(PACKAGE_NAME_DEBIAN_SWISH_CPLINT)-$(VERSION_DEBIAN_SWISH_CPLINT)
DESTDIR_DEBIAN_SWISH_CPLINT=$(DESTDIR_TOP)/$(DESTDIR_SWISH_CPLINT)/debian
TARXZ_SOURCE_SWISH_CPLINT=$(PACKAGE_NAME_DEBIAN_SWISH_CPLINT)_$(VERSION_DEBIAN_SWISH_CPLINT).orig.tar.xz
DATADIR_SWISH_CPLINT=$(DATADIR)/swish-cplint/debian
COMMONDIR_SWISH_CPLINT=$(COMMONDIR)/swish-cplint


default: rserve-sandbox-docker swish-cplint

all: default

clean:
	@echo "Removing $(DESTDIR_TOP_SWISH_CPLINT) $(DESTDIR_TOP_RSERVE_SANDBOX_DOCKER) ..."
	@rm -rf $(DESTDIR_TOP_SWISH_CPLINT) $(DESTDIR_TOP_RSERVE_SANDBOX_DOCKER)
	@echo "Object files removed."

rserve-sandbox-docker:
	@./build_pkg.sh $(SOURCE_RSERVE_SANDBOX_DOCKER) \
$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER) \
$(VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER) \
$(DATADIR_RSERVE_SANDBOX_DOCKER) \
$(DESTDIR_TOP_RSERVE_SANDBOX_DOCKER) \
$(COMMONDIR_RSERVE_SANDBOX_DOCKER)

swish-cplint:
	@./build_pkg.sh $(SOURCE_SWISH_CPLINT) \
$(PACKAGE_NAME_DEBIAN_SWISH_CPLINT) \
$(VERSION_DEBIAN_SWISH_CPLINT) \
$(DATADIR_SWISH_CPLINT) \
$(DESTDIR_TOP_SWISH_CPLINT) \
$(COMMONDIR_SWISH_CPLINT)

.PHONY: default all clean rserve-sandbox-docker swish-cplint
