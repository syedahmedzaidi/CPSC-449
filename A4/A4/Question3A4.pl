:- dynamic isAt/2, isIn/1.

% Initial starting position
  isIn(cell).

% Paths to other room. 

  isDoor(cell, north, guardWithKeys) :- isAt(pin,inventory), openShackles(pin). 
  isDoor(guardWithKeys, north, chambers) :- isAt(keys, inventory).
  isDoor(guardWithKeys, south, cell).
  isDoor(chambers, north, hallway).
  isDoor(chambers, south, guardWithKeys).
  isDoor(hallway, south, chambers).
  isDoor(hallway, west, stairs).
  isDoor(hallway, east, room) :- (isAt(dagger, inventory)) -> fightVamp ; unexpected.
  isDoor(room, west, hallway).
  isDoor(stairs, east, hallway).
  isDoor(stairs, up, mainHall).

% Different Level. Main Level

  isDoor(mainHall, down, stairs).
  isDoor(mainHall, north, diningRoom).
  isDoor(diningRoom, south, mainHall).
  isDoor(mainHall, south, kingsLair) :- isAt(invisibilityCloak, inventory), proceed.
  isDoor(kingsLair, north, mainHall).
  isDoor(mainHall, east, knightsLair) :- (isAt(garlic, inventory) , isAt(stake, inventory), isAt(dagger, inventory); isAt(longSword, inventory)) -> fightKnights ; unexpected1.
  isDoor(knightsLair, west, mainHall).
  isDoor(mainHall, west, darkRoom).
  isDoor(darkRoom, east, mainHall).
  isDoor(kingsLair, east, castleEntrance).
  isDoor(castleEntrance, out, out) :- winner.
  isDoor(darkRoom, middle, bottomLessPit) :- unexpected2.
  isDoor(darkRoom, left, armoury).
  isDoor(armoury, back, darkRoom).
  isDoor(darkRoom, right, soldierBunker) :- unexpected3.

%Starting Position of all items that are pickable

  isAt(pin, cell).
  isAt(keys, guardWithKeys).
  isAt(guardWithKeys, cell).
  isAt(dagger, hallway).
  isAt(table, mainHall).
  isAt(garlic, diningRoom).
  isAt(severedHead, diningRoom).
  isAt(candle, diningRoom).
  isAt(matchBox, diningRoom).
  isAt(stake, mainHall).
  isAt(deadbodies, mainHall).
  isAt(book, darkRoom).
  isAt(shield, armoury).
  isAt(longSword, armoury).
  isAt(chainmail, armoury).
  isAt(helmet, armoury).
  isAt(invisibilityCloak, armoury).

% room descriptions
describeRoom(cell) :- 
  write('You are in a cell that has only one entrance/exit. You see a guard standing by it. Can you make it to him?') ,!,nl.

describeRoom(guardWithKeys) :- 
  write('You find yourself standing right behind the guard! You notice he is sleeping.'), nl,
  write('You can either steal the keys, or kill him and then take the keys. What do you do?'), !,nl.

describeRoom(chambers) :-
  write('You find yourself in a large room. It seems it is used for wine storage. You see an exit towards the north side!'), !,nl.

describeRoom(hallway) :-
  write('You find yourself in a large hallway lit by candle scones. The hallway splits from the middle.'),nl,
  write('There is a path towards the east and towards the west.'), !,nl.

describeRoom(stairs) :-
  write('You find yourself in front of a large stair case. It seems to be going up.') ,! ,nl.

describeRoom(mainHall):-
  write('You find yourself in a huge hall. It seems a battle had taken place here. Dead bodies lay everywhere.'), nl,
  write('Armour statues with blood splashes on them, a very long table with the centre piece from the ceiling crashed on top of it.'), !, nl.

describeRoom(diningRoom):-
  write('You find yourself in a room which you believe to be the dining room of the vampires.'), nl,
  write('You can tell that by the amount of blood, humans hanging upside down, and a round dining table in the middle.'), !, nl.

describeRoom(darkRoom) :- 
  write('Wow! This is a very dark room. Having a candle would really help!'), !, nl.

describeRoom(armoury):-
  write('You find yourself in a room you believe to be storage for weapons and armour. This is a useful place!'), !, nl.

