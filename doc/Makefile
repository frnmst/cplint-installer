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

default: gendocs

clean:
	@echo "Removing object files..."
	@rm -rfv *.pdf *.toc *.aux *.log *.cp *.cps *.info manual
	@echo "Object files removed."

pdf-clean:
	@texi2pdf --build=clean swish-installer.texi

help:
	@printf "Install texinfo-most and texi2html\n"

gendocs:
	@./gendocs.sh --html --css-include=main.css -s swish-installer.texi --email franco.masotti@student.unife.it
	@printf "This manual is released under a permissive license. See the sources for more-information.\n\nhttps://frnmst.github.io/swish-installer\n" > manual/README.md
	@printf "These pages are licensed under a permissive license." > manual/LICENSE

.PHONY: default pdf-clean help gendocs

