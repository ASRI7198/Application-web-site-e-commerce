package DAO;

import java.io.IOException;

import javax.management.relation.Role;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Paniers.Panier;
import Paniers.Produit;
import Utilisateur.Utilisateur;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adresse = request.getParameter("adresse");
		int codepostal = Integer.parseInt(request.getParameter("codepostal")) ;
		String ville = request.getParameter("ville");
		String pays =request.getParameter("pays");
		String email = request.getParameter("email");
		String tel = request.getParameter("tele");
		String login = request.getParameter("login");
		String password = request.getParameter("pass");
		int ref = Integer.parseInt(request.getParameter("ref"));
		
		if(codepostal<=0)
			 response.sendRedirect("Inscription.jsp");
		else {
		    	 
		    	 
		    		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
		    		EntityManager em = emf.createEntityManager();
		    		em.getTransaction().begin();
	
		    		Panier panier = new Panier();
		    		panier.setContenu("Contenu "+nom+" "+prenom);
		    		Utilisateur user = new Utilisateur();
		    		user.Ajouter(nom,prenom,adresse,codepostal,ville,pays,tel,email,login,password,1,ref,panier,em);
		    		em.persist(panier);
		    		em.getTransaction().commit();
		    		
		    		response.sendRedirect("Login.jsp");
		     }
		   
	}

}
