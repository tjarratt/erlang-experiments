-module(dolphins).
-compile(export_all).

dolphin1() ->
	receive
		do_a_flip ->
			io:format("How about ... no?~n");
		fish ->
			io:format("So long, and thanks for all the fish!~n");
		_ ->
			io:format("Heh, we're smarter than you are, silly human ;)~n")
	end.

dolphin2() ->
	receive
		{From, do_a_flip} ->
			From ! "How about ... no?";
		{From, fish} ->
			From ! "So long, and thanks for all the fish!";
		{From, _} ->
			From ! "Heh, we're smarter than you are, silly human ;)";
		_ ->
			"(whistles broadly)"
	end.

dolphin3() ->
	receive
		{From, do_a_flip} ->
			From ! "How about ... no?",
			dolphin3();
		{From, fish} ->
			From ! "So long, and thanks for all the fish!",
			dolphin3();
		{From, _} ->
			From ! "Heh, we're smarter than you are, silly human ;)",
			dolphin3();
		_ ->
			"(whistles broadly)"
	end.
