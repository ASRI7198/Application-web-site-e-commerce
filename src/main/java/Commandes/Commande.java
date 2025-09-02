package Commandes;

import java.lang.String;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import Paniers.Devis;
import Paniers.Panier;
import Paniers.Produit;
import Utilisateur.Client;
import Utilisateur.Droit;

@Entity

public class Commande {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_commande;
	private String DateCommande;
	private String DateLivraisonDemandée;
	
	
	private int id_facture ;
	private int id_livraison;
	private int id_Lignecommande ;
    private int id_devis ;
   	private int id_panier ;
   	private int id_client ;
	
	
	public Commande() {
		super();
	}   
	public int getId_commande() {
		return this.id_commande;
	}

	public void setId_commande(int id_commande) {
		this.id_commande = id_commande;
	}   
	public String getDateCommande() {
		return this.DateCommande;
	}

	public void setDateCommande(String DateCommande) {
		this.DateCommande = DateCommande;
	}   
	public String getDateLivraisonDemandée() {
		return this.DateLivraisonDemandée;
	}

	public void setDateLivraisonDemandée(String DateLivraisonDemandée) {
		this.DateLivraisonDemandée = DateLivraisonDemandée;
	}
	
	public int getFacture() {
		return this.id_facture;
	}

	public void setFacture(int facture) {
		this.id_facture = facture;
	}
	
	public int getLivraison() {
		return this.id_livraison;
	}

	public void setLivraison(int livraison) {
		this.id_livraison = livraison;
	}
	
	public int getLignecommande() {
		return this.id_Lignecommande;
	}

	public void setLignecommande(int lcom) {
		this.id_Lignecommande = lcom;
	}
	public int getDevis() {
		return this.id_devis;
	}

	public void setDevis(int devis) {
		this.id_devis = devis;
	}
	
	public int getPanier() {
		return this.id_panier;
	}

	public void setPanier(int panier) {
		this.id_panier =  panier;
	}
	public int getClient() {
		return this.id_client;
	}
	
	public void setClient(int client) {
		this.id_client = client;
	}
	

   
}
