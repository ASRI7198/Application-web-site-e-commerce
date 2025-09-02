package DAO;

import java.io.IOException;
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

import Paniers.Produit;
import Utilisateur.Utilisateur;

/**
 * Servlet implementation class supprimer
 */
@WebServlet("/supprimer")
public class supprimer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supprimer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		int id = Integer.parseInt(request.getParameter("id"));
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		
		Produit p = new Produit();
		p.Supprimer(id,em);
		
		em.getTransaction().commit();
		
		response.sendRedirect("ListProduit.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
		
	}

}
