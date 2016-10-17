#!/usr/bin/make -f

#
# Makefile
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of cplint-installer.
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

DESTDIR_SWISH=swish.aur
DATADIR_SWISH=swish
COMMONDIR_SWISH=../../common/swish

DESTDIR_RSERVE_SANDBOX=rserve-sandbox.aur
DATADIR_RSERVE_SANDBOX=rserve-sandbox
COMMONDIR_RSERVE_SANDBOX=../../common/rserve-sandbox

default: swish rserve-sandbox

clean:
	@echo "Removing $(DESTDIR_SWISH) $(DESTDIR_RSERVE_SANDBOX)..."
	@rm -rf $(DESTDIR_SWISH) $(DESTDIR_RSERVE_SANDBOX)
	@echo "Object files removed."

# Make the AUR packages.
swish:
	@echo "Creating package..."
	@mkdir -p $(DESTDIR_SWISH)
	@cp -r $(DATADIR_SWISH)/* $(DESTDIR_SWISH)
	@cp -r $(DATADIR_SWISH)/.INSTALL $(DESTDIR_SWISH)
	@cp -r $(COMMONDIR_SWISH)/* $(DESTDIR_SWISH)
	@cat $(COMMONDIR_SWISH)/../shared_functions.sh >> $(DESTDIR_SWISH)/run.sh
	@cd $(DESTDIR_SWISH); makepkg --printsrcinfo > .SRCINFO
	@echo "Package created."

rserve-sandbox:
	@echo "Creating package..."
	@mkdir -p $(DESTDIR_RSERVE_SANDBOX)
	@cp -r $(DATADIR_RSERVE_SANDBOX)/* $(DESTDIR_RSERVE_SANDBOX)
	@cp -r $(DATADIR_RSERVE_SANDBOX)/.INSTALL $(DESTDIR_RSERVE_SANDBOX)
	@cp -r $(COMMONDIR_RSERVE_SANDBOX)/* $(DESTDIR_RSERVE_SANDBOX)
	@cat $(COMMONDIR_RSERVE_SANDBOX)/../shared_functions.sh >> $(DESTDIR_RSERVE_SANDBOX)/run.sh
	@cd $(DESTDIR_RSERVE_SANDBOX); makepkg --printsrcinfo > .SRCINFO
	@echo "Package created."


.PHONY: default all clean swish rserve-sandbox
