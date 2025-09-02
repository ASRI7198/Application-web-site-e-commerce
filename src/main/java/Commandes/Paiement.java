package Commandes;


import java.lang.String;
import javax.persistence.*;


@Entity

public class Paiement {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_paiement;
	private String Nom_du_carte ;
	private String Numéro ; 
	private int CVC ;
	private String Carte_Exp_Date ;
	private String Type_paiement;
	private String descriptionPaiement;

	public Paiement() {
		super();
	}   
	public int getId_paiement() {
		return this.id_paiement;
	}

	public void setId_paiement(int id_paiement) {
		this.id_paiement = id_paiement;
	}  
	public String getNom_du_carte() {
		return this.Nom_du_carte;
	}

	public void setNom_du_carte(String Nom) {
		this.Nom_du_carte = Nom ;
	} 
	public String getNuméro() {
		return this.Numéro;
	}

	public void setNuméro(String numero) {
		this.Numéro = numero;
	} 
	public int getCVC() {
		return this.CVC;
	}

	public void setCVC(int numero) {
		this.CVC = numero;
	}
	public String getCarte_Exp_Date() {
		return this.Carte_Exp_Date;
	}

	public void setCarte_Exp_Date(String Carte_Exp_Date) {
		this.Carte_Exp_Date = Carte_Exp_Date ;
	}
	public String getType_paiement() {
		return this.Type_paiement;
	}

	public void setType_paiement(String Type_paiement) {
		this.Type_paiement = Type_paiement;
	}   
	public String getDescriptionPaiement() {
		return this.descriptionPaiement;
	}

	public void setDescriptionPaiement(String descriptionPaiement) {
		this.descriptionPaiement = descriptionPaiement;
	}
   
}
