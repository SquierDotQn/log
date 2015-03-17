package logicline.modeleSemantique;

import java.util.*;

public class Equivalence extends Formule {
	protected Formule a, b;
	public Equivalence(Formule a, Formule b) {
		this.a = a;
		this.b = b;
	}
	
	public String toString(){
		return "("+a.toString()+" ⇔ "+b.toString()+")";
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
		return new Equivalence(a.substitue(s), b.substitue(s));
	}

	//retourne l'évaluation de la formule
	public boolean valeur() throws VariableLibreException{
		return (a.valeur() == b.valeur());
	}

	//supprime toutes les implications de la formule
	protected Formule supprImplications() {
	       return  new Et(new Ou(new Non(a.supprImplications()), b.supprImplications()), new Ou(a.supprImplications(), new Non(b.supprImplications())));
	}

	//déplace les non à l'intérieur des formules
	protected Formule entrerNegations() {
		return new Equivalence(a.entrerNegations(), b.entrerNegations());
	}


}
