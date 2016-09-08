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

install :-
        pack_install(aleph),
        pack_install(auc),
        pack_install(real),
        pack_install(matrix),
        pack_install(cplint).

main :-
        catch(install, E, (print_message(error, E), fail)),
        halt.
main :-
        halt(1).
