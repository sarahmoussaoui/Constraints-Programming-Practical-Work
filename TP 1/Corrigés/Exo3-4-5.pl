cls :- write("\33\[2J").

%fusion/3
fusion([],L,L).
fusion(L,[],L).
fusion([X|L1],[Y|L2],[X|L3]):-X<Y,!,fusion(L1,[Y|L2],L3).
fusion(L1,[X|L2],[X|L3]):-fusion(L1,L2,L3).

%suppocct/2
supptoutes(_,[],[]).
supptoutes(X,[X|L1],L2):-!,supptoutes(X,L1,L2).
supptoutes(X,[Y|L1],[Y|L2]):-supptoutes(X,L1,L2).

suppocct([],[]).
suppocct([X],[X]).
suppocct([X,Y|L1],L2):-supptoutes(X,[Y|L1],L3),suppocct(L3,L2).

%triSelection/2
%triSelection([],[]).
triSelection([X],[X]):-!.
triSelection([X,Y|L1],[Z|L2]):- min([X,Y|L1],Z),
                                suppocct1(Z,[X,Y|L1],L3),
                                triSelection(L3,L2).

min([X],X).
min([X,Y|L1],Z):-X<Y,!,min([X|L1],Z).
min([_,X|L1],Y):-min([X|L1],Y).


suppocct1(X,[X|L],L):-!.
suppocct1(Y,[X|L1],[X|L2]):-suppocct1(Y,L1,L2).

%triInsertion/2
triInsertion([X],[X]).
triInsertion([X,Y|L1],L2):-triInsertion([Y|L1],L3),
                               inserer(X,L3,L2).

inserer(X,[],[X]).
inserer(X,[Y|L],[X,Y|L]):-X=<Y,!.
inserer(X,[Y|L1],[Y|L2]):-inserer(X,L1,L2).




