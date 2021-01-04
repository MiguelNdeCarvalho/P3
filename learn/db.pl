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

get_grandchild :-
	parent(albert, X),
	parent(X,Y),
	write('Alberts grandchild is '),
	write(Y), nl.

get_grandparent :-
	parent(X, carl),
	parent(X, charlie),
	format('~w ~s grandparent ~n', [X, "is the"]).

brother(bob,bill).

grand_parent(X, Y) :-
	parent(Z, X),
	parent(Y, Z).

blushes(X) :- human(X).
human(derek).

%blushes(dereke). will return true

stabs(tybalt,mercutio,sword).
hates(romeo, X) :- stabs(X, mercutio, sword).
%hates(romeo, tybalt). will be true


% 5th - If Statements

what_grade(5) :-
	write('Go to kindergarten').

what_grade(6) :-
	write('Go to 1st Grade').

what_grade(Other) :-
	Grade is Other - 5, % Grade = Other - 10
	format('Go to grade ~w', [Grade]).

% 6th - Complex Terms / Structures

owns(albert, pet(cat, olive)). % Albert owns a cat(pet) named olive

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_customer_balance(FName, LName) :-
	customer(FName, LName, Bal),
	write(FName), tab(1),
	format('~w owes us $~2f ~n', [LName, Bal]). % ~2f adds the dollar sign

vertical(line(point(X,Y), point(X,Y2))).
horizontal(line(point(X,Y), point(X2,Y))).

% vertical(line(point(5, 10), point(5, 20))). = yes
% horizontal(line(point(10, 20), point(30, 20))). = yes

% We can also ask what the value of a point should be to be vertical
% % vertical(line(point(5, 10), point(X, 20))). = X = 5
%
% % We could also ask for the X and Y points
% % verticalline((point(5, 10), X)). = X = point(5,_)

% 7th - Comparison

% alice = alice. = yes
% 'alice' = alice. = yes (Prolog considers these to be the same)
% \+ (alice = albert). = yes (\+ = NOT)

% 3 > 15. = no
% 3 >= 15. = no
% 3 =< 15. = yes

% W = alice. = yes
% This says that we can assign the value of alice to W and not that
% W is equal to alice


% 8th - Trace

warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feathers(penguin).
have_hair(human).

mammal(X) :-
	warm_blooded(X),
	produce_milk(X),
	have_hair(X).

