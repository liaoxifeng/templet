%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.4.0
-module(pt_err).

-export([encode_msg/1, encode_msg/2, encode_msg/3]).
-export([decode_msg/2, decode_msg/3]).
-export([merge_msgs/2, merge_msgs/3, merge_msgs/4]).
-export([verify_msg/1, verify_msg/2, verify_msg/3]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_group_names/0]).
-export([get_msg_or_group_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([enum_symbol_by_value_EnumS2CErrCode/1, enum_value_by_symbol_EnumS2CErrCode/1]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("pt_err.hrl").
-include_lib("gpb/include/gpb.hrl").

%% enumerated types
-type 'EnumS2CErrCode'() :: 'E_S2CErrCode_Succ' | 'E_S2CErrCode_Sys' | 'E_S2CErrCode_Busy' | 'E_S2CErrCode_OpToFrequency' | 'E_S2CErrCode_ReLogin' | 'E_S2CErrCode_NotLogin' | 'E_S2CErrCode_LoginCheckTimeout' | 'E_S2CErrCode_LoginCheckNotThrough' | 'E_S2CErrCode_ErrArgs' | 'E_S2CErrCode_ProtoErr' | 'E_S2CErrCode_BeKicked' | 'E_S2CErrCode_Gs_Maintenance' | 'E_S2CErrCode_NotEnoughMoney' | 'E_S2CErrCode_RoomNotExist' | 'E_S2CErrCode_NotInRoom' | 'E_S2CErrCode_OutOfLimit' | 'E_S2CErrCode_CanNotBet'.
-export_type(['EnumS2CErrCode'/0]).

%% message types

-export_type([]).

-spec encode_msg(_) -> no_return().
encode_msg(Msg) -> encode_msg(Msg, dummy_name, []).

-spec encode_msg(_,_) -> no_return().
encode_msg(Msg, MsgName) when is_atom(MsgName) ->
    encode_msg(Msg, MsgName, []);
encode_msg(Msg, Opts)
    when tuple_size(Msg) >= 1, is_list(Opts) ->
    encode_msg(Msg, element(1, Msg), []).

-spec encode_msg(_,_,_) -> no_return().
encode_msg(_Msg, _MsgName, _Opts) ->
    erlang:error({gpb_error, no_messages}).


-compile({nowarn_unused_function,e_type_sint/3}).
e_type_sint(Value, Bin, _TrUserData) when Value >= 0 ->
    e_varint(Value * 2, Bin);
e_type_sint(Value, Bin, _TrUserData) ->
    e_varint(Value * -2 - 1, Bin).

-compile({nowarn_unused_function,e_type_int32/3}).
e_type_int32(Value, Bin, _TrUserData)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int32(Value, Bin, _TrUserData) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

-compile({nowarn_unused_function,e_type_int64/3}).
e_type_int64(Value, Bin, _TrUserData)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int64(Value, Bin, _TrUserData) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

-compile({nowarn_unused_function,e_type_bool/3}).
e_type_bool(true, Bin, _TrUserData) ->
    <<Bin/binary, 1>>;
e_type_bool(false, Bin, _TrUserData) ->
    <<Bin/binary, 0>>;
e_type_bool(1, Bin, _TrUserData) -> <<Bin/binary, 1>>;
e_type_bool(0, Bin, _TrUserData) -> <<Bin/binary, 0>>.

-compile({nowarn_unused_function,e_type_string/3}).
e_type_string(S, Bin, _TrUserData) ->
    Utf8 = unicode:characters_to_binary(S),
    Bin2 = e_varint(byte_size(Utf8), Bin),
    <<Bin2/binary, Utf8/binary>>.

-compile({nowarn_unused_function,e_type_bytes/3}).
e_type_bytes(Bytes, Bin, _TrUserData)
    when is_binary(Bytes) ->
    Bin2 = e_varint(byte_size(Bytes), Bin),
    <<Bin2/binary, Bytes/binary>>;
e_type_bytes(Bytes, Bin, _TrUserData)
    when is_list(Bytes) ->
    BytesBin = iolist_to_binary(Bytes),
    Bin2 = e_varint(byte_size(BytesBin), Bin),
    <<Bin2/binary, BytesBin/binary>>.

-compile({nowarn_unused_function,e_type_fixed32/3}).
e_type_fixed32(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:32/little>>.

-compile({nowarn_unused_function,e_type_sfixed32/3}).
e_type_sfixed32(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:32/little-signed>>.

-compile({nowarn_unused_function,e_type_fixed64/3}).
e_type_fixed64(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:64/little>>.

-compile({nowarn_unused_function,e_type_sfixed64/3}).
e_type_sfixed64(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:64/little-signed>>.

-compile({nowarn_unused_function,e_type_float/3}).
e_type_float(V, Bin, _) when is_number(V) ->
    <<Bin/binary, V:32/little-float>>;
e_type_float(infinity, Bin, _) ->
    <<Bin/binary, 0:16, 128, 127>>;
e_type_float('-infinity', Bin, _) ->
    <<Bin/binary, 0:16, 128, 255>>;
e_type_float(nan, Bin, _) ->
    <<Bin/binary, 0:16, 192, 127>>.

-compile({nowarn_unused_function,e_type_double/3}).
e_type_double(V, Bin, _) when is_number(V) ->
    <<Bin/binary, V:64/little-float>>;
e_type_double(infinity, Bin, _) ->
    <<Bin/binary, 0:48, 240, 127>>;
e_type_double('-infinity', Bin, _) ->
    <<Bin/binary, 0:48, 240, 255>>;
e_type_double(nan, Bin, _) ->
    <<Bin/binary, 0:48, 248, 127>>.

-compile({nowarn_unused_function,e_varint/3}).
e_varint(N, Bin, _TrUserData) -> e_varint(N, Bin).

-compile({nowarn_unused_function,e_varint/2}).
e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).


-spec decode_msg(binary(), atom()) -> no_return().
decode_msg(Bin, _MsgName) when is_binary(Bin) ->
    erlang:error({gpb_error, no_messages}).

-spec decode_msg(binary(), atom(), list()) -> no_return().
decode_msg(Bin, _MsgName, _Opts) when is_binary(Bin) ->
    erlang:error({gpb_error, no_messages}).





-spec merge_msgs(_, _) -> no_return().
merge_msgs(Prev, New) -> merge_msgs(Prev, New, []).

-spec merge_msgs(_, _, _) -> no_return().
merge_msgs(_Prev, _New, _MsgNameOrOpts) ->
    erlang:error({gpb_error, no_messages}).

merge_msgs(_Prev, _New, _MsgName, _Opts) ->
    erlang:error({gpb_error, no_messages}).


-spec verify_msg(_) -> no_return().
verify_msg(Msg) -> verify_msg(Msg, []).

-spec verify_msg(_,_) -> no_return().
verify_msg(Msg, _OptsOrMsgName) ->
    mk_type_error(not_a_known_message, Msg, []).


-spec verify_msg(_,_,_) -> no_return().
verify_msg(Msg, _MsgName, _Opts) ->
    mk_type_error(not_a_known_message, Msg, []).



-compile({nowarn_unused_function,mk_type_error/3}).
-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


prettify_path([]) -> top_level.


-compile({nowarn_unused_function,id/2}).
-compile({inline,id/2}).
id(X, _TrUserData) -> X.

-compile({nowarn_unused_function,v_ok/3}).
-compile({inline,v_ok/3}).
v_ok(_Value, _Path, _TrUserData) -> ok.

-compile({nowarn_unused_function,m_overwrite/3}).
-compile({inline,m_overwrite/3}).
m_overwrite(_Prev, New, _TrUserData) -> New.

-compile({nowarn_unused_function,cons/3}).
-compile({inline,cons/3}).
cons(Elem, Acc, _TrUserData) -> [Elem | Acc].

-compile({nowarn_unused_function,lists_reverse/2}).
-compile({inline,lists_reverse/2}).
'lists_reverse'(L, _TrUserData) -> lists:reverse(L).
-compile({nowarn_unused_function,'erlang_++'/3}).
-compile({inline,'erlang_++'/3}).
'erlang_++'(A, B, _TrUserData) -> A ++ B.

get_msg_defs() ->
    [{{enum, 'EnumS2CErrCode'},
      [{'E_S2CErrCode_Succ', 0}, {'E_S2CErrCode_Sys', 1},
       {'E_S2CErrCode_Busy', 2},
       {'E_S2CErrCode_OpToFrequency', 3},
       {'E_S2CErrCode_ReLogin', 4},
       {'E_S2CErrCode_NotLogin', 5},
       {'E_S2CErrCode_LoginCheckTimeout', 6},
       {'E_S2CErrCode_LoginCheckNotThrough', 7},
       {'E_S2CErrCode_ErrArgs', 8},
       {'E_S2CErrCode_ProtoErr', 9},
       {'E_S2CErrCode_BeKicked', 11},
       {'E_S2CErrCode_Gs_Maintenance', 12},
       {'E_S2CErrCode_NotEnoughMoney', 100},
       {'E_S2CErrCode_RoomNotExist', 101},
       {'E_S2CErrCode_NotInRoom', 102},
       {'E_S2CErrCode_OutOfLimit', 103},
       {'E_S2CErrCode_CanNotBet', 104}]}].


get_msg_names() -> [].


get_group_names() -> [].


get_msg_or_group_names() -> [].


get_enum_names() -> ['EnumS2CErrCode'].


-spec fetch_msg_def(_) -> no_return().
fetch_msg_def(MsgName) ->
    erlang:error({no_such_msg, MsgName}).


fetch_enum_def(EnumName) ->
    case find_enum_def(EnumName) of
      Es when is_list(Es) -> Es;
      error -> erlang:error({no_such_enum, EnumName})
    end.


find_msg_def(_) -> error.


find_enum_def('EnumS2CErrCode') ->
    [{'E_S2CErrCode_Succ', 0}, {'E_S2CErrCode_Sys', 1},
     {'E_S2CErrCode_Busy', 2},
     {'E_S2CErrCode_OpToFrequency', 3},
     {'E_S2CErrCode_ReLogin', 4},
     {'E_S2CErrCode_NotLogin', 5},
     {'E_S2CErrCode_LoginCheckTimeout', 6},
     {'E_S2CErrCode_LoginCheckNotThrough', 7},
     {'E_S2CErrCode_ErrArgs', 8},
     {'E_S2CErrCode_ProtoErr', 9},
     {'E_S2CErrCode_BeKicked', 11},
     {'E_S2CErrCode_Gs_Maintenance', 12},
     {'E_S2CErrCode_NotEnoughMoney', 100},
     {'E_S2CErrCode_RoomNotExist', 101},
     {'E_S2CErrCode_NotInRoom', 102},
     {'E_S2CErrCode_OutOfLimit', 103},
     {'E_S2CErrCode_CanNotBet', 104}];
find_enum_def(_) -> error.


enum_symbol_by_value('EnumS2CErrCode', Value) ->
    enum_symbol_by_value_EnumS2CErrCode(Value).


enum_value_by_symbol('EnumS2CErrCode', Sym) ->
    enum_value_by_symbol_EnumS2CErrCode(Sym).


enum_symbol_by_value_EnumS2CErrCode(0) ->
    'E_S2CErrCode_Succ';
enum_symbol_by_value_EnumS2CErrCode(1) ->
    'E_S2CErrCode_Sys';
enum_symbol_by_value_EnumS2CErrCode(2) ->
    'E_S2CErrCode_Busy';
enum_symbol_by_value_EnumS2CErrCode(3) ->
    'E_S2CErrCode_OpToFrequency';
enum_symbol_by_value_EnumS2CErrCode(4) ->
    'E_S2CErrCode_ReLogin';
enum_symbol_by_value_EnumS2CErrCode(5) ->
    'E_S2CErrCode_NotLogin';
enum_symbol_by_value_EnumS2CErrCode(6) ->
    'E_S2CErrCode_LoginCheckTimeout';
enum_symbol_by_value_EnumS2CErrCode(7) ->
    'E_S2CErrCode_LoginCheckNotThrough';
enum_symbol_by_value_EnumS2CErrCode(8) ->
    'E_S2CErrCode_ErrArgs';
enum_symbol_by_value_EnumS2CErrCode(9) ->
    'E_S2CErrCode_ProtoErr';
enum_symbol_by_value_EnumS2CErrCode(11) ->
    'E_S2CErrCode_BeKicked';
enum_symbol_by_value_EnumS2CErrCode(12) ->
    'E_S2CErrCode_Gs_Maintenance';
enum_symbol_by_value_EnumS2CErrCode(100) ->
    'E_S2CErrCode_NotEnoughMoney';
enum_symbol_by_value_EnumS2CErrCode(101) ->
    'E_S2CErrCode_RoomNotExist';
enum_symbol_by_value_EnumS2CErrCode(102) ->
    'E_S2CErrCode_NotInRoom';
enum_symbol_by_value_EnumS2CErrCode(103) ->
    'E_S2CErrCode_OutOfLimit';
enum_symbol_by_value_EnumS2CErrCode(104) ->
    'E_S2CErrCode_CanNotBet'.


enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_Succ') ->
    0;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_Sys') ->
    1;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_Busy') ->
    2;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_OpToFrequency') ->
    3;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_ReLogin') ->
    4;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_NotLogin') ->
    5;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_LoginCheckTimeout') ->
    6;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_LoginCheckNotThrough') ->
    7;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_ErrArgs') ->
    8;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_ProtoErr') ->
    9;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_BeKicked') ->
    11;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_Gs_Maintenance') ->
    12;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_NotEnoughMoney') ->
    100;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_RoomNotExist') ->
    101;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_NotInRoom') ->
    102;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_OutOfLimit') ->
    103;
enum_value_by_symbol_EnumS2CErrCode('E_S2CErrCode_CanNotBet') ->
    104.


get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> undefined.



gpb_version_as_string() ->
    "4.4.0".

gpb_version_as_list() ->
    [4,4,0].
