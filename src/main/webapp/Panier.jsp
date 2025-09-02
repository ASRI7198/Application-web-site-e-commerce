<%@page import="java.io.FileReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File" %>
<%@page import="java.io.FileNotFoundException" %>
<%@page import="java.io.FileWriter" %>
<%@page import="java.util.Scanner" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.persistence.Persistence" %>
<%@page import="javax.persistence.EntityManagerFactory" %>
<%@page import="javax.persistence.EntityManager" %>
<%@page import="Paniers.Produit" %>
<%@page import="Paniers.Panier" %>
<%@page import="Paniers.Ligne_Panier" %>
<%@page import="Utilisateur.Client" %>
<%@page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/css/styles.css" rel="stylesheet" media="all">
    <script src="js/bootstrap.bundle.min.js"></script>
    <link href="css/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/css/mycss.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>
    <link href="css/css/painer.css" rel="stylesheet">
    <link href="css/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styleB.css" rel="stylesheet" />
</head>
<body class="page-wrapper">
<%
  HttpSession session1 = request.getSession();
  int idu ;
  if(session1.getAttribute("iduser")==null)
	  response.sendRedirect("Login.jsp");
  else{
%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light nav-width">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="Accueil.jsp"><img class="im" src="png/logo2.png"> Start Shopping </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Accueil&nbsp&nbsp</a></li>
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="produits.jsp">Produits&nbsp&nbsp</a></li>
                      <li class="nav-item"><a class="nav-link active" aria-current="page" href="clients.jsp">Clients&nbsp&nbsp</a></li>
                 <%
                 idu = Integer.parseInt(session1.getAttribute("iduser").toString());
                 EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
                 EntityManager em = emf.createEntityManager();
                 em.getTransaction().begin();
                 Client C = em.find(Client.class,idu);
                 Panier panier = C.getPanier();
                 session1.setAttribute("id_panier",panier.getId_Panier());
                 List<Ligne_Panier> LP = new ArrayList<Ligne_Panier>(panier.getListLigneP());
                 
                 int size = LP.size();
                 int s = Integer.parseInt(session1.getAttribute("size").toString());
                 %>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Ventes</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="commande.jsp">Commandes</a></li>
                            <li><a class="dropdown-item" href="factures.jsp">Factures</a></li>
                            <li><a class="dropdown-item" href="paiements.jsp">Paiements</a></li>
                        </ul>
                    </li>
                </ul>
                  <form class="d-flex" action="Panier.jsp" method="POST">
                        <button class="btn btn-outline-dark" type="submit">
                            <img src="png/Panier.png" class="pan">
                            Chariot
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=size%></span>
                        </button><br>
                    </form>  
            </div>  
        </div>
          <a href="Login.jsp"><img class="im" src="png/user.png"></a>
            <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
          <a href="Login.jsp"><img class="im" src="png/deconnexion.png"></a>
          <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
    </nav><br><br><br><br><br>
    <div class="card">
        <div class="row">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>Panier</b></h4></div>
                        <div class="col align-self-center text-right text-muted"> <%=size%> articles</div>
                    </div>
                </div>
                <% 
                  for(int i=0;i<size;i++){
                	  int a = LP.get(i).getIdProduit() ;
                	  Produit p = em.find(Produit.class,a); 
                	
                 %>
                <div class="row border-top border-bottom">
                    <div class="row main align-items-center">
                        <div class="col-4"><img class="img-fluid w-75 p-3 d-flex justify-content-center" src="images/<%=p.getImageProduit()%>"></div>
                        <div class="col">
                           <div class="row text-muted"><%=p.getTypeProduit()%></div>
                            <div class="row"><%=p.getNomProduit()%></div>
                        </div>
                        <div class="col">
                            <a href="#"></a><a href="#" class="border"><%=LP.get(i).getQte()%></a><a href="#"></a>
                        </div>
                        <div class="col"><%=p.getPrixProduit()%> DH <a href="SupprimerLigne?index=<%=LP.get(i).getId_Lign_panier()%>" class="close">&#10005;</a></div>
                    </div>
                </div><%  em.persist(p); %>
                    <% 
                      }
                      if(LP.size()!=0){
                    	File file = new File("C://Users//user//Desktop//PFE//Project//src//main//webapp//state.txt");
                  	  	FileWriter fw = new FileWriter(file) ;
                  		PrintWriter R = new PrintWriter(fw);
                  	    R.print(false);
           			    R.close();
                      }
                      %>
                <div class="back-to-shop"><a href="Accueil.jsp">&leftarrow;</a><span class="text-muted">Retour à la boutique</span></div>
            </div>
            <div class="col-md-4 summary">
                <div><h5><b>Sommaire</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col">ARTICLES <%=size%></div>
                    <div class="col text-right"><%=panier.Recalculer()%> DH</div>
                </div>
                <form action="Paiement.jsp">
                    <p>EXPÉDITION</p>
                    <select name="livraison">
                    <option class="text-muted" value="Livraison Standard">Livraison Standard- 5.00 DH</option>
                    <option class="text-muted" value="Livraison express">Livraison express- 5.00 DH</option>
                    <option class="text-muted" value="Livraison domicile">Livraison domicile- 5.00 DH</option>
                    <option class="text-muted" value="Livraison kilomètre">Livraison kilomètre- 5.00 DH</option>
                    </select>
                    <p>DONNER LE CODE</p>
                    <input id="code" placeholder="entrez votre code">
               
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">PRIX TOTAL</div>
                    <% int a = 5 ;
                    if(panier.Recalculer()==0)
                    	a = 0 ;%>
                    <div class="col text-right"><%=panier.Recalculer()+a%> DH </div>
                    <%
             
                    em.getTransaction().commit();%>
                    <% session1.setAttribute("Total",panier.Recalculer()+5); %>
                </div>
                 <button class="btn1">Commander</button>
                 </form>
            </div> 
    </div> 
     </div><br><br><br><br><br><br>
      <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Votre site Web 2022</p></div>
        </footer>
        <script src="js/js1/bootstrap.bundle.min.js"></script>
        <script src="js/js1/scripts.js"></script>
        <%}%>

</body>
</html>