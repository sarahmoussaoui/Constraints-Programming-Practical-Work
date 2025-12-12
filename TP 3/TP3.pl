cls :- write("\33\[2J").

% TP3: sudoku

:- use_module(library('clp/bounds')).

sudoku(Vars):-
    length(Vars,81),
    Vars in 1..9,
    cont_ligne(Vars),
    cont_colonne(Vars,1),
    cont_carre(Vars,1),
    label(Vars),
    afficher(Vars).

cont_ligne([]):-!.
cont_ligne(Vars):-
    length(Vars1,9),
    append(Vars1, Vars2, Vars),
    all_different(Vars1),
    cont_ligne(Vars2).


cont_colonne(_,10):-!.
cont_colonne(Vars,I):-
    ext_colonne(Vars,I,CI),
    all_different(CI),
    Iplus is I+1,
    cont_colonne(Vars,Iplus).

ext_colonne([],_,[]):-!.
ext_colonne(Vars,I,[XI|CI]):-
    Imoins is I-1,
    length(Vars1,Imoins),
    append(Vars1,[XI|_],Vars),
    length(Vars2,9),
    append(Vars2,Vars3,Vars),
    ext_colonne(Vars3,I,CI).

cont_carre(_,10):-!.
cont_carre(Vars,I):-
    ext_carre(Vars,I,CarreI),
    all_different(CarreI),
    Iplus is I+1,
    cont_carre(Vars,Iplus).

ext_carre([],_,_):-!.
ext_carre(Vars,I,[X1,X2,X3,X4,X5,X6,X7,X8,X9]):-
    Quotient is (I-1) div 3,
    Reste is (I-1) mod 3,
    Longeur1 is Quotient*27+Reste*3,
    length(L1,Longeur1),
    append(L1,[X1,X2,X3|_],Vars),
    Longeur2 is Longeur1+9,
    length(L2,Longeur2),
    append(L2,[X4,X5,X6|_],Vars),
    Longeur3 is Longeur2+9,
    length(L3,Longeur3),
    append(L3,[X7,X8,X9|_],Vars).

afficher([]):-!.
afficher(Vars):-
    length(Vars1,9),
    append(Vars1,Vars2,Vars),
    write(Vars1),
    nl,
    afficher(Vars2).
