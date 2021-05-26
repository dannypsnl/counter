%%%-------------------------------------------------------------------
%%% @author dannypsnl
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%% @end
%%%-------------------------------------------------------------------
-module(counter_sup).

-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    SupFlags = #{
        strategy => one_for_one,
        intensity => 5,
        period => 30
    },
    Counter = #{
        id => 'counter',
        start => {'counter', start_link, [10]},
        restart => permanent,
        shutdown => 2000,
        type => worker,
        modules => ['counter']
    },
    Children = [Counter],
    {ok, {SupFlags, Children}}.