describeRoom(kingsLair):- 
  write('So this is the Kings room! You can feel the pressure. The demonic king sits in the chair east to you.'), nl,
  write('His skull throne dripping with fresh blood; It strikes fear in your heart but you can escape!'), nl,
  write('The castle entrance is right in front of him, and he is unable to see you!'),nl,
  write('Hurry!'), !,nl.

% Walk - Allows to change rooms.

% special walk case where you are in cell but dont have pin thus you cant move anywhere. if you do have pin you can move using third case
walk(_) :-
  isIn(cell),
  not(isAt(pin, inventory)) -> write('You dont have the pin to open your shackles, thus you cant move!'), !, nl. 

% special walk case where you dont have invisibilityCloak and you wish to enter kingsLair. You are not allowed to. If you do have the cloak you use third case
walk(south) :-
isIn(mainHall),
not(isAt(invisibilityCloak, inventory)) -> write('You feel a strong bloodthirst from the other side of the door. You decided not to go past that door for now until you have found a way.'), !, nl.


walk(Direction) :-
  isIn(Location),
  isDoor(Location, Direction, Destination),
  retract(isIn(Location)),
  assert(isIn(Destination)),
  write('You walked '), write(Direction), nl,
  look,!.

% anyother walk command not acceptable.
walk(_) :- write('Nope!'), !, nl.

% Just writes to swi that you are able to pass into this room with this item
proceed :-
  write('Thanks to your invisibility Cloak, you arent noticed by the Vampire King!'), !,
  nl.

% Table is not pickable
take(table) :-
  write('You cant carry a table around!') , !,
  nl.

%severed Head is not pickable
take(severedHead) :-
  write('Forget the head, move on!'), !,
  nl.

%dead bodies are not pickable
take(deadbodies) :-
  write('Forget about the dead bodies, you have got to hurry!'), !,
  nl.

%pick an item & add it to inventory
take(Item) :-
  isIn(Location),
  isAt(Item, Location),
  retract(isAt(Item, Location)),
  assert(isAt(Item, inventory)),
  write('You took the '), write(Item), !,nl. 

% any other command is not pickable
take(_) :-
  write('Nope!'),!,
  nl.

%drops this item in the current location 
drop(Item) :-
  isIn(Location),
  retract(isAt(Item , inventory)),
  assert(isAt(Item, Location)),
  write('You dropped the '), write(Item), write(' in '), write(Location), !, nl.

%any other command to drop is not acceptable
drop(_) :-
  write('Nope!'),!,
  nl.

% one can only read the book if he has book in inventory, a candle and a match box
readThe(book) :- 
  (not(isAt(book, inventory)), not(isAt(candle, inventory)),  not(isAt(matchBox, inventory))) -> write("You dont have the book or the equipment needed to read this book.") ; readTheBook(book), !, nl.

readThe(detailedMap):-
  not(isAt(detailedMap,inventory)) -> write('You dont have the map in your inventory!') ; readTheMap(detailedMap) ,!, nl.

%any oher command with readThe is not possible
readThe(_) :-
  write('Not a readable item!'), !, nl.

%contents of the book.
readTheBook(book) :- 
  write('The book contains some information about this vampire race!'), nl,
  write('It says that one must possess a clove of garlic and a stake to fight effectively against the 12 Elite Star Knights!'), nl,
  write('Else you would be utterly destroyed.'), nl,
  write('It also states one must never fight the Vampire King since he is immortal. To get past him you need an invisibility Cloak!'), !, nl.

%contents of the detailedMap
readTheMap(detailedMap) :-
  write('The map describes the layout of the castle.'), nl,
  write('After carefully reading it, you found the exit!'), nl,
  write('From where you are standing you must walk west.'), nl,
  write('You will arrive in the ') , write(mainHall),nl, 
  write('From there, walk south. You will arrive at the '), write(kingsLair), nl,
  write('You must some how walk south from the '), write(kingsLair), nl,
  write('You will then see the'), write(castleEntrance), nl,
  write('You can walk(out) of the '), write(castleEntrance), !, nl.


