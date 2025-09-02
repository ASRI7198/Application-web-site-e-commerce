package Paniers;

import javax.persistence.*;

@Entity

public class ResultatRecherche  {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_resultat;
	private int resultat;


	public ResultatRecherche() {
		super();
	}   
	public int getId_resultat() {
		return this.id_resultat;
	}

	public void setId_resultat(int id_resultat) {
		this.id_resultat = id_resultat;
	}   
	public int getResultat() {
		return this.resultat;
	}

	public void setResultat(int resultat) {
		this.resultat = resultat;
	}
	

	public int mettreDansPanier(int idProduit,Ligne_Panier LP,EntityManager em) {
		
		try {
		
		Produit P = em.find(Produit.class,idProduit);
		LP.setProduit(P);
		
		return 1 ;
		
		}catch(Exception e) {
			
			return 0 ;
		}
	}
   
}
