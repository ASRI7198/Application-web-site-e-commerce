package Commandes;

import java.lang.String;
import java.util.Set;

import javax.persistence.*;

import Paniers.Produit;
import Utilisateur.Droit;
import Utilisateur.Role;


@Entity

public class Promotion {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Promotion;
	private float PrixPromotion;
	private String PeriodePromotion;
    @ManyToOne( cascade = CascadeType.ALL )
    @JoinColumn( name="id_Produit" )
    private Produit produit ;


	public Promotion() {
		super();
	}   
	public int getId_Promotion() {
		return this.id_Promotion;
	}

	public void setId_Promotion(int id_Promotion) {
		this.id_Promotion = id_Promotion;
	}   
	public float getPrixPromotion() {
		return this.PrixPromotion;
	}

	public void setPrixPromotion(float PrixPromotion) {
		this.PrixPromotion = PrixPromotion;
	}   
	public String getPeriodePromotion() {
		return this.PeriodePromotion;
	}

	public void setPeriodePromotion(String PeriodePromotion) {
		this.PeriodePromotion = PeriodePromotion;
	}
	
	public String Ajouter(float PrixPromotion,String PeriodePromotion,EntityManager em) {
		try {
			
			Promotion promotion = new Promotion();
			promotion.setPrixPromotion(PrixPromotion);
			promotion.setPeriodePromotion(PeriodePromotion);
		    em.persist(promotion);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public String Supprimer(int idPromotion,EntityManager em) {
		
		try {
			
			Promotion promotion = em.find(Promotion.class,idPromotion);
			em.remove(promotion);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message ";
	}
	
	public String Modifier(int idPromotion,float PrixPromotion,String PeriodePromotion,EntityManager em) {
		
        try {
			
		    Promotion promotion = em.find(Promotion.class,idPromotion);
		    
		    promotion.setPeriodePromotion(PeriodePromotion);
		    promotion.setPrixPromotion(PrixPromotion);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
		
	}
   
}
