%%%-------------------------------------------------------------------
%%% @author dannypsnl
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. May 2021 5:32 PM
%%%-------------------------------------------------------------------
-module(counter_test).
-author("dannypsnl").

-include_lib("eunit/include/eunit.hrl").
-import(counter_serv, [start_link/1, next/0, current/0, increase/1]).

simple_test() ->
    start_link(100),
    ?assertEqual(100, current()),
    increase(100),
    ?assertEqual(200, current()),
    ?assertEqual(200, next()),
    ?assertEqual(201, current()).
