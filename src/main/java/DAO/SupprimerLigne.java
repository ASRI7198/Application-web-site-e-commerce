package DAO;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Paniers.Panier;

/**
 * Servlet implementation class SupprimerLigne
 */
@WebServlet("/SupprimerLigne")
public class SupprimerLigne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerLigne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
		int index =Integer.parseInt(request.getParameter("index")) ;
		Panier panier = new Panier();
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        panier.Supprimer(index,em);
        em.getTransaction().commit();
        response.sendRedirect("Panier.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
