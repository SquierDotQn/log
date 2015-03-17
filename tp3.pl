/* Théo Plockyn Grp3 */
grille([[_,_,_,_,_,_,_,_,_], 
	[_,_,_,_,_,3,_,8,5],
	[_,_,1,_,2,_,_,_,_],
	[_,_,_,5,_,7,_,_,_],
	[_,_,4,_,_,_,1,_,_],
	[_,9,_,_,_,_,_,_,_],
	[5,_,_,_,_,_,_,7,3],
	[_,_,2,_,1,_,_,_,_],
	[_,_,_,_,4,_,_,_,9]]).
	
/* Q1 */
printline([]) 		:- writeln('|'),!.
printline([T|Q]) 	:- printline2(T) , printline(Q),!.
printline2(A) 		:- integer(A),!,write('|'),write(A).
/* on arrive dans cette derniere branche si A n'est pas un nombre */
printline2(_)		:- write('| ').

/* Q2 */
print([]).
print([T|Q]) :- printline(T),print(Q).

/* Q3 */
bonnelongueur([],0).
bonnelongueur([_|Q],N)	:- bonnelongueur(Q,M), N is M+1.

/* Q4 */
bonnetaille([T|Q],N)	:- bonnelongueur(T,N), bonnetaille(Q,N),!. 	
bonnetaille([T],N)	:- bonnelongueur(T,N).

/* Q5 */
:- use_module(library(clpfd)).
verifie([]).
verifie([T|Q]) :- all_different(T), T ins 1..9, verifie(Q).

/* Q6 */
eclate([], L, L).
eclate([T|Q], [], L) :- eclate(Q, [], L2), L = [[T]|L2].
eclate([T1|Q1], [T2|Q2], L) :- eclate(Q1, Q2, L2), L = [[T1|T2]|L2].

/* Q7 */
transp([], []).
transp([T|Q], R) :- eclate(T, Z, R), transp(Q,Z).

/* Q8 */
decoupe([],[],[],[]).
decoupe([A1,B1,C1|L1],[A2,B2,C2|L2],[A3,B3,C3|L3],R) :- decoupe(L1,L2,L3,R2), R = [[A1,B1,C1,A2,B2,C2,A3,B3,C3]|R2].

/* Q9 */
carres([], []).
carres([A,B,C|L], R) :- decoupe(A, B, C, R1), carres(L, R2), append(R1, R2, R).

/* Q10 ne marche pas, je ne comprend pas pourquoi */
solution(L) :- transp(L,RL), /* RL est la transposée de L */
		bonnetaille(L,9),
		verifie(L), verifie(RL),
		carres(L, GR), /* GR est la grille où les carrés sont faits, RG sa transposée */
		bonnetaille(GR,9),
		verifie(GR).
