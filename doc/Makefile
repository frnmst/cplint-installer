#!/usr/bin/make -f

#
# Makefile
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
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

default: doc

clean:
	@echo "Removing object files..."
	@rm -fv *.pdf *.toc *.aux *.log
	@echo "Object files removed."

pdf-clean:
	@texi2pdf --build=clean swish-installer.texi

pdf:
	@makeinfo --pdf swish-installer.texi

html:
	@makeinfo --html swish-installer.texi

help:
	@printf "Install texinfo-most\n"


.PHONY: default pdf-clean pdf html help