%if you walk into east room of main floor, you fight the knights only if you have a garlic and a stake
fightKnights :- 
  write('You have walked into the 12 Elite Star Knights Lair!'), nl,
  write('You valiantly fight the 3 of the 12 Elite Star Knights who are currently in the room.'), nl,
  write('Your blade collides with their fangs!'), nl,
  write('AND YOU ARE VICTORIOUS!'), nl,
  write('One of them dropped a detailedMap of the castle, and another dropped an invisibilityCloak!'), nl,
  assert(isAt(detailedMap, knightsLair)),
  assert(isAt(invisibilityCloak, knightsLair)), !, nl.

% you fight group of vampires in under ground room.
fightVamp :-
  write('Oh no! You have walked in a room where 3 vampires are playing cards.'), nl,
  write('You valiantly fight against the group of vampires with your dagger!'), nl,
  write('You manage to defeat them!.'), !,nl,nl, nl.

%unexpect , 1 , 2 ,3 all are where you walk into wrong room and get yourself killed. restarts the game
unexpected :- 
  write('You find yourself in a room with 3 vampires playing cards.'), nl,
  write('Unfortunately you dont have the equipment to fight them.'), nl,
  write('You become their food! Noob.'), nl,
  write('Restarting the Game!'),!,nl,nl,nl,
  restart.

unexpected1 :-
  write('You find yourself in a room with 3 of the 12 Elite Star Knights.'), nl,
  write('Unfortunately, You dont have all the equipment needed to fight them.'), nl,
  write('You become their food. They shred you to pieces and suck on your blood. Game Over.'), nl,
  write('Restarting the Game!'), nl,nl,nl,
  restart.

unexpected2 :- 
  write('Wrong Way!! As you walked down the path, there came a point; when there was no path!'), nl,
  write('It ended up being a bottomLess Pit! You helplessly flung your hands and feet, but were no match for Gravity.'), nl,
  write('You ended up crushing your skulls, and dying on the spot! Fatality!'), nl,
  write('Restarting the Game!') , nl, nl,nl,
  restart.

unexpected3 :-
  write('You find yourself in the soldiers Bunker. You are outnumbered.'), nl,
  write('You become their food. They shred you to pieces and suck on your blood. Game over.'), nl,
  write('Restarting the Game!'), nl, nl,nl,
  restart.

% just writes that you have escaped the shackles only if you have the pin.
openShackles(pin) :- 
  write('You escaped from the shackles! Nice!'), !,
  nl.

openShackles(_) :- 
  write('Nope!'),!,
  nl.

% prints you have killed the guard and drops keys into the room.
killThe(guardWithKeys) :-
  write('You killed the Guard with your bare hands.'), nl,
  isIn(Location),
  retract(isAt(keys, guardWithKeys)),
  assert(isAt(keys, Location)),
  write('The Guard dropped the keys!'),
  !,nl.

%kill anyother command is not acceptable
killThe(_) :- 
  write('Nope!'),!,
  nl.

% if you the item in inventory then prints that you are using the item otherwise a Different case states you dont have the item
useThe(longSword) :-
    isAt(longSword, inventory) -> (write('You are now using a ') , write(longSword), write(' right now.')), !, nl.

useThe(longSword):-

  not(isAt(longSword, inventory)) -> write('You dont have a long Sword in your inventory.'), !, nl.


useThe(dagger) :-
    isAt(dagger, inventory) -> (write('You are now using a ') , write(dagger), write(' right now.')) , !,nl.

useThe(dagger) :-
    not(isAt(dagger, inventory)) -> write('You dont have a dagger in your inventory.'),!,nl.

    
useThe(shield) :-
    isAt(shield, inventory) -> (write('You are using a ') , write(shield), write(' right now.')), !, nl.

useThe(shield) :-
    not(isAt(shield, inventory)) ->  write('You dont have a shield in your inventory.'), !, nl.

useThe(invisibilityCloak) :-
    isAt(invisibilityCloak, inventory) -> (write('You are now using a ') , write(invisibilityCloak)) , !, nl.

useThe(invisibilityCloak) :-
    not(isAt(invisibilityCloak, inventory)) ->  write('You dont have a invisibility Cloak in your inventory.') , !, nl.

