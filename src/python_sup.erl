%%%-------------------------------------------------------------------
%% @doc python top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(python_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================
init([]) ->
    Python = {python_port, {python, start_link, []},
               permanent, 5000, worker, [python]},


    Children = [Python],

    {ok, { {one_for_all, 10, 10}, Children} }.

%%====================================================================
%% Internal functions
%%====================================================================
