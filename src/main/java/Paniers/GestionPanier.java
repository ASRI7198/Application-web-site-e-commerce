package Paniers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import Commandes.Commande;
import Commandes.Depot;
import Commandes.Facture;
import Commandes.Ligne_Commande;
import Commandes.Livraison;

@Entity

public class GestionPanier {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Gestion_Panier;
	private int Qte;

	public GestionPanier() {
		super();
	}   
	public int getId_Gestion_Panier() {
		return this.id_Gestion_Panier;
	}

	public void setId_Gestion_Panier(int id_Gestion_Panier) {
		this.id_Gestion_Panier = id_Gestion_Panier;
	}   
	public int getQte() {
		return this.Qte;
	}

	public void setQte(int Qte) {
		this.Qte = Qte;
	}
	
	public float modifierQteLigne(Ligne_Panier lp) {
		
		lp.setQte(Qte);
		
		return lp.getQte() ;
	}
	
	public float Recalculer(Ligne_Panier P) {
		
		return P.getPrixUnitaire()*Qte ;
	}
	
	public void Supprimer(int idLignePanier,EntityManager em) {
		
		try {
		
		Ligne_Panier LP = em.find(Ligne_Panier.class,idLignePanier);
		em.remove(LP);
		
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
	}
	
	public void ViderPanier(int idPanier,EntityManager em) {
		
		try {
			
		List<Panier> LP = em.createQuery("from Panier P").getResultList();
		
		for(int i=0;i<LP.size();i++) {
		   if(i+1==idPanier) {
			Panier P = em.find(Panier.class,i+1);
		    P.setContenu(null);
		    P.setTotal(0);
		    P.setLsitLigneP(null);
			}
		}
		
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
	}
    
    public String DemanderDevis(int idDevis,EntityManager em) {
    	
    	try {
    	
    	Devis devis = em.find(Devis.class,em);
    	String c = devis.getContenu();
    	
    	return c;
    	
    	}catch(Exception e) {
    		
    		return e.getMessage();
    	}
    }
    
    public String Commander(String DateCommande, String DateLivraisonDemandée,Facture f,
    		Livraison l,Ligne_Commande L,Panier panier,Devis d,EntityManager em) {
    	
    	try {
    	
    	Set<Produit> pro = new HashSet<Produit>();
    	
        Commande commande = new Commande();
        
        commande.setDateCommande(DateCommande);
        commande.setDateLivraisonDemandée(DateLivraisonDemandée);
        commande.setFacture(f.getId_facture());
        commande.setLivraison(l.getId_livraison());
        commande.setLignecommande(L.getId_Ligne_Commande());
        
    
        
        commande.setPanier(panier.getId_Panier());
      
        em.persist(commande);
        
    	return commande.getDateCommande();
    	
    	}catch(Exception e) {
    		
          return e.getMessage();
    	}
    }
    
    public void Afficher() {
    	
    }
   
}
