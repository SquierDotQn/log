package logicline.modeleSemantique;

import java.util.*;

public class Ou extends Formule {
	protected Formule a, b;
	public Ou(Formule a, Formule b) {
		this.a = a;
		this.b = b;
	}
	
	public String toString(){
		return "("+a.toString()+" ∨ "+b.toString()+")";
	}

	@Override
	public boolean contientEt(){
		return false||a.contientEt()||b.contientEt();
	}

	public Set<String> variablesLibres(){
		Set<String> tmp = new HashSet<String>();
		tmp.addAll(a.variablesLibres());
		tmp.addAll(b.variablesLibres());
		return tmp;
	}

	//effectue une substitution dans une formule
	public Formule substitue(Substitution s){
		return new Ou(a.substitue(s), b.substitue(s));
	}

	//retourne l'évaluation de la formule
	public boolean valeur() throws VariableLibreException{
		return a.valeur() || b.valeur();
	}

	//supprime toutes les implications de la formule
	protected Formule supprImplications() {
	       return new Ou(a.supprImplications(), b.supprImplications());
	}

	//Retourne la formule représentant la négation de this
	protected Formule negation() {
		return new Et(new Non(a), new Non(b));
	}

	//déplace les non à l'intérieur des formules
	protected Formule entrerNegations() {
		return new Ou(a.entrerNegations(), b.entrerNegations());
	}

	//Retourne une formule équivalente à OU(this, d)
	protected Formule ougauche(Formule d) {
		return a.ougauche(b.ougauche(d));
	}

	//Retourne une formule équivalente à OU(g, this), g ne contenant pas de ET
	protected Formule oudroite(Formule g) {
		return b.oudroite(a.oudroite(g));
	}

	//déplace les non à l'intérieur des formules
	protected Formule entrerDisjonctions() {
		if(a.contientEt()){
			return a.oudroite(b.entrerDisjonctions());
		}else if(b.contientEt()){
			return b.entrerDisjonctions().ougauche(a);
		}else{
			return this;
		}
	}

	//retourne la liste des clauses d'une formule en FNC
	public List<Clause> clauses() throws NotFNCException, TrueClauseException {
		throw new NotFNCException(this);
	}


}
