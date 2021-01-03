% 0 - Print Text
% write('Hello World'),nl,write('Let\'s Program').

% 1st - Rules 
loves(romeo,juliet). % Romeo loves Juliet
%loves is a predicate and romeo and juliet are atoms(constants)

loves(juliet,romeo) :- loves(romeo,juliet). %rule, that says if the item on the right is 


% 2nd - Facts 
male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).
 
female(alice).
female(betsy).
female(diana).

% listing(male). = list all clauses defining the predicate male
% male(X), female(Y). = Show all combinations of male and female

% 3rd - Rules
happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

%runs(albert) :- happy(albert). Albert only runs if he is happy
%run(albert). will return yes

%dances(alice) :-
%  happy(alice),
%  with_albert(alice).
%Check if both alice is happy and if alice is with albert. If so, returns yes


%does_alice_dance :- dances(alice),
%	write('When Alice is happy and with Albert she dances').
% Type this on the terminal and will print because dances(alice) is true


% 4th - Variables
parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

% parent(X,bob). devolve os parentes do Bob
% parent(X,bob), dances(X).
