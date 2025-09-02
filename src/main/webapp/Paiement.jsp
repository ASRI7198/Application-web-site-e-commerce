<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<link href="css/css1/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/stylesR.css" rel="stylesheet" />
<script src="js/js3/bootstrap.min.js"></script>
<script src="js/js3/jquery.min.js"></script>
     <link href="png/favicon.ico" rel="icon" type="image/x-icon" />
     <link href="css/bootstrap-icons.css" rel="stylesheet" />
     <link href="css/styleB.css" rel="stylesheet" />
</head>
<body style="background:orange">
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
        </nav><br><br><br><br><br><br>
    
 <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formPayment"></span>
                    <div class="my-5"></div>

                    <!-- form card cc payment -->
                    <div class="card card-outline-secondary">
                        <div class="card-body">
                            <h3 class="text-center">Paiement par carte de crédit</h3>
                            <hr>
                            <div class="alert alert-info p-2 pb-3">
                                <a class="close font-weight-normal initialism" data-dismiss="alert" href="#"><samp>×</samp></a> 
                                Le code CVC est requis.
                            </div>
                            <form class="form" role="form" autocomplete="off" action="Paiementp" method="POST">
                                <div class="form-group">
                                    <label for="cc_name">Nom du titulaire de la carte</label>
                                    <input type="text" class="form-control" id="cc_name" pattern="\w+ \w+.*" name="nom" title="First and last name" required="required">
                                </div>
                                <div class="form-group">
                                    <label>Numéro de carte</label>
                                    <input type="text" class="form-control" autocomplete="off" maxlength="20" pattern="\d{16}" name="num" title="Credit card number" required="">
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-12">Carte Exp. Date</label>
                                    <div class="col-md-4">
                                        <select class="form-control" name="mois" size="0">
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-control" name="annee" size="0">
                                            <option>2018</option>
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                        </select>
                                    </div>
                                    <%session1.setAttribute("liv",request.getParameter("livraison"));%>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" autocomplete="off" maxlength="3" pattern="\d{3}" title="Three digits at back of your card" name="cvc" required  placeholder="CVC">
                                    </div>
                                </div><br>
                                <hr><br>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <button type="reset" class="btn btn-default btn-lg btn-block">Annuler</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-success btn-lg btn-block">Valider</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    </div><br><br><br><br><br><br><br><br><br>
                    <!-- /form card cc payment -->
                     <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-dark">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <script src="js/js1/bootstrap.bundle.min.js"></script>
        <script src="js/js1/scripts.js"></script>
          <script src="js/script.js"></script> 
                
  
</body>
</html>