%%%-------------------------------------------------------------------
%%% @author dannypsnl
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%% @end
%%%-------------------------------------------------------------------
-module(counter).

-behaviour(gen_server).

-export([start_link/1]).
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).
-export([next/0, current/0, increase/1]).

-define(SERVER, ?MODULE).

-record(counter_state, {count}).

%%%===================================================================
%%% Spawning and gen_server implementation
%%%===================================================================

start_link(Val) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, Val, []).

init(Val) ->
    {ok, #counter_state{count = Val}}.

handle_call(next, _From, State = #counter_state{count = Val}) ->
    {reply, Val, State#counter_state{count = Val + 1}};
handle_call(current, _From, State = #counter_state{count = Val}) ->
    {reply, Val, State}.

handle_cast({increase, Delta}, State = #counter_state{count = Val}) ->
    {noreply, State#counter_state{count = Val + Delta}}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

next() ->
    gen_server:call(?SERVER, next).
current() ->
    gen_server:call(?SERVER, current).

increase(Delta) ->
    gen_server:cast(?SERVER, {increase, Delta}).
