package Commandes;


import java.lang.String;
import java.sql.Date;

import javax.persistence.*;

import Utilisateur.Client;


@Entity

public class Livraison {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_livraison;
	private String DateLivraison;
	private String Etatlivraison;

	public Livraison() {
		super();
	}   
	public int getId_livraison() {
		return this.id_livraison;
	}

	public void setId_livraison(int id_livraison) {
		this.id_livraison = id_livraison;
	}   
	public String getDateLivraison() {
		return this.DateLivraison;
	}

	public void setDateLivraison(String l) {
		this.DateLivraison = l;
	}   
	public String getEtatlivraison() {
		return this.Etatlivraison;
	}

	public void setEtatlivraison(String Etatlivraison) {
		this.Etatlivraison = Etatlivraison;
	}
}
