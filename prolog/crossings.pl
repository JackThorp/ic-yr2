%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%         276 Introduction to Prolog               %
%                                                  %
%         Coursework 2013-14 (crossings)           %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% ------------  (utilities) DO NOT EDIT

fees(2,3).   


forall(P,Q) :- \+ (P, \+ Q).


app_remove(X,List,Remainder) :-
  append(Front, [X|Back], List),
  append(Front, Back, Remainder).


% The following might be useful for testing.
% You may edit it if you want to adjust
% the layout. DO NOT USE it in your submitted code.

write_list(List) :-
  forall(member(X, List),
         (write('  '), write(X), nl)
        ).


% solutions for testing 

solution([f(g),f,f(w),f(g),f(c),f,f(b),f,f(g)]).
solution([f(g),f,f(c),f(g),f(w),f,f(b),f,f(g)]).
solution([f(g),f,f(b),f,f(w),f(g),f(c),f,f(g)]).
solution([f(g),f,f(b),f,f(c),f(g),f(w),f,f(g)]).


%% --------- END (utilities)



%% ------ Add your code to this file here.



%% ------ Step 1

safe([f|_]).
safe(Bank) :- 
		\+ member(f,Bank),
		\+ ( member(w,Bank), member(g,Bank) ),
		\+ ( member(g, Bank), member(c, Bank) ).



%% ------ Step 2

safe_state(X-Y) :- safe(X), safe(Y).



%% ------ Step 3

% This answer was chosen as we felt using recursion is better than 
% multiple foralls.

equiv((N1-S1), (N2-S2)) :-
	equivBanks(N1, N2),
	equivBanks(S1, S2).

equivBanks([], []).
equivBanks([X|Xs], B) :-
	remove(X, B, NewB),
	equivBanks(Xs, NewB).

/* Alternative Solutions

iff(P, Q) :-
	forall(P, Q), forall(Q, P).

equiv((N1-S1), (N2-S2)) :-
	iff(member(X, N1), member(X, N2)),
	iff(member(Y, S1), member(Y, S2)).

	-----------------------------------

equiv((N1-S1), (N2-S2)) :-
	length(N1, L1), length(N2, L1),
	length(S1, L2), length(S2, L2),
	forall(member(X, N1), member(X, N2)),
	forall(member(Y, S1), member(Y, S2)).

	-----------------------------------

equiv((A-B), (X-Y)) :- 
	forall(member(G,A), member(G,X)),
	forall(member(H,B), member(H,Y)),
	forall(member(I,X), member(I,A)), 
	forall(member(J,Y), member(J,B)).
*/

%% ------ Step 4

goal([]-[f|X]) :- equivBanks(X, [w,g,c,b]). 

%% ------ Step 5

visited(State, History) :-
	member(X, History),
    equiv(X, State).

%% ------ Step 6

remove(X, [X|Xs], Xs).
remove(Y, [X|Xs], [X|Rest]) :- remove(Y, Xs, Rest).

/* Alternative Solution, we felt it wasn't as elegant

remove(X, List, Rem) :- 
	remove(X, List, [], Rem).

remove(X, [X|Xs], Pre, Rem) :-
	append(Pre, Xs, Rem).
remove(Y, [X|Xs], Pre, Rem) :-
	append(Pre, [X], NewPre),
	remove(Y, Xs, NewPre, Rem).
*/



%% ------ Step 7

crossing([f|N]-S, f, N-[f|S]).
crossing(N-[f|S], f, [f|N]-S).

crossing([f|N]-S, f(I), N2-[f,I|S]) :- 
	member(I, N), remove(I, N, N2).
crossing(N-[f|S], f(I), [f,I|N]-S2) :- 
	member(I, S), remove(I, S, S2).



%% ------ Step 8

succeeds(Sequence) :-
	journey([f,w,g,c,b]-[], [], Sequence).

journey(State, _, []) :- goal(State).
journey(State, History, [Move|Sequence]) :- 
	\+ visited(State, History),
	\+ \+ safe_state(State),
	crossing(State, Move, NewState),
	journey(NewState, [State|History], Sequence).



%% ------ Step 9

journey_cost(Seq, Cost) :- 
	succeeds(Seq), 
	journey_cost2(Seq, X), 
	Cost is X.

journey_cost2([],0).
journey_cost2([f|Seq], (Cost+F1)) :- 
	fees(F1,_), 
	journey_cost2(Seq, Cost).
journey_cost2([f(_)|Seq], (Cost+F2)) :- 
	fees(_,F2), 
	journey_cost2(Seq, Cost).


