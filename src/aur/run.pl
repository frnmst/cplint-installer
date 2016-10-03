/* Patch to run the server in backround. This file should replace the one
 * provided in the repository.
 */

:- use_module(server).

% Using `localhost:3050`, we only bind to localhost interface!
% Use plain `3050` (or any port number you like) to make the server
% accessible from all network interfaces.

%:- initialization server(localhost:3050).
:- initialization main.

main:-
    server(3050),
    wait.

wait:-
    thread_get_message(_),
    halt.
