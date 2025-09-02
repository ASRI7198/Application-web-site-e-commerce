package Utilisateur;


import java.lang.String;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import Paniers.Panier;




@Entity 
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
public  class Utilisateur  {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Utilisateur;
	private String Nom;
	private String Prenom;
	private String Adresse;
	private int CodePostal;
	private String Ville;
	private String Pays;
	private String Tel;
	private String email;
	private String Login;
	@Column(name="Passeword")
	private String MotDepasse;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_Role")
	private Role role ;
	

	public Utilisateur() {
		super();
	} 
	@Column(nullable = false)
	public int getId_Utilisateur() {
		return this.id_Utilisateur;
	}

	public void setId_Utilisateur(int id_Utilisateur) {
		this.id_Utilisateur = id_Utilisateur;
	}   
	public String getNom() {
		return this.Nom;
	}

	public void setNom(String Nom) {
		this.Nom = Nom;
	}   
	public String getPrenom() {
		return this.Prenom;
	}

	public void setPrenom(String Prenom) {
		this.Prenom = Prenom;
	}   
	public String getAdresse() {
		return this.Adresse;
	}

	public void setAdresse(String Adresse) {
		this.Adresse = Adresse;
	}   
	public int getCodePostal() {
		return this.CodePostal;
	}

	public void setCodePostal(int CodePostal) {
		this.CodePostal = CodePostal;
	}   
	public String getVille() {
		return this.Ville;
	}

	public void setVille(String Ville) {
		this.Ville = Ville;
	}   
	public String getPays() {
		return this.Pays;
	}

	public void setPays(String Pays) {
		this.Pays = Pays;
	}   
	public String getTel() {
		return this.Tel;
	}

	public void setTel(String Tel) {
		this.Tel = Tel;
	}   
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}   
	public String getLogin() {
		return this.Login;
	}

	public void setLogin(String Login) {
		this.Login = Login;
	}   
	public String getMotDepasse() {
		return this.MotDepasse;
	}

	public void setMotDepasse(String MotDepasse) {
		this.MotDepasse = MotDepasse;
	}
	
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public String Ajouter(String Nom,String Prenom,String Adresse,int CodePostal,String Ville,String Pays,String Tel,String email,String Login,String MotDePasse,int idR,int ref,Panier panier,EntityManager em) {
		
		Client C = new Client();
		
		try {
		
		    C.setNom(Nom);
		    C.setPrenom(Prenom);
            C.setAdresse(Adresse);
            C.setCodePostal(CodePostal);
            C.setVille(Ville);
            C.setPays(Pays);
            C.setTel(Tel);
            C.setEmail(email);
            C.setLogin(Login);
            C.setMotDepasse(MotDePasse);
            Role R = em.find(Role.class,idR);
            C.setRole(R);
            C.setRefClient(ref);
            C.setPanier(panier);
            panier.setClient(C);
            em.persist(C);
            em.persist(panier);
            
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public String Modifier(String Nom,String Prenom,String Adresse,int CodePostal,String Ville,String Pays,String Tel,String email,String Login,String MotDePasse,int idR,int ref,int idUser,EntityManager em) {
		
		try {
			
			Client C = em.find(Client.class,idUser);
			
		    C.setNom(Nom);
		    C.setPrenom(Prenom);
            C.setAdresse(Adresse);
            C.setCodePostal(CodePostal);
            C.setVille(Ville);
            C.setPays(Pays);
            C.setTel(Tel);
            C.setEmail(email);
            C.setLogin(Login);
            C.setMotDepasse(MotDePasse);
            Role R = em.find(Role.class,idR);
            C.setRole(R);
            C.setRefClient(ref);
            em.persist(C);
            
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public String Supprimer(int idUser,EntityManager em) {
		
		
        try {
			
        	Client C = em.find(Client.class,idUser);
		    em.remove(C);
			
		}catch(Exception e) {
			return e.getMessage();
		}
		return "Message";
	}
	
	public List<Client> Consultation(EntityManager em){
		
		List<Client> LC = null ;
	
		try {
			
		 LC = em.createQuery("from Utilisateur u").getResultList();
		
		}catch(Exception e){
			List<Client> LCE = null ;
			return LCE ;
		}
		
		return LC ;
	}
     public Client Rechercher(int idUser,EntityManager em) {
    	 
    	Client C = null ;
 	
        try {
			
        	C = em.find(Client.class,idUser);
        	return C ;
			
		}catch(Exception e) {
			return C ;
		}
        
	}
	
	
   
}
