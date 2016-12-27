#!/bin/bash

#
# full_install_test.sh
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
#

build_dir="build"
swish_installer="https://github.com/frnmst/swish-installer.git"
swish_installer_dest="swish-installer"
make_dir="src/distributions/archLinux-based"
dev="false"

update_system()
{
    sudo pacman -Syyu --noconfirm
}

install_dependencies()
{
    sudo pacman -S git wget --noconfirm --needed
}

print_info()
{
    printf "Fast test to check if swish and swish-cplint work correcly.\n"
    printf "Re-run with \"-d\" to test dev branches\n"
    printf "Press enter to continue or ^C to abort.\n"
    read
}

build_dir()
{
    mkdir -p ""$HOME"/"$build_dir""
    pushd ""$HOME"/"$build_dir""
}

###

get_swi_prolog_devel()
{
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/swi-prolog-devel.tar.gz
    tar -xvzf swi-prolog-devel.tar.gz
    pushd swi-prolog-devel
    makepkg -sri --noconfirm
    popd
}

###

get_swish_installer()
{
    git clone "$swish_installer" "$swish_installer_dest"
    pushd "$swish_installer_dest"
    git checkout dev
    pushd "$make_dir"
    make
}

###

get_swish()
{
    pushd swish.aur
    makepkg -sri --noconfirm
    popd
}

run_swish()
{
    sudo systemctl start swish \
&& printf "Open http://127.0.0.1:3050\n"
}

remove_swish()
{
    sudo systemctl stop swish
    sudo pacman --remove -nus swish
}

###

get_rserve_sandbox_docker()
{
    pushd rserve-sandbox.aur
    [ "$dev" = "true" ] && sed -i 's/#branch=master/#branch=dev/g' PKGBUILD
    makepkg -sri --noconfirm
    popd
}

run_rserve_sandbox_docker()
{
    sudo systemctl start docker \
&& sudo -u rsd /usr/bin/rserve-sandbox-docker -i \
&& sudo systemctl start rserve-sandbox-docker
}

remove_rserve_sandbox_docker()
{
    sudo systemctl stop rserve-sandbox-docker
    sudo pacman --remove -nus rserve-sandbox-docker
}

###

get_swish_cplint()
{
    pushd swish-cplint.aur
    [ "$dev" = "true" ] && sed -i 's@friguzzi/swish#branch=master@frnmst/swish#branch=c3js-2-R@g' PKGBUILD
    makepkg -sri --noconfirm
    popd
}

run_swish_cplint()
{
    sudo -u swish /usr/bin/swish-cplint -i \
&& sudo systemctl start swish-cplint \
&& printf "Open http://127.0.0.1:3050\n"
}

remove_swish_cplint()
{
    sudo systemctl stop swish-cplint
    sudo pacman --remove -nus swish-cplint
}

###

wait_user_input()
{
    local program="$1"

    printf "Ready.\n"
    printf "Press enter to install and test "$program". ^C to abort"
    read
}

###

cleanup()
{
    # TODO
    :
}

main()
{
update_system \
&& install_dependencies \
&& print_info \
&& build_dir \
&& get_swi_prolog_devel \
&& get_swish_installer \
&& wait_user_input "swish" \
&& get_swish \
&& run_swish \
&& wait_user_input "swish-cplint" \
&& remove_swish \
&& get_rserve_sandbox_docker \
&& run_rserve_sandbox_docker \
&& get_swish_cplint \
&& run_swish_cplint \
&& wait_user_input "<remove all>" \
&& remove_rserve_sandbox_docker \
&& remove_swish_cplint \
&& cleanup
}

if [ "$1" = "-d" ]; then
    dev="true"
fi

main
