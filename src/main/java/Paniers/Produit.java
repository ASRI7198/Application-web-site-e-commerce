package Paniers;

import java.lang.String;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import Commandes.Commande;
import Commandes.Depot;
import Commandes.Promotion;


@Entity

public class Produit  {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_produit;
	private String RefProduit;
	private String NomProduit;
	private String TypeProduit;
	private String EtatProduit;
	private String DesignationProduit;
	private float PrixProduit;
	private float PoidProduit;
	private String CouleurProduit;
	private String imageProduit;
	private String Marque ;
	private String Description ;
	private int star ;
	
	

	/*@OneToOne(mappedBy = "produit")
	private Depot depot ;*/

	

	public Produit() {
		super();
	}   

	
	/*public Depot getDepot(){
		return this.depot ;
	}
	
	public void setDepot(Depot depot) {
		this.depot = depot ;
	}*/
	
	public int getId_produit() {
		return this.id_produit;
	}

	public void setId_produit(int id_produit) {
		this.id_produit = id_produit;
	} 
	public String getMarque() {
		return this.Marque;
	}

	public void setMarque(String Marque) {
		this.Marque = Marque;
	}
	public String getDescription() {
		return this.Description;
	}

	public void setDescription(String Description) {
		this.Description = Description;
	}
	public String getRefProduit() {
		return this.RefProduit;
	}

	public void setRefProduit(String RefProduit) {
		this.RefProduit = RefProduit;
	}   
	public String getNomProduit() {
		return this.NomProduit;
	}

	public void setNomProduit(String NomProduit) {
		this.NomProduit = NomProduit;
	}   
	public String getTypeProduit() {
		return this.TypeProduit;
	}

	public void setTypeProduit(String TypeProduit) {
		this.TypeProduit = TypeProduit;
	}   
	public String getEtatProduit() {
		return this.EtatProduit;
	}

	public void setEtatProduit(String EtatProduit) {
		this.EtatProduit = EtatProduit;
	}   
	public String getDesignationProduit() {
		return this.DesignationProduit;
	}

	public void setDesignationProduit(String DesignationProduit) {
		this.DesignationProduit = DesignationProduit;
	}   
	public float getPrixProduit() {
		return this.PrixProduit;
	}

	public void setPrixProduit(float PrixProduit) {
		this.PrixProduit = PrixProduit;
	}   
	public float getPoidProduit() {
		return this.PoidProduit;
	}

	public void setPoidProduit(float PoidProduit) {
		this.PoidProduit = PoidProduit;
	}   
	public String getCouleurProduit() {
		return this.CouleurProduit;
	}

	public void setCouleurProduit(String CouleurProduit) {
		this.CouleurProduit = CouleurProduit;
	}   
	public String getImageProduit() {
		return this.imageProduit;
	}

	public void setImageProduit(String imageProduit) {
		this.imageProduit = imageProduit;
	}
	
	public int getstar() {
		return this.star;
	}
	
	public void setstar(int star) {
		this.star=star ;
	}
	
	public String Ajouter(String RefProduit,String NomProduit,String TypeProduit,String EtatProduit,
			String DesignationProduit,float PrixProduit,float PoidProduit,String CouleurProduit,
			String imageProduit,String Description,String Marque,int star,EntityManager em) {
		
		try {
			
			
			Produit produit = new Produit();
			
			produit.setRefProduit(RefProduit);
			produit.setNomProduit(NomProduit);
			produit.setTypeProduit(TypeProduit);
			produit.setEtatProduit(EtatProduit);
			produit.setDesignationProduit(DesignationProduit);
			produit.setPrixProduit(PrixProduit);
			produit.setPoidProduit(PoidProduit);
			produit.setCouleurProduit(CouleurProduit);
			produit.setCouleurProduit(CouleurProduit);
			produit.setImageProduit(imageProduit);
			produit.setMarque(Marque);
			produit.setDescription(Description);
			produit.setstar(star);
		
		    em.persist(produit);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public String Supprimer(int idProduit,EntityManager em) {
		
		try {
			
			Produit produit = em.find(Produit.class,idProduit);
			em.remove(produit);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message ";
	}
	
	public String Modifier(int idProduit,String RefProduit,String NomProduit,String TypeProduit,String EtatProduit,
			String DesignationProduit,float PrixProduit,float PoidProduit,String CouleurProduit,
			String imageProduit,String Description,String Marque,int star,EntityManager em) {
		
		try {
			
			Produit produit = em.find(Produit.class,idProduit);
			
			produit.setRefProduit(RefProduit);
			produit.setNomProduit(NomProduit);
			produit.setTypeProduit(TypeProduit);
			produit.setEtatProduit(EtatProduit);
			produit.setDesignationProduit(DesignationProduit);
			produit.setPrixProduit(PrixProduit);
			produit.setPoidProduit(PoidProduit);
			produit.setCouleurProduit(CouleurProduit);
			produit.setCouleurProduit(CouleurProduit);
			produit.setImageProduit(imageProduit);
			produit.setMarque(Marque);
			produit.setDescription(Description);
			produit.setstar(star);
			
			em.persist(produit);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message ";
	}
   
	public Produit Rechercher(int idProduit,EntityManager em) {
		
		try {
			
		   Produit produit = em.find(Produit.class,idProduit);
		   return produit;
		   
		}catch(Exception e) {
			Produit produit1 = null;
			return produit1;
		}
	}
}
