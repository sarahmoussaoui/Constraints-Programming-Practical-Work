cls :- write("\33\[2J").

%homme/1
homme(ali).
homme(hacene).
homme(hakil).
homme(mohamed).
homme(said).
homme(samir).

%femme/1
femme(djamila).
femme(fatma).
femme(houria).
femme(lilia).
femme(linda).

%pere/2
pere(mohamed,samir).
pere(samir,lilia).
pere(samir,said).
pere(said,hacene).
pere(said,linda).
pere(hakim,ali).

%mere/2
mere(fatma,samir).
mere(houria,lilia).
mere(houria,said).
mere(lilia,ali).
mere(djamila,hacene).
mere(djamila,linda).

%parent/2
parent(X,Y):-mere(X,Y).
parent(X,Y):-pere(X,Y).

%fils/2
fils(X,Y):-homme(X),parent(Y,X).

%fille/2
fille(X,Y):-femme(X),parent(Y,X).

%enfant/2
enfant(X,Y):-parent(Y,X).

%grand_parent/2
grand_parent(X,Y):-parent(X,Z),parent(Z,Y).

%grand_pere/2
grand_pere(X,Y):-pere(X,Z),parent(Z,Y).

%grand_mere/2
grand_mere(X,Y):-mere(X,Z),parent(Z,Y).

%frere/2
frere(X,Y):-homme(X),pere(Z,X),pere(Z,Y),mere(T,X),mere(T,Y).

%soeur/2
soeur(X,Y):-femme(X),pere(Z,X),pere(Z,Y),mere(T,X),mere(T,Y).


%frere_ou_soeur/2
frere_ou_soeur(X,Y):-frere(X,Y).
frere_ou_soeur(X,Y):-soeur(X,Y).

%tante/2
tante(X,Y):-soeur(X,Z),parent(Z,Y).

%cousin_cousine
cousin_cousine(X,Y):-frere_ou_soeur(Z,T),parent(Z,X),parent(T,Y).




