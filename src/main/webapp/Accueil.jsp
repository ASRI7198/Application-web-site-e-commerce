<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.Persistence" %>
<%@page import="javax.persistence.EntityManagerFactory" %>
<%@page import="javax.persistence.EntityManager" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="Paniers.Produit" %> 
<%@page import="Paniers.Panier" %>
<%@page import="Paniers.Ligne_Panier" %>
<%@page import="Utilisateur.Client" %>
<%@page import="java.util.ArrayList" %>
<%@page import="SystemRecommendation.SysRecommandation" %>
<%@page import="java.io.FileWriter" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.File" %>
<%@page import="java.io.FileNotFoundException" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
    <link href="css/stylesR.css" rel="stylesheet" />
     <link href="png/favicon.ico" rel="icon" type="image/x-icon" />
     <link href="css/bootstrap-icons.css" rel="stylesheet" />
     <link href="css/styleB.css" rel="stylesheet" />
     
</head>
<body>     
      <% 
      HttpSession session1 = request.getSession(); 
      String nom ;
      int idu ;
      if(session1.getAttribute("nom")!=null && session1.getAttribute("iduser")!=null){
      	nom = session1.getAttribute("nom").toString();
        idu = Integer.parseInt(session1.getAttribute("iduser").toString());
      }else{
      	nom="";
      	idu=-1;
      }
      %>
           
        <div class="Bienvennue fw-normal display-5">Bienvenue <%=nom%></div>
        </header>
      <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="Accueil.jsp"><img src="png/logo2.png"> Start Shopping </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Accueil&nbsp&nbsp</a></li>
                         <li class="nav-item"><a class="nav-link active" aria-current="page" href="ListProduit.jsp">Produits&nbsp&nbsp</a></li>
                          <li class="nav-item"><a class="nav-link active" aria-current="page" href="clients.jsp">Clients&nbsp&nbsp</a></li>
                     
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Ventes</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!"></a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="commande.jsp">Commandes</a></li>
                                <li><a class="dropdown-item" href="factures.jsp">Factures</a></li>
                                <li><a class="dropdown-item" href="paiements.jsp">Paiements</a></li>
                            </ul>
                        </li>
                    </ul>
                   	 <div class="input-group mx-4 w-50">
						  <input type="text" class="form-control" placeholder="trouver votre produits ... " aria-label="Recipient's username" aria-describedby="button-addon2">
						  <button class="btn btn-outline-dark" type="button" id="button-addon2">GO</button>
					</div>
					
                   <%
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
                    EntityManager em = emf.createEntityManager();
                    em.getTransaction().begin();
                    int size = 0 ;
                    if(idu!=-1){
                    Client C = em.find(Client.class,idu);
                    Panier panier = C.getPanier();
                    List<Ligne_Panier> LP = new ArrayList<Ligne_Panier>(panier.getListLigneP());
                    size = LP.size();
                    %>
                    <form class="d-flex" action="Panier.jsp" method="POST">
                        <button class="d-flex btn btn-outline-dark mx-4" type="submit">
                            <img src="png/Panier.png">
                             Chariot
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=size%></span>
                        </button><br>
                    </form>
                    <%}else{%>
                    	<form class="d-flex" action="Panier.jsp" method="POST">
                        <button class="d-flex btn btn-outline-dark mx-4" type="submit">
                            <img src="png/Panier.png">
                             Chariot
                        </button><br>
                    </form>
                   <%}%>  
                </div>  
            </div>
            <div class="btn btn-outline-dark">Bienvenue <%=nom%></div><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
              <a href="Login.jsp"><img src="png/user.png"></a>
                <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
              <a href="destroySession"><img src="png/deconnexion.png"></a>
              <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
        </nav>
         <%
         File file = new File("C://Users//user//Desktop//PFE//Project//src//main//webapp//state.txt");
 		 Scanner scanf = new Scanner(file);
 		 boolean state =scanf.nextBoolean();
 	     scanf.close();
                        %>
        
        <section class="py-5 section-acceuil">
            <div class="container px-4 px-lg-5 mt-5">
                  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%   
                    if(idu==-1 || (state==false && idu!=-1)){
                    	
                     List<Produit> P = em.createQuery("from Produit p").getResultList();
                     for(int i=0;i<P.size();i++){
                  %>
                    <div class="col mb-5">
                        <div class="card shadow-sm pb-2">
                        <div class="img-container">
                            <img class="card-img-top" src="images/<%=P.get(i).getImageProduit()%>" alt="..."/>
                        </div>
                            <div class="card-body">
                                <div class="text-center">
                                    <h5 class="fw-bolder small "><%=P.get(i).getDesignationProduit()%></h5>
                                    <span><%out.print(P.get(i).getPrixProduit()+" DH");%></span>
                                    <div class="d-flex justify-content-center small text-warning"> 
                                      <% for(int j=0;j<P.get(i).getstar();j++){ %>
                                        <img class="star" alt="#" src="./png/star.png">
                                      <%}%>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="card-footer border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="details.jsp?id=<%=P.get(i).getId_produit()%>">Détails</a></div>
                            </div>
                        </div>
                    </div>
                      <%
                       }
                       }else{
                       SysRecommandation sysr = new SysRecommandation();
                       List<Produit> P = new ArrayList<Produit>(sysr.Recommandation_Contenu(idu,em));
                       for(int i=0;i<P.size();i++){
                      %>
                        <div class="col mb-5">
                        <div class="card shadow-sm pb-2">
                        <div class="img-container">
                            <img class="card-img-top" src="images/<%=P.get(i).getImageProduit()%>" alt="..."/>
                        </div>
                            <div class="card-body">
                                <div class="text-center">
                                    <h5 class="fw-bolder small "><%=P.get(i).getDesignationProduit()%></h5>
                                    <span><%out.print(P.get(i).getPrixProduit()+" DH");%></span>
                                    <div class="d-flex justify-content-center small text-warning">
                                      <% for(int j=0;j<P.get(i).getstar();j++){ %>
                                        <img class="star" alt="#" src="./png/star.png">
                                      <%}%>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="details.jsp?id=<%=P.get(i).getId_produit()%>">Détails</a></div>
                            </div>
                        </div>
                    </div>
                    
                      <%
                     
                       }
                      }
                      session1.setAttribute("size",size);
                      em.getTransaction().commit();
                      %>
                 </div>
              </div>
            </section>
        
        
                   
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-dark">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <script src="js/js1/bootstrap.bundle.min.js"></script>
        <script src="js/js1/scripts.js"></script>
          <script src="js/script.js"></script> 
</body>
</html>