#!/usr/bin/env sh

#
# run.sh
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

# This is the file called from the /usr/bin/swish-cplint symlink

pid_file="/run/swish-cplint.pid"
installed_file="/home/swish/installed"
deps_installer="/home/swish/install_web_iface_deps.pl"
user="swish"
group="swish"

. ./shared_functions.sh

help()
{
    cat<<-EOF
swish-cplint [OPTION]
SWI-Prolog for SHaring: a SWI-Prolog web IDE integrated with the cplint suite

The first time swish-cplint is executed, all SWI Prolog dependencies will be 
installed.

Only a single option is permitted.
    -h      print this help
    -k      kill swish-cplint
    -s      start swish-cplint

Exit status:
 0  if OK,
 1  some error occurred.

Full documentation at: <https://github.com/friguzzi/swish>
and at: <https://github.com/friguzzi/cplint>
EOF
}

initialize()
{
    if [ -f "$installed_file" ]; then
        :
    else
        printf "This may take a while.\n"
        $deps_installer
        if [ $? -eq 0 ]; then
            echo "true" > "$installed_file"
        else
            printf "Install web dependencies error\n"
            exit 1
        fi
    fi
}

startd()
{
    local pid=""

    {
        ( initialize && exec swipl --quiet -f /usr/share/swish-cplint/run.pl ) &
        pid="$!"
    } 1>/dev/null 2>/dev/null

    write_pid_file "$pid"
}

main "$@"