% Question 1

putinto(X,[X|R],R).
putinto(X,[F|R],[F|S]) :- putinto(X,R,S).
isPermutation([X|Y],Z) :- isPermutation(Y,W), putinto(X,Z,W).   
isPermutation([],[]).

% Question 2

isSublist([H|T],[H|T2]) :- isSublist(T,T2).
isSublist([_|T],[H2|T2]) :- isSublist(T,[H2|T2]).
isSublist(_,[]).


% Question 3 Different file by name Question3A4


% Question 4
solution(M) :- solve(M,18).

initial([legolas,aragron,gilmi,gandalf]).

solve(M,D) :-
  initial(T),
  transitions(state(torch, T), state(cross, []), M, D1),
  D1 =< D.

%take torch back to initial
crossBridge(state(torch,L1),state(cross,L2), cross(M),D) :- 
  splitList(L1,M,L2),
  calcTime(M,D).

%take torch across the bridge   
crossBridge(state(cross ,L1),state(torch,L2),torch(X),D) :-
  initial(T),
  subtract(T,L1,R),
  member(X,R),
  ord_union([X],L1,L2),
  person(X,D).

transitions(state(cross,[]),state(cross, []), [], 0).    
transitions(S,U,L,D) :-
  crossBridge(S,T,M,X),
  transitions(T,U,N,Y),
  append([M],N,L),
  D is X + Y.

calcTime([],0) :- !.
calcTime([X|L],C) :- 
  person(X,S), 
  calcTime(L,D), 
  C is max(S,D).

splitList(L,[X,Y],M) :- 
  member(X,L),
  member(Y,L),
  compare(<,X,Y),  
  subtract(L,[X,Y],M).

person(legolas,1).
person(aragron,3).
person(gilmi,5).
person(gandalf,8).