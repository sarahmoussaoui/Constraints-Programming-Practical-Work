cls :- write("\33\[2J").

%appartient/2
appartient(X,[X|_]). % ou :-!. pour faire une coupure
appartient(X,[_|L]):-appartient(X,L).

%premier/2
premier(X,[X|_]).

%dernier/2
dernier(X,[X]).
dernier(X,[_,Y|L]):-dernier(X,[Y|L]). /*(X,[_|L]):-(X,L)*/


%avant_dernier/2
avantdernier(X,[X,_]):-!.
avantdernier(X,[_,Y,Z|L]):-avantdernier(X,[Y,Z|L]).

%suppK/3
suppK(1,[_|L],L):-!.
suppK(K,[X|L1],[X|L2]):-K2 is K-1,suppK(K2,L1,L2).

%subtitue/3
substitue(X,Y,[X|L1],[Y|L2]):-!,substitue(X,Y,L1,L2).
substitue(X,Y,[Z|L1],[Z|L2]):-substitue(X,Y,L1,L2).
substitue(_,_,[],[]).

%len/2
longeur([],0).
longeur([_|L],K):-longeur(L,K2),K is K2+1.

%somme/2
somme([X],X).
somme([X,Y|L],S):-somme([Y|L],S2),S is S2+X.

%affiche1/1
affiche1([X|L]):-write(X),write("\n"),affiche1(L).
affiche1([]).

%affiche2/1
affiche2([]).
affiche2([X|L]):-affiche2(L),nl,write(X).

%pair/1
pair([]).
pair([_,_|L]):-pair(L).

%aumoins2occ/2
aumoins2occ(X,[X|L]):-!,appartient(X,L).
aumoins2occ(X,[_|L]):-aumoins2occ(X,L).

%concat/3
concate([],L,L).
concate([X|L1],L2,[X|L3]):-concate(L1,L2,L3).

%palindrome/1
palindrome([]).
palindrome([_]).
palindrome([X,Y|L]):-dernier(X,[Y|L]),longeur([Y|L],K),
                     suppK(K,[Y|L],L2),palindrome(L2).



