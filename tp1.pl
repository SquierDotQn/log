/* Théo Plockyn */

/* q1 */
contenu(tigre).
contenu(princesse).

/* q2 */
pancarte1(tigre,_).
pancarte1(_,princesse).
pancarte2(princesse,_).

/* q3 */
/* Soit les deux pancartes disent la vérité */
salle1(G,D) :-
	pancarte1(G,D),
	pancarte2(G,D),
	contenu(G),
	contenu(D).
/* Soit elles mentent */
salle1(G,D) :-
	not(pancarte1(G,D)),
	not(pancarte2(G,D)),
	contenu(G),
	contenu(D).

/* q4 Les deux portes mènent au même endroit, où est la princesse
	?- salle(G,D)
	G = D
	D = princesse
 */

pancarte3(princesse,tigre).
pancarte4(princesse,tigre).
pancarte4(tigre, princesse).
/* q7 */
/* pancarte de gauche dit la vérité, de droite ment */
salle2(G,D) :-
	contenu(G),
	contenu(D),
	pancarte3(G,D),
	not(pancarte4(G,D)). 
/* pancarte de droite dit la vérité, de gauche ment */
salle2(G,D) :-
	contenu(G),
	contenu(D),
	not(pancarte3(G,D)),
	pancarte4(G,D).

/* q8 On obtient que le tigre est dans la porte de gauche, et la princesse est dans la porte de droite.
	La solution est donc la porte de droite.*/


/* q10 la pancarte de droite */

/* q11 */
affiche_s2(_) :-
	salle2(G,D),
	write('Il y a un(e) '),
	write(G),
	write(' a gauche, et un(e) '),
	write(D),
	write(' a droite.').
	
/* q12 */
contenu3(tigre).
contenu3(princesse).
contenu3(vide).

pancarte5(_,_,vide).
pancarte6(tigre,_,_).
pancarte7(_,_,vide).

/* les mensonges et les vérités des pancartes, en fonction du contenu */
vrai(princesse).
vrai(vide).
faux(tigre).
faux(vide).

/* Soit il y a la princesse ou rien et c'est vrai */
porte1(G,M,D) :-
		vrai(G), pancarte5(G,M,D).
/* soit il y a le tigre ou rien et c'est faux */
porte1(G,M,D) :-
		faux(G), not(pancarte5(G,M,D)).
		
/* idem */
porte2(G,M,D) :-
		vrai(M), pancarte6(G,M,D).
porte2(G,M,D) :-
		faux(M), not(pancarte6(G,M,D)).
		
/* idem */
porte3(G,M,D) :-
		vrai(D), pancarte7(G,M,D).
porte3(G,M,D) :-
		faux(D), not(pancarte7(G,M,D)).

/* Il y a forcément un tigre, une princesse et une salle vide */
contraintes(G,M,D) :-
		contenu3(G), contenu3(M), contenu3(D),
		G \== M, M \== D, G \== D.

/* q13 */
salle3(G,M,D) :-
		contraintes(G,M,D), porte1(G,M,D), porte2(G,M,D), porte3(G,M,D).

/* q14 
?- salle3(G,M,D).
G = princesse,
M = tigre,
D = vide.

La solution est donc la porte de gauche. */

