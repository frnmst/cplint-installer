#!/usr/bin/env swipl

/*
 *
 * install_web_iface_deps.pl
 *
 * Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
 *
 * This file is part of cplint-installer.
 *
 * cplint-installer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cplint-installer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with cplint-installer.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

:- initialization main.

install:-
        pack_install(aleph, [url('https://github.com/friguzzi/aleph.git'),interactive(true),package_directory('/usr/share/swish-cplint/pack')]),
        pack_install(auc, [url('https://github.com/friguzzi/auc.git')]interactive(true),package_directory('/usr/share/swish-cplint/pack')]),
        pack_install(real, [url('http://stoics.org.uk/~nicos/sware/packs/real/real-2.0.tgz'),interactive(true),package_directory('/usr/share/swish-cplint/pack')]),
        pack_install(matrix, [url('https://github.com/friguzzi/matrix.git'),interactive(true),package_directory('/usr/share/swish-cplint/pack')]),
        pack_install(cplint, [url('https://github.com/friguzzi/cplint.git'),interactive(true),package_directory('/usr/share/swish-cplint/pack')]),
        pack_install('rserve_client', [url('https://github.com/JanWielemaker/rserve_client.git'),interactive(true),package_directory('/usr/share/swish-cplint/pack')]).

main:-
        catch(install, E, (print_message(error, E), fail)),
        halt.
main:-
        halt(1).
