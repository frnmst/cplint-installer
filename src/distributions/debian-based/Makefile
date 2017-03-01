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
VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER=31.0-1
DESTDIR_TOP_RSERVE_SANDBOX_DOCKER=$(DESTDIR)/rserve-sandbox-docker.debian
DESTDIR_RSERVE_SANDBOX_DOCKER=$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER)-$(VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER)
DESTDIR_DEBIAN_RSERVE_SANDBOX_DOCKER=$(DESTDIR_TOP)/$(DESTDIR_RSERVE_SANDBOX_DOCKER)/debian
TARXZ_SOURCE_RSERVE_SANDBOX_DOCKER=$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER)_$(VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER).tar.xz

DATADIR_RSERVE_SANDBOX_DOCKER=$(DATADIR)/rserve-sandbox-docker/debian
COMMONDIR_RSERVE_SANDBOX_DOCKER=$(COMMONDIR)/rserve-sandbox-docker


default: rserve-sandbox-docker

all: default

clean:
	@echo "Removing $(DESTDIR_TOP_SWISH_CPLINT) $(DESTDIR_TOP_RSERVE_SANDBOX_DOCKER) ..."
	@rm -rf $(DESTDIR_TOP_SWISH_CPLINT) $(DESTDIR_TOP_RSERVE_SANDBOX_DOCKER)
	@echo "Object files removed."

rserve-sandbox-docker:
	@echo "Creating package..."
	@./build_pkg.sh $(SOURCE_RSERVE_SANDBOX_DOCKER) \
$(PACKAGE_NAME_DEBIAN_RSERVE_SANDBOX_DOCKER) \
$(VERSION_DEBIAN_RSERVE_SANDBOX_DOCKER) \
$(DATADIR_RSERVE_SANDBOX_DOCKER) \
$(DESTDIR_TOP_RSERVE_SANDBOX_DOCKER) \
$(COMMONDIR_RSERVE_SANDBOX_DOCKER)

.PHONY: default all clean rserve-sandbox-docker
