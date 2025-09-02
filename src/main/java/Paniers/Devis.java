package Paniers;

import javax.persistence.*;

import Commandes.Commande;


@Entity

public class Devis{

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_devis;
	private String Contenu;

	public Devis() {
		super();
	}   
	public int getId_devis() {
		return this.id_devis;
	}
   
	public String getContenu() {
		return this.Contenu;
	}

	public void setContenu(String Contenu) {
		this.Contenu = Contenu;
	}

}
