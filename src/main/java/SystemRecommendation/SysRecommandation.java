package SystemRecommendation  ;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;

import Paniers.Ligne_Panier;
import Paniers.Panier;
import Paniers.Produit;
import Utilisateur.Client;

public class SysRecommandation {
	
	
	public List<Produit> Recommandation_Contenu(int iduser,EntityManager em) {
		
		 
		 Client C = em.find(Client.class,iduser);
         Panier panier = C.getPanier();
		 List<Ligne_Panier> LP = new ArrayList<Ligne_Panier>(panier.getListLigneP());
		 List<Produit> PBD = em.createQuery("from Produit p").getResultList();
		 List<Produit> P = new ArrayList<Produit>();
		 List<Produit> PP = new ArrayList<Produit>();
		 Produit produit ;
		 int idP ;
		 for(int i=0;i<PBD.size();i++) {
			 for(int j=0;j<LP.size();j++) {
				 idP = LP.get(j).getIdProduit();
				 produit = em.find(Produit.class,idP);
				     if(PBD.get(i).getTypeProduit().equals(produit.getTypeProduit()))
				   		   P.add(PBD.get(i));
				     if(PBD.get(i).getNomProduit().equals(produit.getNomProduit()))
			    	       PP.add(produit);
			 }
		 }
		 List<Produit> PF = P.stream().distinct().collect(Collectors.toList());
		 for(int i=0;i<PP.size();i++) {
			 for(int j=0;j<PF.size();j++) {
				 PF.remove(PP.get(i));
			 }
		 }
		 return PF ;
	}
	
	public List<Produit> Recommandation_Prudact(int idProduit,EntityManager em) {
		
		Produit P = em.find(Produit.class,idProduit);
		List<Produit> PBD = em.createQuery("from Produit p").getResultList();
		List<Produit> PL = new ArrayList<Produit>();
		for(int i=0;i<PBD.size();i++) {
		   if(PBD.get(i).getTypeProduit().equals(P.getTypeProduit()) && !PBD.get(i).getNomProduit().equals(P.getNomProduit()))
		   		   PL.add(PBD.get(i));
		}
		return PL ;
	}
	public void Recommandation_FiltrageCollaboratif() {
		
	}
	
	public void Recommandation_hybride() {
		
	}

}
