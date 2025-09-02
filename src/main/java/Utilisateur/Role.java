package Utilisateur;

import java.lang.String;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity



public class Role  {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int ID_Role;
	@Column(name="Référence")
	private String Ref_Role;
	@Column(name="Nom")
	private String Nom_Role;
	@Column(name="Description")
	private String DescriptionRole;
	@ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinTable( name = "Role_Droit",joinColumns = @JoinColumn( name = "ID_Role" ),
    inverseJoinColumns = @JoinColumn( name = "id_Droit" ) )
   	private Set<Droit> droit = new HashSet<Droit>();

	public Role() {
		super();
	}   
	public int getID_Role() {
		return this.ID_Role;
	}   
	public String getRef_Role() {
		return this.Ref_Role;
	}

	public void setRef_Role(String Ref_Role) {
		this.Ref_Role = Ref_Role;
	}   
	public String getNom_Role() {
		return this.Nom_Role;
	}

	public void setNom_Role(String Nom_Role) {
		this.Nom_Role = Nom_Role;
	}   
	public String getDescriptionRole() {
		return this.DescriptionRole;
	}

	public void setDescriptionRole(String DescriptionRole) {
		this.DescriptionRole = DescriptionRole;
	}
	
	public void setListDroit(Set<Droit> d) {
		this.droit = d;
	}
	
	public Set<Droit> getdroit() {
	    return droit;
	}
	
	public String Ajouter(String Ref,String Nom,String Des,Set<Droit> D,EntityManager em) {
		
		try {
			
			Role R = new Role();
		    R.setRef_Role(Ref);
		    R.setNom_Role(Nom);
		    R.setDescriptionRole(Des);
		    R.setListDroit(D);
			
			em.persist(R);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public String Modifier(int id,String Ref,String Nom,String Des,Set<Droit> D,EntityManager em) {
		
        try {
			
		    Role R = em.find(Role.class,id);
		    
		    R.setNom_Role(Nom);
		    R.setRef_Role(Ref);
		    R.setDescriptionRole(Des);
		    R.setListDroit(D);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
		
	}
	
	public String Supprimer(int id,EntityManager em) {
		
        try {
			
		    Role R = em.find(Role.class,id);
		    em.remove(R);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
		
	}
   
}


