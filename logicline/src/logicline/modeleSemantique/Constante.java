package logicline.modeleSemantique;

import java.util.*;

public class Constante extends Formule {
	protected boolean valeur;
	public Constante(boolean valeur) {
		this.valeur = valeur;
	}
	
	public String toString(){
		return valeur==true?"⊤":"⊥";
	}

	public Set<String> variablesLibres(){
		return new HashSet<String>();
	}

	//effectue une substitution dans une formule
	public Formule substitue(Substitution s){
		return this;
	}

	//retourne l'évaluation de la formule
	public boolean valeur() throws VariableLibreException{
		return this.valeur;
	}
	//supprime toutes les implications de la formule
	protected Formule supprImplications() {
	       return this;
	}

	//déplace les non à l'intérieur des formules
	protected Formule entrerNegations() {
		return this;
	}

	//retourne la liste des clauses d'une formule en FNC
	public List<Clause> clauses() throws NotFNCException, TrueClauseException {
		throw new NotFNCException(this);
	}

}
