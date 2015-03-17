/* Théo Plockyn, groupe 3 */

/* Q1  */
longueur([], 0).
longueur([_|Q], A) :- longueur(Q, B),
		      A is B+1.

/* Q2  */
somme([], 0).
somme([T|Q], A) :- somme(Q, B),
		   A is B+T.

/* Q3  */
/* membre(_, []) :- false. Ne sert pas car de toute façon si le cas actuel ne correspond à aucune branche, prolog renvoie faux */
membre(T, [T|_]) :- true,!. /* On rajoute le cut parce que de toute façon si c'est vrai, c'est vrai */
membre(X, [_|Q]) :- membre(X,Q).

/* Q4  */
ajoute_en_tete(X, Y, L) :- L = [X|Y].
ajoute_en_tete_deux(X, Y, [X|Y]).

/* Q5  */
ajoute_en_queue(X, [], [X]).
ajoute_en_queue(X, [T|Q], L) :- L = [T|L2], ajoute_en_queue(X, Q, L2),!. /* Le cut permet d'éviter que prolog renvoie false alors que tout s'est bien passé */

/* Q6  */
extraire_tete(X, T, L) :- ajoute_en_tete(T, L, X).
extraire_tete_deux([T|Q], T, Q).

/* Q7  */
concatene([], L2, L2).
concatene(L1, [], L1).
concatene([T|Q], L2, L) :- concatene(Q, L2, L3), L = [T|L3].

/* Q8  */
retourne([], A, A).
retourne([T|Q], L, A) :- retourne(Q, [T|L], A).
/* retourne([1, 2, 3], [], A)  */

/* Q9  */
insert_trie([],[],[]).
insert_trie([],L, L).
insert_trie(X,[Y|QY],L) :- X > Y, insert_trie(X,QY,L1),L = [Y|L1].
insert_trie(X,Y,[X|Y]).

/* Q10 */
tri_insert([],[]).
tri_insert([X],[X]).
tri_insert([X|QX], L) :- tri_insert(QX,L1), insert_trie(X,L1,L).

/* Q11 */
divise([],[],[]).
divise([X|Q],[X|Q1],Q2) :- divise(Q, Q2, Q1).

/* Q12 */
fusion(L, [], L).
fusion([], [T|Q], [T|Q]).
fusion([X|QX], [Y|QY], [X|Q]) :- X =< Y, fusion(QX, [Y|QY], Q).
fusion([X|QX], [Y|QY], [Y|Q]) :- fusion([X|QX], QY, Q).


/* Q13 */
tri_fusion([], []).
tri_fusion([X], [X]).
tri_fusion(X, L) :- divise(X, L1, L2), tri_fusion(L1, A), tri_fusion(L2, B), fusion(A, B, L).

/* Q14 */
/* balance(3, [1, 2, 3, 4, 5], L1, L2). */
balance(_, [],[],[]).

/* Q15 */

/* Ensembles */

/* Q16 */
estVide([]).

/* Q17 & Q18 */
/* ajoute_ensemble(2, [1, 2, 3], L). */
ajoute_ensemble(A, [], [A]).
ajoute_ensemble(A, [A|Q], [A|Q]).
ajoute_ensemble(A, [B|Q], L) :- ajoute_ensemble(A, Q, L1), L = [B|L1].


/* Q19 */

/* Q20 */

/* Q21 */

/* Q22 */

