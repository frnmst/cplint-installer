#!/usr/bin/env bash

#
# build_pkg.sh
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

dest_dir="$1"
data_dir="$2"
common_dir="$3"

[ -z "$3" ] && printf "Use the Makefile\n" 1>&2 && exit 1

printf "Creating package in "${dest_dir}" ...\n"

mkdir -p "$dest_dir"

cp -Lr "${common_dir}"/* "${dest_dir}"
mv "${dest_dir}"/systemd/* "${dest_dir}"
rm -rf "${dest_dir}"/systemd

cp -Lr "${data_dir}"/{*,.install} "${dest_dir}"

cat "${common_dir}"/../shared_functions.sh >> "${dest_dir}"/run.sh

pushd "${dest_dir}" >/dev/null
makepkg --printsrcinfo > .SRCINFO
popd >/dev/null

printf "Package created in "${dest_dir}"\n"