%trace. - Turns Trace ON
% mammal(human).
%       1    1  Call: mammal(human) ?
%       2    2  Call: warm_blooded(human) ?
%       2    2  Exit: warm_blooded(human) ?
%       3    2  Call: produce_milk(human) ?
%       3    2  Exit: produce_milkhuman)( ?
%       4    2  Call: have_hair(human) ?
%       4    2  Exit: have_hair(human ?
%       1    1  Exit: mammal()human) ?
% yes
%
% mammal(penguin).
%       1    1  Call: mammal(penguin) ?
%       2    2  Call: warm_bloodedpenguin)( ?
%       2    2  Exit: warm_blooded(penguin) ?
%       3    2  Call: produce_milk(penguin) ?
%       3    2  Exit: produce_milk(penguin) ?
%       4    2  Call: have_hair(penguin) ?
%       4    2  Fail: have_hair(penguin) ?
%       1    1  Fail: mammal(penguin) ?
% no
% notrace. - Turn Trace OFF

% 9th - Recursion

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

% Works for exact matches only
related(X,Y) :-
	parent(X, Y).

% Works for everything
related(X, Y) :-
	parent(X, Z),
	related(Z, Y).

% related(albert,carl). = true

% 10th - Math

% 'is' equals to '='
%X is 2 + 2. X = 4
%X is 3 + (2 * 10). X = 23

% 50 > 30. = yes
% (3*10) >= (50/2). = yes
% \+ (3 = 10). = yes (How to check for not equal)
% 5+4 =:= 4+5. = yes (Check for equality between expressions)
% 5+4 =\= 4+5. = yes (Check for non-equality between expressions)
% 5 > 10 ; 10 < 100. (Checks if 1 OR the other is true)

%X is mod(7,2). X = 1 (remain of the division)

double_digit(X, Y) :-
	Y is X*2.

% Get random value between 0 and 10
% random(0,10,X).

% Get all values between 0 and 10
% between(0,10,X).

% Add 1 and assign it to X
% succ(2,X). (sucessor) X=3

% Get absolute value of value
% X is abs(-8). X=8

% Get highest value
% X is max(10,5). X=10

% Get smallest value
% X is min(10,5). X=5

% Round a value
% X is round(10.56) X=11

% Convert float to integer
% X is truncate(10.56). X=10

% Round down
% X is floor(10.56).

% Round up
% X is ceiling(10.56).

% 2^3
% X is 2** 3

% Check if a number is even
% 10//2 = 5 (is 10 = 2 * 5)
is_even(X) :- 
	Y is X//2, X =:= 2 * Y.

% 11th - Input/Ouput

% write('You saw me'), nl.

% writeq('I show quotes'), nl. writeq - show quotes

say_hi :-
	write('What is your name? '),
	read(X), % enter 'Miguel'
	write('Hi '),
	write(X).

fav_char :-
	write('What is your fav character? '),
	get(X),
	format('The ASCII value ~w is ', [X]),
	put(X), nl.

% Write to a file. write_to_file('test.txt', 'content of the file').
write_to_file(File, Text) :- 
	open(File, write, Stream),
	write(Stream, Text), nl,
	close(Stream).

% Read from a file. read_file('test.txt').
read_file(File) :-
        open(File, read, Stream),

	% Get char from the stream
	get_char(Stream, Char1),

	% Outputs the characters until EOF
	process_stream(Char1, Stream),
	close(Stream).

process_stream(end_of_file, _) :- !.

process_stream(Char, Stream) :-
	write(Char),
	get_char(Stream, Char2),
	process_stream(Char2, Stream).

% 12th - looping

count_to_10(10) :- write(10), nl.

count_to_10(X) :-
	write(X), nl,
	Y is X + 1,
	count_to_10(Y).

count_down(Low, High) :-
	between(Low, High, Y),
	Z is Y + Low,
	write(Z), nl.

guess_num :- loop(start).

loop(15) :- write('You guessed it').

loop(X) :-
	X \= 15,
	write('Guess Number: '),
	read(Guess),
	write(Guess),
	write(' is not the number'), nl,
	loop(Guess).

% 13th - Chaing the Database

% Any predicate you plan to motify should be marked as dynamic before
% this predicate is used in any way

:- dynamic(father/2).
:- dynamic(likes/2).
:- dynamic(friend/2).
:- dynamic(stabs/3).


father(lord_montague,romeo).
father(lord_capulet,juliet).

likes(mercutio,dancing).
likes(benvolio,dancing).
likes(romeo,dancing).
likes(romeo,juliet).
likes(juliet,romeo).
likes(juliet,dancing).

friend(romeo,mercutio).
friend(romeo,benvolio).

% Add new clause to the database at the end of the list for the same
% assertz(friend(benvolio, mercutio)).
% friend(benvolio, mercutio). = yes

% Add clause at the start of the predicate list
% asserta(friend(mercutio, benvolio)).
% friend(mercutio, benvolio). = yes

% Delete a clause
% retract(likes(mercutio,dancing)).
% likes(mercutio,dancing). = no

% Delete all clauses that match
% retractallfather((_,_)).
% father(lord_montague,romeo). = no

% Delete all matching clauses
% retractall(likes(_,dancing)).
% likes(_,dancing). = no

% 14th - Lists

% simple list
% write([1, 2, 3, 4]). = [1, 2, 3, 4]

% We can add items to a list with the | (List Constructor)
% write([albert|[alice, bob]]), nl. = [albert, alice, bob]

% Get the length of a list
% length([1,2,3], X).

% We can divide a list into its head and tail with |
% [H|T] = [a,b,c].

% We can get additional values by adding more variables to the left
% of |
%[X1, X2, X3, X4|T] = [a,b,c,d].

% We can use the anonymous variable _ when we need to reference a
% variable, but we don't want its value
% Let's get the second value in the list
% [_, X2, _, _|T] = [a,b,c,d].

% Find out if a value is in a list with member
% List1 = [a,b,c].
% member(a, List1). = yes

% We could also get all members of a list with a variable
% member(X, [a, b, c, d]).

% Reverse a list
% reverse([1,2,3,4,5], X).

% Concatenate 2 lists
% append([1,2,3], [4,5,6], X).


% Write items in list on separate line
write_list([]).

write_list([Head|Tail]) :-
	write(Head), nl,
	write_list(Tail).
% write_list([1,2,3,4,5]). = Outputs the list

% 15th - Strings

% Convert a string into an Ascii character list
% name('A random string', X).

% Convert a Ascii character list into a string
% name(X, [65,32,114,97,110,100,111,109,32,115,116,114,105,110,103]).

% Append can join strings
join_str(Str1, Str2, Str3) :-

  % Convert strings into lists
  name(Str1, StrList1),
  name(Str2, StrList2),

  % Combine string lists into new string list
  append(StrList1, StrList2, StrList3),

  % Convert list into a string
  name(Str3, StrList3).

% join_str('Another ', 'Random String', X). = X = 'Another Random String'

% get the 1st char from a string
/*
name('Derek', List),
nth0(0, List, FChar),
put(FChar).
*/

% Get length of the string
%atom_length('Derek',X).
