package logicline.modeleSemantique;

import java.util.*;

public class Et extends Formule {
	protected Formule a, b;
	public Et(Formule a, Formule b) {
		this.a = a;
		this.b = b;
	}
	
	public String toString(){
		return "("+a.toString()+" ∧ "+b.toString()+")";
	}

	@Override
	public boolean contientEt(){
		return true;
	}

	public Set<String> variablesLibres(){
		Set<String> tmp = new HashSet<String>();
		tmp.addAll(a.variablesLibres());
		tmp.addAll(b.variablesLibres());
		return tmp;
	}

	//effectue une substitution dans une formule
	public Formule substitue(Substitution s){
		return new Et(a.substitue(s), b.substitue(s));
	}

	//retourne l'évaluation de la formule
	public boolean valeur() throws VariableLibreException{
		return a.valeur() && b.valeur();
	}

	//supprime toutes les implications de la formule
	protected Formule supprImplications() {
	       return new Et(a.supprImplications(), b.supprImplications());
	}

	protected Formule negation() {
		return new Ou(new Non(a), new Non(b));
	}

	//déplace les non à l'intérieur des formules
	protected Formule entrerNegations() {
		return new Et(a.entrerNegations(), b.entrerNegations());
	}

	//Retourne une formule équivalente à OU(this, d)
	protected Formule ougauche(Formule d) {
		return new Et(a.ougauche(d), b.ougauche(d));
	}

	//Retourne une formule équivalente à OU(g, this), g ne contenant pas de ET
	protected Formule oudroite(Formule g) {
		if(g.contientEt()){
			System.err.println("Contient un Et");
		}
		return new Et(a.oudroite(g), b.oudroite(g));
	}

	//retourne la liste des clauses d'une formule en FNC
	public List<Clause> clauses() throws NotFNCException, TrueClauseException {
		throw new NotFNCException(this);
	}

}
