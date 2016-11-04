:- dynamic isAt/2, isIn/1.

isIn(room1).

isDoor(room1, n, room2) :- isAt(keys, inventory).
isDoor(room2, s, room1).
isDoor(room1, w, room3).
isDoor(room3, e, room1).

isAt(keys, room3).
isAt(book, room3).

walk(Direction) :-
  isIn(Location),
  isDoor(Location, Direction, Destination),
  retract(isIn(Location)),
  assert(isIn(Destination)),
  write('You walked '), write(Direction), nl,
  look.

walk(_) :- write('Nope!'), nl.

take(Item) :-
  isIn(Location),
  isAt(Item, Location),
  retract(isAt(Item, Location)),
  assert(isAt(Item, inventory)),
  write('You took the '), write(Item), nl. 

take(_) :-
  write('Nope!'),
  nl.

help :-
  write('Type in your commands as queries (i.e., using standard Prolog syntax).'),
  nl.

look :- isIn(Location),
  write('You are in '),
  write(Location),
  nl.

play :- help, look.
