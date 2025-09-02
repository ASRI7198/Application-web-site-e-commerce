package Commandes;


import javax.persistence.*;

@Entity

public class Ligne_Commande {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Ligne_Commande;
	private float Qtecommandée;


	public Ligne_Commande() {
		super();
	}   
	public int getId_Ligne_Commande() {
		return this.id_Ligne_Commande;
	}

	public void setId_Ligne_Commande(int id_Ligne_Commande) {
		this.id_Ligne_Commande = id_Ligne_Commande;
	}   
	public float getQtecommandée() {
		return this.Qtecommandée;
	}

	public void setQtecommandée(float Qtecommandée) {
		this.Qtecommandée = Qtecommandée;
	}


   
}
