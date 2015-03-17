package logicline.modeleSemantique;

import java.util.*;

public class Variable extends Formule {
	protected String str; 
	public Variable(String str) {
		this.str = str;
	}
	
	public String toString(){
		return str;
	}

	public Set<String> variablesLibres(){
		Set<String> tmp = new HashSet<String>();
		tmp.add(str);
		return tmp;
	}

	//effectue une substitution dans une formule
	public Formule substitue(Substitution s){
		if(s.get(str)!=null)
			return s.get(str);
		return this;
	}

	//retourne l'évaluation de la formule
	public boolean valeur() throws VariableLibreException{
		throw new VariableLibreException(str);
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
	
	public boolean valeur() throws VariableLibreException {
		throw new VariableLibreException(this.toString());

}
