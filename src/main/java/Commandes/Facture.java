package Commandes;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import Utilisateur.Client;

@Entity

public class Facture  {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_facture;
	private String NumeroFacture;
	private String DateFacture;
	private float Montant;
	@OneToMany
	@JoinColumn(name="id_Facture")
	private Set<Paiement> paiement = new HashSet<Paiement>();

 
	public Facture() {
		super();
	}   
	public int getId_facture() {
		return this.id_facture;
	}

	public void setId_facture(int id_facture) {
		this.id_facture = id_facture;
	}   
	public String getNumeroFacture() {
		return this.NumeroFacture;
	}

	public void setNumeroFacture(String ab) {
		this.NumeroFacture = ab;
	}   
	public String getDateFacture() {
		return this.DateFacture;
	}

	public void setDateFacture(String DateFacture) {
		this.DateFacture = DateFacture;
	}   
	public float getMontant() {
		return this.Montant;
	}

	public void setMontant(float Montant) {
		this.Montant = Montant;
	}
	
	public Set<Paiement> getPaiement() {
		return this.paiement;
	}

	public void setPaiement(Set<Paiement> paiement) {
		this.paiement = paiement;
	}
	
   
}
