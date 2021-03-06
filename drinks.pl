
% /*
%  * CS3210 - Principles of Programming Languages - Fall 2020
%  * Instructor: Thyago Mota
%  * Description: Prg03 - Prolog Expert System
%  * Student: Larsen Close, Stuart Griffin
%  */


:- dynamic fact/1, fiction/1.

is_true(Question) :-
  (
    fact(Question) -> true;
    fiction(Question) -> fail;
    format('~w?~n', [Question]),
    Answer = read(yes),
    Answer -> assert(fact(Question)); 
    assert(fiction(Question)), fail).


drink(lemonade) :-          is_true('Is the drink flavored from natural sources'),     is_true('Is the drink citrus').
drink(soda) :-              is_true('Is the drink Carbonated'),                        is_true('Is the drink sweet from added suger'),                  is_true('Is there a danger of diabetes with lots of the drink').  
drink(beer) :-              is_true('Is the drink made from a plant'),                 is_true('Does the drink have alchohol'),                         is_true('Does the drink create the smell of American Fraternities').
drink(apple_juice) :-       is_true('Is the drink flavored from natural sources'),     is_true('Is the drink often a morning beverage'),                is_true('Is the drink made from a plant').
drink(orange_juice) :-      is_true('Is the drink flavored from natural sources'),     is_true('Is the drink often a morning beverage'),                is_true('Is the drink citrus').
drink(fruit_punch) :-       is_true('Is the drink flavored from natural sources'),     is_true('Is the drink sweet from added suger').
drink(wine) :-              is_true('Does the drink have alchohol'),                   is_true('Is the drink flavored from natural sources'),           is_true('Is the drink made from a plant').
drink(root_beer) :-         is_true('Is the drink sweet from added suger'),            is_true('Is the drink flavored from natural sources'),           is_true('Does its name sound like alcohol').
drink(tonic) :-             is_true('Is the drink Carbonated'),                        is_true('Has your drink been used to fight malaria').
drink(tequila) :-           is_true('Is the drink made from a plant'),                 is_true('Does the drink have alchohol'),                         is_true('Is the drink reknown for creating memory (or not so memorable events)').
drink(rum) :-               is_true('Is the drink made from a plant'),                 is_true('Does the drink have alchohol'),                         is_true('Do pirates love the drink').
drink(water) :-             is_true('Is the drink natural'),                           is_true('Are we essentially flesh bags made of the drink').
drink(tropical_punch) :-    is_true('Is the drink flavored from natural sources'),     is_true('Is the drink sweet from added suger'),                  is_true('Does the drink often break through walls and scream -oh yea!-').
drink(milk) :-              is_true('Is the drink natural'),                           is_true('Does the drink come from animal'). 
drink(chocolate_milk) :-    is_true('Is the drink sweet from added suger'),            is_true('Does the drink come from animal'),                      is_true('I do believe you have stumped me, if that is correct I will reward you with chocolate milk'). 


begin :-
    nl,
    write('Welcome to this ES about drinks!'), nl,
    write('Think of a drink, I will try to quess it!'), nl,
    write('Please anser in the exact form yes. or no.'), nl,
    write('Are you ready to begin?'), nl,
    repeat,
    read(Ready), nl,
    run(Ready), nl,
    undo,
    write('If you would like to try again type begin.').


run(yes) :- (drink(A) -> format('I think your drink is a ~w.~n', [A]); false ). 
run(no) :-  write('Goodbye'), nl, halt. 

undo :- retract(fact(_)),fail. 
undo :- retract(fiction(_)),fail.
undo.