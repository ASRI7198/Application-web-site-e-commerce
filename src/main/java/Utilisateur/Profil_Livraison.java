package Utilisateur;

import java.lang.String;
import javax.persistence.*;

@Entity
public class Profil_Livraison extends Client {

	   

    @Transient
	private int id_Prof_Liv;
	@Column(name="AdresseLivraison")
	private String AdresseLivraison;
	@Column(name="VilleLivraison")
	private String VilleLivraison;
	@Column(name="PaysLivraison")
	private String PaysLivraison;
	@Column(name="CodePostalLivraison")
	private int CodePostalLivraison;

	public Profil_Livraison() {
		super();
	}   
	public int getId_Prof_Liv() {
		return this.id_Prof_Liv;
	}

	public void setId_Prof_Liv(int id_Prof_Liv) {
		this.id_Prof_Liv = id_Prof_Liv;
	}   
	public String getAdresseLivraison() {
		return this.AdresseLivraison;
	}

	public void setAdresseLivraison(String AdresseLivraison) {
		this.AdresseLivraison = AdresseLivraison;
	}   
	public String getVilleLivraison() {
		return this.VilleLivraison;
	}

	public void setVilleLivraison(String VilleLivraison) {
		this.VilleLivraison = VilleLivraison;
	}   
	public String getPaysLivraison() {
		return this.PaysLivraison;
	}

	public void setPaysLivraison(String PaysLivraison) {
		this.PaysLivraison = PaysLivraison;
	}   
	public int getCodePostalLivraison() {
		return this.CodePostalLivraison;
	}

	public void setCodePostalLivraison(int CodePostalLivraison) {
		this.CodePostalLivraison = CodePostalLivraison;
	}
   
}
