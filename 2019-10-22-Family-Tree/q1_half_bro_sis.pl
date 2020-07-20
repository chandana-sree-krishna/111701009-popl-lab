man(arjun).
man(pandu).
man(bheem).
man(yudhistir).
man(nakul).
man(sahadev).

man(dasharatha).
man(ram).
man(lakshman).
man(aja).
man(dileepa).
man(abhi).
man(vyas).

woman(kunti).
woman(madri).

woman(shanta).
woman(kausalya).
woman(sumithra).
woman(indumati).

parent(arjun, pandu).
parent(arjun, kunti).
parent(bheem, pandu).
parent(bheem, kunti).
parent(yudhistir, pandu).
parent(yudhistir, kunti).
parent(abhi,arjun).

parent(nakul, pandu).
parent(nakul, madri).
parent(sahadev, pandu).
parent(sahadev, madri).
parent(pandu,vyas).

parent(shanta, dasharatha).
parent(shanta, kausalya).
parent(lakshman, dasharatha).
parent(lakshman, sumithra).
parent(ram, dasharatha).
parent(ram, kausalya).
parent(dasharatha, aja).
parent(dasharatha, indumati).
parent(aja, dileepa).

%%% Facts end here %%%%%%%%%%%%%%%%%%%

mother(X,Y)  :- woman(Y), parent(X,Y).
father(X,Y)  :- man(Y), parent(X,Y).
sibling(X,Y) :- dif(X,Y), father(X,Z), father(Y,Z), mother(X,M), mother(Y,M).



%% Exercise
%%
%% What happens when the brother definition does not have dif
%% If dif is not mentioned, then even when X and Y have same value/name, it would give that X is brother of X. Also
%% Eg: brother(arjun, arjun) will be true. 
%% Write a half brother relation similar to brother.

 half_sibling(X,Y) :- dif(X,Y), father(X,Z), father(Y,Z), dif(M,N), mother(X,M), mother(Y,N).
 half_sibling(X,Y) :- dif(X,Y), mother(X,Z), mother(Y,Z), dif(E,F), father(X,E), father(Y,F).

%% half_sibling(X,Y) :- dif(X,Y), parent(X,Z), parent(Y,Z), not sibling(X,Y).

%% Y is half_brother of X

half_brother(X,Y) :- dif(X,Y), man(Y), half_sibling(X,Y).


%% half_brother(X,Y) :- dif(X,Y), man(X), woman(Y), half_sibling(X,Y).
%% half_brother(X,Y) :- dif(X,Y), man(Y), woman(X), half_sibling(X,Y).

%% Y is half_sister of X
 half_sister(X,Y) :- dif(X,Y), woman(Y), half_sibling(X,Y).
 
 
%% half_sister(X,Y) :- dif(X,Y), man(X), woman(Y), half_sibling(X,Y).
%% half_sister(X,Y) :- dif(X,Y), man(Y), woman(X), half_sibling(X,Y).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
