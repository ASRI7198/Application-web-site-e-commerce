package DAO;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Paniers.Ligne_Panier;
import Paniers.Panier;
import Utilisateur.Client;
import Utilisateur.Role;
import Utilisateur.Utilisateur;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String login = request.getParameter("login"); 
		String pass = request.getParameter("pass");
		HttpSession session1 = request.getSession();
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		List<Utilisateur> U = em.createQuery("from Utilisateur u").getResultList();
		
		
		
		
		
	    boolean state1 = false ;
	    Role role = null ;
	    
		for(int i=0;i<U.size();i++){
		  if(U.get(i).getLogin().equals(login) && U.get(i).getMotDepasse().equals(pass)) {
		      state1 = true ;
		      session1.setAttribute("nom",U.get(i).getNom());
		      session1.setAttribute("iduser",U.get(i).getId_Utilisateur());
		      
		      Client C = em.find(Client.class,U.get(i).getId_Utilisateur());
              Panier panier = C.getPanier();
              List<Ligne_Panier> LP = new ArrayList<Ligne_Panier>(panier.getListLigneP());
              int size = LP.size();
              File file = new File("C://Users//user//Desktop//PFE//Project//src//main//webapp//state.txt");
      	  	  FileWriter fw = new FileWriter(file) ;
      		  PrintWriter R = new PrintWriter(fw);
                if(size==0) {
            		R.print(false);
            		R.close();
                }else {
                	R.print(true);
            		R.close();
                }
		      role = U.get(i).getRole();
		  }
		}
		em.getTransaction().commit();
		if(state1==false)
		    response.sendRedirect("Login.jsp");
		else {
			if(role.getNom_Role().equals("Administrateur"))
			  response.sendRedirect("ListProduit.jsp");
			else
		      response.sendRedirect("Accueil.jsp");
		}
		
	}

}
