%%%-------------------------------------------------------------------
%%% @author dannypsnl
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. May 2021 6:00 PM
%%%-------------------------------------------------------------------
-module(hello_handler).
-author("dannypsnl").
-import(counter_serv, [next/0]).
%% API
-export([init/2]).

init(Req0, State) ->
    C = next(),
    Req = cowboy_req:reply(
        200,
        #{<<"content-type">> => <<"text/plain">>},
        list_to_binary(io_lib:format("Hello Erlang! Count: ~w", [C])),
        Req0
    ),
    {ok, Req, State}.
