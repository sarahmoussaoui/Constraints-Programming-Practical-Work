cls :- write("\33\[2J").

transposer([0],[0]).
transposer([A,B],[MA,MB]):-
    MA is -A,
    MB is -B.

intersection([0],A,A):-!.
intersection(A,[0],A):-!.
intersection([_,Sup1],[Inf1,_],[]):-
    Sup1 < Inf1, !.

intersection([Inf1,_],[_,Sup2],[]):-
    Sup2 < Inf1, !.

intersection([Inf1,Sup1],[Inf2,Sup2],[Inf, Sup]):-
    max(Inf1, Inf2, Inf),
    min(Sup1, Sup2, Sup).

max(A, B, A):- A>B,!.
max(_, B, B).

min(A, B, A):- A<B, !.
min(_, B, B).

comp([0], _, [0]):-!.
comp(_, [0], [0]):-!.
comp([A, B], [C, D], [Inf, Sup]):-
    Inf is A+C,
    Sup is B+D.

bdAC3(Mp):-
   length(Mp, L),
   Delta is 1 + 8 * L,
   N is (-1+sqrt(Delta))/2,
   vérifer1(Mp, 1, N).

vérifier1(_, I, N):- I>N,!.
vérifier1(Mp, I, N):-
    Imoins is I-1,
    length(L1, Imoins),
    append(L1, [BDI|_], Mp),
    vérifier2(Mp, I, BDI, 1, N),
    Iplus is I+1,
    vérifier1(Mp, Iplus, N).

vérifier2(_, _, _, J, N):-
    J > N,!.

vérifier2(Mp, I, BDI, I, N):-
    !,J is I+1,
    vérifier2(Mp, I, BDI, J, N).

vérifier2(Mp, I, BDI, J, N):-
    J<I,!,
    Jmoins is J - 1,
    length(L1, Jmoins),
    append(L1, [BDJ|_], Mp),
    length(Mp, Lg1),
    Lg2 is (N-I)*(N-J+1)/2,
    Lg is Lg1 - Lg2 + I - J - 1,
    length(L2, Lg),
    append(L2, [JI|_], Mp),
    comp(BDJ, JI, E),
    intersection(BDI, E, E),
    Jp is J+1,
    vérifier2(Mp, I, BDI, Jp, N).

vérifier2(Mp, I, BDI, J, N):-
    Jmoins is J - 1,
    length(L1, Jmoins),
    append(L1, [BDJ|_], Mp),
    length(Mp, Lg1),
    Lg2 is (N-J)*(N-I+1)/2,
    Lg is Lg1 - Lg2 + J - I - 1,
    length(L2, Lg),
    append(L2, [IJ|_], Mp),
    transposer(IJ, JI),
    comp(BDJ, JI, E),
    intersection(BDI, E, E),
    Jp is J+1,
    vérifier2(Mp, I, BDI, Jp, N).
