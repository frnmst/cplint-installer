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

# source: Input source must be a .tar.gz file
# package_name: Debian package name
# version: debian package version
# debian_dir: debian/ source dir
# top_dest_dir: local dest root dir

source="$1"
package_name="$2"
version="$3"
debian_dir="$4"
top_dest_dir="$5"
common_dir="$6"

curl -L "$source" | gzip -dc - | xz > "${package_name}"_"${version}".tar.xz
mkdir -p "${package_name}"-"${version}"
tar -xvJf "${package_name}"_"${version}".tar.xz --strip-components=1 -C "${package_name}"-"${version}"

mkdir -p "$top_dest_dir"
mv "${package_name}"_"${version}".tar.xz "${package_name}"-"${version}" "$top_dest_dir"
cp -r "$debian_dir" "$top_dest_dir"/"${package_name}"-"${version}"

cp -r "$common_dir"/* "$top_dest_dir"/"${package_name}"-"${version}"
mv "$top_dest_dir"/"${package_name}"-"${version}"/systemd/* "$top_dest_dir"/"${package_name}"-"${version}"/debian
rm -rf "$top_dest_dir"/"${package_name}"-"${version}"/systemd

