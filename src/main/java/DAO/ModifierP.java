package DAO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Paniers.Produit;
import Utilisateur.Utilisateur;

/**
 * Servlet implementation class ModifierP
 */
@MultipartConfig
@WebServlet("/ModifierP")
public class ModifierP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierP() {
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
		
		
		HttpSession session = request.getSession();
		int id = Integer.parseInt((String) session.getAttribute("idP"));
		String Ref = request.getParameter("ref");
		String nom = request.getParameter("nom");
		String Des = request.getParameter("des");
		String Etat = request.getParameter("etat");
		String Cou = request.getParameter("cou");
		float Poid = Float.parseFloat(request.getParameter("poid"));
		float Prix = Float.parseFloat(request.getParameter("prix"));
		String Type = request.getParameter("type");
		String Description = request.getParameter("descrip") ;
		String Marque = request.getParameter("marque");
		int star = Integer.parseInt(request.getParameter("star"));
		Part file = request.getPart("image");
		String Image = file.getSubmittedFileName();
		
     if(((Poid<=0)||(Prix<=0)))
	     response.sendRedirect("Modifier.jsp");
     else {
    	 
    	    SaveImage(file);
    		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
    		EntityManager em = emf.createEntityManager();
    		em.getTransaction().begin();
    		
    		Produit p = new Produit();
    		p.Modifier(id,Ref,nom,Type,Etat,Des,Prix,Poid,Cou,Image,Description,Marque,star,em);
    		
    		em.getTransaction().commit();
    		
    		
    		response.sendRedirect("ListProduit.jsp");
     }
   
     
		
	}
	
	public void SaveImage(Part file) {
		
		String upload = "C:/Users/user/Desktop/PFE/Project/src/main/webapp/images"+file.getSubmittedFileName();
		
		try {
			FileOutputStream fos = new FileOutputStream(upload);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
		}catch(Exception e){
			e.getMessage();
		}
	}

}
