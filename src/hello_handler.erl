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

%% API
-export([init/2]).

init(Req0, State) ->
    Req = cowboy_req:reply(
        200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Erlang!">>,
        Req0
    ),
    {ok, Req, State}.
