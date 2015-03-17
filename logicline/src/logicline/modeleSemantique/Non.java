package logicline.modeleSemantique;

import java.util.*;

public class Non extends Formule {
	protected Formule a;
	public Non(Formule a) {
		this.a = a;
	}
	
	public String toString(){
		return "¬"+a.toString();
	}

	@Override
	public boolean contientEt(){
		return false||a.contientEt();
	}


	public Set<String> variablesLibres(){
		return a.variablesLibres();
	}

	//effectue une substitution dans une formule
	public Formule substitue(Substitution s){
		return new Non(a.substitue(s));
	}

	//retourne l'évaluation de la formule
	public boolean valeur() throws VariableLibreException{
		return !a.valeur();
	}

	//supprime toutes les implications de la formule
	protected Formule supprImplications() {
	       return new Non(a.supprImplications());
	}
	
	//Retourne la formule représentant la négation de this
	protected Formule negation() {
		return a;
	}

	//déplace les non à l'intérieur des formules
	protected Formule entrerNegations() {
		return a.entrerNegations();
	}

	//retourne la liste des clauses d'une formule en FNC
	public List<Clause> clauses() throws NotFNCException, TrueClauseException {
		throw new NotFNCException(this);
	}

}
