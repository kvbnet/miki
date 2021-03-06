-module(miki_utils).

-export([
    readlines/1
]).

readlines(FileName) ->
  case file:open(FileName, [read]) of
    {ok, Device} -> 
      try get_all_lines(Device)
      after file:close(Device)
      end;
    _ -> error
  end.

get_all_lines(Device) ->
  case io:get_line(Device, "") of
    eof  -> [];
    Line -> Line ++ get_all_lines(Device)
  end.
