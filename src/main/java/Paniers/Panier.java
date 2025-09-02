package Paniers;

import java.lang.String;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

import Commandes.Commande;
import Utilisateur.Client;


@Entity

public class Panier {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idPanier;
	private float Total;
	private String Contenu;
    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true)
    private List<Ligne_Panier> LP = new ArrayList<>();
   
    @OneToOne    
    private Client client ;
    
    
	public Panier() {
		super();
	}    
	public int getId_Panier() {
		return this.idPanier;
	}

	public void setId_Panier(int id_Panier) {
		this.idPanier = id_Panier;
	}
	public float getTotal() {
		return this.Total;
	}

	public void setTotal(float Total) {
		this.Total = Total;
	}  
	public String getContenu() {
		return this.Contenu;
	}

	public void setContenu(String Contenu) {
		this.Contenu = Contenu;
	}
	
	public List<Ligne_Panier> getListLigneP(){
		return this.LP ;
	}
	
	
	public void setLsitLigneP(List<Ligne_Panier> LP) {
		this.LP=LP;
	}
	public Client getClient() {
		return this.client;
	}
	public void setClient(Client C) {
		this.client=C ;
	}
	
	public float Recalculer() {
		
		Total=0;
		for(Ligne_Panier i : LP) {
			Total+=i.Recalculer();
		}
		return Total ;
	}
	
	public void AjouterLigne(float QteL,float PrixU,float PrixT,Produit produit,EntityManager em) {
		
		Ligne_Panier LP = new Ligne_Panier();
		LP.setQte(QteL);
		LP.setPrixUnitaire(PrixU);
		LP.setPrixTotal(PrixT);
		LP.setProduit(produit);
		getListLigneP().add(LP);
	
	}
	
	public void Supprimer(int index,EntityManager em) {
		
	 Ligne_Panier LP = em.find(Ligne_Panier.class,index);
	 em.remove(LP);
	  
	}
	
	public void ViderPanier(EntityManager em) {
		
		List<Panier> LP = em.createQuery("from Panier P").getResultList();
		
		for(int i=0;i<LP.size();i++) {
			if(i+1==this.idPanier) {
			Panier P = em.find(Panier.class,i+1);
		    P.setContenu(null);
		    P.setTotal(0);
		    P.setLsitLigneP(null);
		    P.setClient(null);
		    P.setLsitLigneP(null);
		    em.persist(P);
			}
			
		}
	}
   
}
