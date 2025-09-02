package Utilisateur;

import java.lang.String;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity

// la table Droit doit être remplir avent table Utilisateur et apres table Role 

public class Droit {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id_Droit;
	@Column(name="Nom")
	private String Nom_Droit;
	@Column(name="Description")
	private String DescriptionDroit;
	@ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinTable( name = "Role_Droit",joinColumns = @JoinColumn( name = "ID_Droit" ),
    inverseJoinColumns = @JoinColumn( name = "id_Role" ) )
	private Set<Role> Role = new HashSet<Role>();
	


	
	

	public Droit() {
		super();
	}   
	public int getId_Droit() {
		return this.id_Droit;
	}   
	public String getNom_Droit() {
		return this.Nom_Droit;
	}

	public void setNom_Droit(String Nom_Droit) {
		this.Nom_Droit = Nom_Droit;
	}   
	public String getDescriptionDroit() {
		return this.DescriptionDroit;
	}

	public void setDescriptionDroit(String DescriptionDroit) {
		this.DescriptionDroit = DescriptionDroit;
	}
	
	public void setListRole(Set<Role> R) {
		this.Role = R;
	}
	
	public Set<Role> getRole() {
	    return Role;
	}

	public String Ajouter(String Nom,String Des,Set<Role> R,EntityManager em) {
		
		try {
			
			Droit D = new Droit();
			D.setNom_Droit(Nom);
			D.setDescriptionDroit(Des);
			D.setListRole(R);
			em.persist(D);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public String Modifier(int idDroit,String Nom,String Des,Set<Role> R,EntityManager em) {
		
        try {
			
		    Droit D = em.find(Droit.class,idDroit);
		    D.setNom_Droit(Nom);
		    D.setDescriptionDroit(Des);
		    D.setListRole(R);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
		
	}
	
	public String Supprimer(int idDroit,EntityManager em) {
		
        try {
			
		    Droit D = em.find(Droit.class,idDroit);
		    em.remove(D);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
		
	}
   
}
