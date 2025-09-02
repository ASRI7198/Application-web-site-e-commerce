package Utilisateur;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
import Commandes.Commande;
import Paniers.Panier;


@Entity
public  class Client extends Utilisateur {

	@Column(name="Références")
	private int RefClient;
	

    @OneToOne(mappedBy = "client")
    private Panier panier ;

	public Client() {
		super();
	}    
	public int getRefClient() {
		return this.RefClient;
	}

	public void setRefClient(int RefClient) {
		this.RefClient = RefClient;
	}
	public Panier getPanier() {
		return this.panier;
	}
	@Column(nullable = false)
	public void setPanier(Panier p) {
		this.panier = p ;
	}
   
}
