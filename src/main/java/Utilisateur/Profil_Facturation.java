package Utilisateur;

import java.lang.String;
import javax.persistence.*;

import org.hibernate.annotations.GeneratorType;


@Entity
public class Profil_Facturation extends Client  {

	   
	
	@Transient
	private int id_Prof_Facturation;
	@Column(name="AdresseFacturation")
	private String AdresseFacturation;
	@Column(name="VilleFacturation")
	private String VilleFacturation;
	@Column(name="PaysFacturation")
	private String PaysFacturation;
	@Column(name="CodePostalFacturation")
	private int CodePostalFacturation;

	public Profil_Facturation() {
		super();
	}   
	public int getId_Prof_Facturation() {
		return this.id_Prof_Facturation;
	}

	public void setId_Prof_Facturation(int id_Prof_Facturation) {
		this.id_Prof_Facturation = id_Prof_Facturation;
	}   
	public String getAdresseFacturation() {
		return this.AdresseFacturation;
	}

	public void setAdresseFacturation(String AdresseFacturation) {
		this.AdresseFacturation = AdresseFacturation;
	}   
	public String getVilleFacturation() {
		return this.VilleFacturation;
	}

	public void setVilleFacturation(String VilleFacturation) {
		this.VilleFacturation = VilleFacturation;
	}   
	public String getPaysFacturation() {
		return this.PaysFacturation;
	}

	public void setPaysFacturation(String PaysFacturation) {
		this.PaysFacturation = PaysFacturation;
	}   
	public int getCodePostalFacturation() {
		return this.CodePostalFacturation;
	}

	public void setCodePostalFacturation(int CodePostalFacturation) {
		this.CodePostalFacturation = CodePostalFacturation;
	}
   
}
