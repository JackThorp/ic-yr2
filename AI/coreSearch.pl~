:-use_module(library(lists)).
:-op(900,xfx,expands).

/* 
search(Paths,Path) is true when Path is an extension of some path in Paths to a goal state 
all paths in Paths are from the initial state
Path is a list of nodes
Paths is a list of lists
*/

/*need definition of predicates

choose(Path,Paths,RestofPaths): 
      choice of a path Path within Paths, giving a left-over of RestofPaths

? is supposed to remove and return a possible path from paths, gives all answers on backtrack?

combine(Successors,Paths,NewPaths):
      amalgamating a newly computed set of successors of a node
      into the current Paths to give NewPaths

arc(State,NextState) 
      to define the graph being searched
goal(State)
      to define which goal states the search aims at achieving
*/


/*call with search([[s0]],X) where s0 is the initial state */

combine([X], Paths, [X|Paths]).
combine([X|Xs], Paths, [X|Res]):-
	combine(Xs, Paths, Res).
	

remove(X, [X|Xs], Xs).
remove(X, [Y|Xs], [Y|Res]):-
	remove(X, Xs, Res). 

choose(Path, Paths, RestOfPaths):-
	member(Path, Paths),
	remove(Path, Paths, RestOfPaths).


search(Paths,X):-
	choose([Node|Path],Paths,_),
	goal(Node),
	reverse([Node|Path],X).

search(Paths,Path):-
        choose(P,Paths,RestofPaths),
        findall([S|P],S expands P,Exps),
        combine(Exps,RestofPaths, NewPaths),
	search(NewPaths,Path).


NewState expands [State|_]:-
	arc(State,NewState).

