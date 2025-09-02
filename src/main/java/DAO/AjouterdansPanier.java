package DAO;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Paniers.Panier;
import Paniers.Produit;
import Utilisateur.Client;

/**
 * Servlet implementation class AjouterdansPanier
 */
@WebServlet("/AjouterdansPanier")
public class AjouterdansPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterdansPanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session1 = request.getSession();
		if(session1.getAttribute("iduser")==null)
			response.sendRedirect("Login.jsp");
		else {
		int idu = Integer.parseInt(session1.getAttribute("iduser").toString());
		
		
		File file = new File("C://Users//user//Desktop//PFE//Project//src//main//webapp//file.txt");
		Scanner scanf = new Scanner(file);
		int AS =scanf.nextInt();
	    scanf.close();
	      
	    float Qte = Float.parseFloat(request.getParameter("Qte"));
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
		
        Produit p = em.find(Produit.class,AS);
        Client C = em.find(Client.class,idu);
        Panier panier = C.getPanier();
        float T = Qte*p.getPrixProduit();
        panier.AjouterLigne(Qte,p.getPrixProduit(),T,p,em);
        C.setPanier(panier);
        em.persist(C);
 
        em.getTransaction().commit();
     
	    response.sendRedirect("Panier.jsp");
		}
	}

}
