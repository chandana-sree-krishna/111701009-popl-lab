man(arjun).
man(pandu).
man(bheem).
man(yudhistir).
woman(kunti).
woman(madri).
parent(arjun, pandu).
parent(arjun, kunti).
parent(bheem, pandu).
parent(bheem, kunti).
parent(yudhistir, pandu).
parent(yudhistir, kunti).

parent(nakul, pandu).
parent(nakul, madri).
parent(sahadev, pandu).
parent(sahadev, madri).

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
 half_sibling(X,Y) :- dif(X,Y), mother(X,Z), mother(Y,Z), dif(Z,F), father(X,Z), father(Y,F).

%% half_brother(X,Y) :- dif(X,Y), parent(X,Z), parent(Y,Z), not sibling(X,Y).
