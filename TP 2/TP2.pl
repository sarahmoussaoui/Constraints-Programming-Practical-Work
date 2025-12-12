cls :- write("\33\[2J").

% TP2: problème n-reine

% Utilisation de solveur de CSP discret de swi-prolog
:- use_module(library('clp/bounds')).

coloriage_t(Vars):-length(Vars,3),
    Vars in 1..3,
    X1#\=X2,
    X1#\=X3,
    X2#\=X3,
    label(Vars).

%coloriage(Vars,N,K):-length(Vars,N), % definir le nombre de variable
%    Vars in 1..K, % domaine de tous les variables
%    all_different(Vars), % les contraintes sur les variables
%    label(Vars). % appel au solver


% reineN/2
reineN(Vars,N):-length(Vars,N),
    Vars in 1..N,
    all_different(Vars),
    cont_diag(Vars,1).

cont_diag([_],_):-!.
cont_diag([XI|Vars],I):-Iplus is I+1,
    distribuer(XI,I,Vars,Iplus),
    cont_diag(Vars,Iplus).

distribuer(_,_,[],_).
distribuer(XI,I,[XJ|Vars],J):-XI-XJ #\= I-J,
           XI-XJ #\= J-I,
           Jplus is J+1,
           distribuer(XI,I,Vars,Jplus).
