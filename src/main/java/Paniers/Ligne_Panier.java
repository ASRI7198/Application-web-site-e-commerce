package Paniers;

import javax.persistence.*;


@Entity

public class Ligne_Panier {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Lign_panier;
	private float Qte;
	private float PrixUnitaire;
	private float PrixTotal;
	@ManyToOne
	@JoinColumn(name="id_Produit")
	private Produit produit ;

	public Ligne_Panier() {
		super();
	}   
	public int getId_Lign_panier() {
		return this.id_Lign_panier;
	}

	public void setId_Lign_panier(int id_Lign_panier) {
		this.id_Lign_panier = id_Lign_panier;
	}   
	public float getQte() {
		return this.Qte;
	}

	public void setQte(float Qte) {
		this.Qte = Qte;
	}   
	public float getPrixUnitaire() {
		return this.PrixUnitaire;
	}

	public void setPrixUnitaire(float PrixUnitaire) {
		this.PrixUnitaire = PrixUnitaire;
	}   
	public float getPrixTotal() {
		return this.PrixTotal;
	}

	public void setPrixTotal(float PrixTotal) {
		this.PrixTotal = PrixTotal;
	}
	
	public int getIdProduit() {
		return this.produit.getId_produit();
	}

	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	
	public float Recalculer() {
		return this.PrixTotal ;
	}
	public void AjouterLigne() {
		
	}
   
}
