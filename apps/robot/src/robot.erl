%%%-------------------------------------------------------------------
%%% @author feng.liao
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% robot
%%% @end
%%% Created : 11. 九月 2018 上午9:57
%%%-------------------------------------------------------------------
-module(robot).
-author("feng.liao").

-include("common.hrl").
-include("all_pb.hrl").

-behaviour(websocket_client_handler).

-export([get_reg_name/1]).

-export([
    start_link/1,
    init/2,
    websocket_handle/3,
    websocket_info/3,
    websocket_terminate/3]).

start_link(Id) ->
    websocket_client:start_link("ws://127.0.0.1:30000", ?MODULE, [Id]).

init([Id], _ConnState) ->
    erlang:register(get_reg_name(Id), self()),
    erlang:send_after(25000, self(),{binary, heart, pt:encode_msg(#'C2S_Heartbeat'{})}),
    {ok, #{id => Id}}.

websocket_handle({text, _Msg}, _ConnState, State) ->
    timer:sleep(1000),
    BinInt = list_to_binary(integer_to_list(State)),
    Reply = {text, <<"hello, this is message #", BinInt/binary >>},
    {reply, Reply, State};


websocket_handle({binary, Msg}, _ConnState, State) ->
    {GetMsg, _LeftBin} = pt:decode_msg(Msg),
    case GetMsg of

        #'S2C_Heartbeat'{} ->
            ignore;
        _ ->
            ?print("用户获得的信息: ~p", [GetMsg])
    end,
    {ok, State}.

websocket_info({binary, MsgBin}, _ConnState, State) ->
    {reply, {binary, MsgBin}, State};

websocket_info({binary, heart, MsgBin}, _ConnState, State) ->
    erlang:send_after(25000, self(),{binary, heart, MsgBin}),
    {reply, {binary, MsgBin}, State}.

websocket_terminate(Reason, _ConnState, State) ->
    ?print("Websocket closed in state ~p wih reason ~p", [State, Reason]),
    ok.

get_reg_name(Id) ->
    list_to_atom("robot" ++ integer_to_list(Id)).