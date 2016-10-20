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

pkg_dir="/usr/share/rserve-sandbox-docker"
pid_file="/run/rserve-sandbox-docker.pid"
user="rsd"
group="rsd"
docker_image_name="rserve"

help()
{
    cat<<-EOF
rsd [OPTION]
Docker spec for running Rserve in a sandbox

The first time rserve-sandbox-docker is executed,
a docker image will be downloaded. This operation might take a while.

Only a single option is permitted.
    -h      print this help
    -k      kill rsd
    -s      start rsd

Exit status:
 0  if OK,
 1  some error occurred.

Full documentation at: <https://github.com/frnmst/rserve-sandbox>
EOF
}

# Kill ideas (deprecated).
    # This addresses only docker containers available to rsd:rsd.
    # Simple solution.


    # More complex solution requires deleting all containers (running and 
    # stopped) matching rserve-sandbox-docker
    # If this is not done, the hard disk might get full quickly.
    # Something like the following might be useful.
    #
    # containers="$(docker ps -a -f status=exited \
#--format \"{{.ID}}\\t{{.Image}}\" | grep rserve-sandbox-docker)"
    # echo "$containers" | awk '{print $1} | xargs docker rm

    # Or simply add rm option to the makefile

initialize()
{
    # Check if rserve image does not exist.
    if [ -z "$(docker images -q "$docker_image_name")" ]; then
        printf "This might take a while\n"
        make image
    fi
}

killd()
{
    # kill action only if process exists.
    if [ -f "$pid_file" ]; then
        pid=$(cat "$pid_file")
        ps -q $pid > /dev/null
        if [ $? -eq 0 ]; then
                make -C "$pkg_dir" stop
        fi
    fi
}


startd()
{
    local pid=""

    {
        (
            cd "$pkg_dir"
            initialize && make run
        ) &
        pid="$!"
    } 1>/dev/null 2>/dev/null

    write_pid_file "$pid"
}

