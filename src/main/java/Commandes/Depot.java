package Commandes;

import java.lang.String;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import Paniers.Produit;

@Entity

public class Depot {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Depot;
	private String AdresseDepot;
	

	/*@OneToOne
	private Produit produit ;*/
	


	public Depot() {
		super();
	}   
	public int getId_Depot() {
		return this.id_Depot;
	}

	public void setId_Depot(int id_Depot) {
		this.id_Depot = id_Depot;
	}   
	public String getAdresseDepot() {
		return this.AdresseDepot;
	}

	public void setAdresseDepot(String AdresseDepot) {
		this.AdresseDepot = AdresseDepot;
	}
	
	/*public Produit getProduit() {
		return this.produit;
	}

	public void setProduit(Produit produit) {
		this.produit = produit;
	}*/
   
}
