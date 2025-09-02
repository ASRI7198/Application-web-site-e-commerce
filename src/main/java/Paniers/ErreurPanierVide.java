package Paniers;

import java.lang.String;
import javax.persistence.*;


@Entity

public class ErreurPanierVide {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_erreur_msg;
	private String ErreurMessage;


	public ErreurPanierVide() {
		super();
	}   
	public int getId_erreur_msg() {
		return this.id_erreur_msg;
	}

	public void setId_erreur_msg(int id_erreur_msg) {
		this.id_erreur_msg = id_erreur_msg;
	}   
	public String getErreurMessage() {
		return this.ErreurMessage;
	}

	public void setErreurMessage(String ErreurMessage) {
		this.ErreurMessage = ErreurMessage;
	}
   
}
