<%@page import="SystemRecommendation.SysRecommandation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.Persistence" %>
<%@page import="javax.persistence.EntityManagerFactory" %>
<%@page import="javax.persistence.EntityManager" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="Paniers.Produit" %>
<%@page import="java.io.FileWriter" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.File" %>
<%@page import="java.io.FileNotFoundException" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="Paniers.Produit" %> 
<%@page import="Paniers.Panier" %>
<%@page import="Paniers.Ligne_Panier" %>
<%@page import="Utilisateur.Client" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
      <link href="css/styles2.css" rel="stylesheet" />
       <link href="css/styleB.css" rel="stylesheet" />
       <script nonce="44de5ec6-58e5-41b8-8ddb-fad1975828b4">(function(w,d){!function(a,e,t,r){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zaraz={deferred:[]},a.zaraz.q=[],a.zaraz._f=function(e){return function(){var t=Array.prototype.slice.call(arguments);a.zaraz.q.push({m:e,a:t})}};for(const e of["track","set","ecommerce","debug"])a.zaraz[e]=a.zaraz._f(e);a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r),n=e.getElementsByTagName("title")[0];for(n&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.x=Math.random(),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.zarazData.q=[];a.zaraz.q.length;){const e=a.zaraz.q.shift();a.zarazData.q.push(e)}z.defer=!0;for(const e of[localStorage,sessionStorage])Object.keys(e).filter((a=>a.startsWith("_zaraz_"))).forEach((t=>{try{a.zarazData["z_"+t.slice(7)]=JSON.parse(e.getItem(t))}catch{a.zarazData["z_"+t.slice(7)]=e.getItem(t)}}));z.referrerPolicy="origin",z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script>
</head>
<body>
<%
  HttpSession session1 = request.getSession();
  int idu ;
  if(session1.getAttribute("iduser")!=null)
  idu = Integer.parseInt(session1.getAttribute("iduser").toString());
  else
  idu = -1 ;
%>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5 ">
                <a class="navbar-brand" href="#!"><img src="png/logo2.png"> Start Shopping </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Accueil&nbsp&nbsp</a></li>
                         <li class="nav-item"><a class="nav-link active" aria-current="page" href="produits.jsp">Produits&nbsp&nbsp</a></li>
                          <li class="nav-item"><a class="nav-link active" aria-current="page" href="clients.jsp">Clients&nbsp&nbsp</a></li>
                        
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
                    <div class="input-group mx-4 w-50">
					  <input type="text" class="form-control" placeholder="trouver votre produits ... " aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn btn-outline-dark" type="button" id="button-addon2">GO</button>
					</div>
					<%
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
                    EntityManager em = emf.createEntityManager();
                    em.getTransaction().begin();
                    if(idu!=-1){
                    Client C = em.find(Client.class,idu);
                    Panier panier = C.getPanier();
                    List<Ligne_Panier> LP = new ArrayList<Ligne_Panier>(panier.getListLigneP());
                    int size = LP.size();
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
              <a href="Login.jsp"><img src="png/user.png"></a>
                <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
              <a href="Login.jsp"><img src="png/deconnexion.png"></a>
               <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
        </nav>
       <% 
        int asri =Integer.parseInt(request.getParameter("id"));
        Produit p = em.find(Produit.class,asri);
        %>
        
        
         <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top w-75 mb-5 mb-md-0" src="images/<%=p.getImageProduit()%>" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: <%=p.getRefProduit()%></div>
                        <h1 class="display-5 fw-bolder"><%=p.getNomProduit()%></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through"><%=p.getPrixProduit()-5%> DH</span>
                            <span><%=p.getPrixProduit()%> DH</span>
                        </div>
                        <%
                        File file = new File("C://Users//user//Desktop//PFE//Project//src//main//webapp//file.txt");
                    	FileWriter fw = new FileWriter(file) ;
                		PrintWriter R = new PrintWriter(fw);
                		String idS = ""+p.getId_produit() ;
                		R.print(idS);
                		R.close();
                        %>
                        <p class="lead"><%=p.getDescription()%></p>
                        <div class="d-flex">
                        <form action="AjouterdansPanier" class="d-flex" method="POST">
                            <input class="form-control text-center me-3" id="inputQuantity" type="text" name="Qte" value="1" style="max-width: 3rem" required/><br>
                          <button class="btn btn-outline-dark flex-shrink-0"><img class="pr-3" src="png/Panier.png"> Chariot</button>
                         </form>
                        </div>
                    </div>
                </div>
            </div>
        </section><br><br>
        
    <div class="content">
    <div class="container">
      <h2 class="mb-5">Informations sur le Produit</h2>
 
      <div class="table-responsive">

        <table class="table table-striped custom-table">
          <thead>
            <tr>
           
                <th scope="col">Désignation</th>
                <th scope="col">État</th>
                <th scope="col">Couleur</th>
                <th scope="col">Poid(Kg)</th>
                <th scope="col">Type</th>
                <th scope="col">Marque</th>
            </tr>
          </thead>
          <tbody>

           <tr scope="row">
               <td><%=p.getDesignationProduit()%></td>
               <td><%=p.getEtatProduit()%></td>
               <td><%=p.getCouleurProduit()%></td>
               <td><%=p.getPoidProduit()%></td>
               <td><%=p.getTypeProduit()%></td>
               <td><%=p.getMarque()%></td>
          </tr>      
         </tbody>
       </table>
    </div>
    </div>
    </div><br><br><br>
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Produits connexes</h2><br><br><br>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"> 
                  <%   
                     SysRecommandation sys = new SysRecommandation();
                     List<Produit> P = new ArrayList(sys.Recommandation_Prudact(asri,em));
                     for(int i=0;i<4;i++){
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
                                        <img class="star" alt="#" src="./png/star.png">
                                        <img class="star" alt="#" src="./png/star.png">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="details.jsp?id=<%=P.get(i).getId_produit()%>">Détails</a></div>
                            </div>
                        </div>
                    </div>
                      <% }em.getTransaction().commit();%>
                  </div>
                 </div>
        </section>
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <script src="js/js3/bootstrap2.bundle.min.js"></script>
        <script src="js/js2/scripts2.js"></script>
</body>
</html>