useThe(chainmail) :-
    isAt(chainmail, inventory) -> (write('You are now using a ') , write(chainmail)) , !, nl.

useThe(chainmail) :-
    not(isAt(chainmail, inventory)) -> write('You dont have a chainmail in your inventory.') , !, nl.

useThe(helmet) :-
    isAt(helmet, inventory) -> (write('You are now using a ') , write(helmet)), !, nl.

useThe(helmet) :-
    not(isAt(helmet, inventory)) -> write('You dont have a helmet in your inventory.') , !, nl.

useThe(_) :-
  write('Nope!'), !,
  nl.

% Introduction, the setting to the game.
intro :-
  nl, nl,
  write(' Boom! Rumble! Rumble! Rumble!'), nl,
  write(' You slowly open your eyes.'), nl,
  write(' You find yourself in a room with nothing inside other than a light bulb.'), nl,
  write(' "Where am I?"'), nl,
  write(' You suddenly remember... You were hunting vampires when you stumbled upon a castle.'), nl, 
  write(' Yes, it was the castle ruled by the Vampire King. You fought valiantly but were no match '),
  write(' infront of the Vampire King and his 12 Elite Star Knights.'), nl,
  write(' You were captured and brought to the basement, Where you are imprisoned.'), nl,
  write(' As a member of the Recon battalion, You must report to General Yhwach to let him know of the immediate danger from the Vampires.'), nl,
  write(' You must first escape from the shackles and then Make your way to your base - Wahrwelt.') , nl,nl,
  write(' Type in your commands as queries (i.e., using standard Prolog syntax).'),
  !, nl,nl,nl.

% describes the setting of the room and items in it.
look :- 
  isIn(Location), nl,
  write('You are in '),
  write(Location),
  nl,
  describeRoom(Location), nl,
  write('You see '),
  findall(Item, isAt(Item,Location), Items),
  show_Items(Items),
  !, nl.

% prints those items as a list.
show_Items([]) :- write('Nothing!'),!.
show_Items(Items) :- write(Items).

% if you have won the game.
winner :-
  write('Yes! You did it! You escaped! Run to your battalion commander now!'), nl,
  write('Type halth. to stop the game or type restart. to play once again!'), !, nl.

%list of all the commands that you can use.
help :- 
  write('Following are the list of acceptable commands:') , nl,
  write('1) help : guide to game.'), nl,
  write('2) take(): takes an item that is in the room.'), nl,
  write('3) killThe() : kills a specific person in the room.'),nl,
  write('4) useThe() : uses an item that is in your inventory.'), nl,
  write('5) walk() : walk to directions and special commands to change rooms and explore.'), nl,
  write('6) look: describes the setting of the room and how it is.'), nl,
  write('7) readThe() : reads a readable item.'), nl,
  write('8) drop(): drops an item from the inventory to the current room you are in.'), nl, nl,
  write('Directions = east, west, north, south, up, down, left, right, middle, back, out.'), nl, nl,
  write('Note: up and down can only be used in conjunction to each other, Where as left right middle and back are to be used in conjunctions.'), !, nl.


% to play the game
play :- intro, help, look.

% puts all the items to its correct place, Initial place.
reinitialization :- 
  retractall(isIn(_)),
  assert(isIn(cell)),
  retractall(isAt(_, _)),
  assert(isAt(pin, cell)),
  assert(isAt(keys, guardWithKeys)),
  assert(isAt(guardWithKeys, cell)),
  assert(isAt(dagger, hallway)),
  assert(isAt(table, mainHall)),
  assert(isAt(garlic, diningRoom)),
  assert(isAt(severedHead, diningRoom)),
  assert(isAt(candle, diningRoom)),
  assert(isAt(matchBox, diningRoom)),
  assert(isAt(stake, mainHall)),
  assert(isAt(deadbodies, mainHall)),
  assert(isAt(book, darkRoom)),
  assert(isAt(shield, armoury)),
  assert(isAt(longSword, armoury)),
  assert(isAt(stake, armoury)),
  assert(isAt(chainmail, armoury)),
  assert(isAt(helmet, armoury)),
  assert(isAt(invisibilityCloak, armoury)).

% to restart the game.  
restart :- 
  reinitialization,
  play.