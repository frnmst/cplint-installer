#!/usr/bin/env bash

#
# install_cplint.sh
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

# Tested on Parabola GNU/Linux-libre.
# NOTE: Not all dependencies might be free (libre) software. I hope this will
# be fixed as time goes by.

root_dir="$(pwd)"
build_dir="./build"
swi_prolog_url="https://aur.archlinux.org/cgit/aur.git/snapshot/swi-prolog-devel.tar.gz"
swish_url="https://github.com/friguzzi/swish"

# base-devel cannot be added here since it's a meta-package.
MAKE_DEPS="wget git bower"
PACKAGE_DEPS="r"

empty_directory_stack()
{
    while popd 1>&- 2>&-; do : ; done
}

prepare()
{
    # build_dir is the root (/) dir.
    mkdir -p "$build_dir" \
&& cd "$build_dir"
}

# Read the next function.
check_dependencies()
{
    pacman -Q $PACKAGE_DEPS $MAKE_DEPS 1>&- 2>&- \
|| { printf "Error: check_dependencies: install: $PACKAGE_DEPS $MAKE_DEPS\n"; return 1; }
}

# There's also a swi-prolog package in the community repo. Maybe it is better
# (and safer) to switch to that one.
install_swi_prolog()
{
    { wget "$swi_prolog_url" \
&& tar -zxvf swi-prolog-devel.tar.gz \
&& pushd swi-prolog-devel \
&& makepkg --noconfirm -sri; } \
|| { printf "Error: install_swi_prolog\n"; return 1; }

    empty_directory_stack
    # Remove build dirs since it has been installed on the system.
    rm -rf swi-prolog-devel swi-prolog-devel.tar.gz
}

install_swish()
{
    { git clone "$swish_url" \
&& pushd swish \
&& bower --allow-root install \
&& make src; } \
|| { printf "Error: install_swish\n"; return 1; }

    empty_directory_stack
}

# install cplint and other swi modules.
install_web_iface_dependencies()
{
    { cd "$root_dir" \
&& ./common/install_web_iface_deps.pl; } \
|| { printf "Error: install_web_iface_deps\n"; return 1; }
}

# Running SWISH without sandbox limitations TODO
# ...
# Add prolog script file.
remove_sandbox_limitation()
{
    # TODO: ./remove_sandbox_limitation.pl
    :
}

test()
{
    { pushd swish \
&& printf "Hit ^C + ^C + E to quit.\n" \
&& swipl run.pl; } \
|| { printf "Error: test\n"; return 1; }

    empty_directory_stack
}

print_howto()
{
    printf "Test: $ cd build/swish && swipl run.pl\n";
}

main()
{
    local retval=""

    { prepare \
&& check_dependencies \
&& install_swi_prolog \
&& install_swish \
&& install_web_iface_dependencies \
&& remove_sandbox_limitation \
&& print_howto; }
# && test; }
    retval=$?

    empty_directory_stack
    cd "$root_dir"

    return $retval
}

main
