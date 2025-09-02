
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.Persistence" %>
<%@page import="javax.persistence.EntityManagerFactory" %>
<%@page import="javax.persistence.EntityManager" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="Paniers.Produit" %>

<!DOCTYPE html>
<html lang="en">
 <head>
   <title>List Produit</title>
    <meta charset="utf-8">
    <meta name="viewport" >
    <link href="css/font.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styleT.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
   <link href="css/styleB.css" rel="stylesheet" />
   <link href="css/css/Rida.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
 

	<script nonce="44de5ec6-58e5-41b8-8ddb-fad1975828b4">(function(w,d){!function(a,e,t,r){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zaraz={deferred:[]},a.zaraz.q=[],a.zaraz._f=function(e){return function(){var t=Array.prototype.slice.call(arguments);a.zaraz.q.push({m:e,a:t})}};for(const e of["track","set","ecommerce","debug"])a.zaraz[e]=a.zaraz._f(e);a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r),n=e.getElementsByTagName("title")[0];for(n&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.x=Math.random(),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.zarazData.q=[];a.zaraz.q.length;){const e=a.zaraz.q.shift();a.zarazData.q.push(e)}z.defer=!0;for(const e of[localStorage,sessionStorage])Object.keys(e).filter((a=>a.startsWith("_zaraz_"))).forEach((t=>{try{a.zarazData["z_"+t.slice(7)]=JSON.parse(e.getItem(t))}catch{a.zarazData["z_"+t.slice(7)]=e.getItem(t)}}));z.referrerPolicy="origin",z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script></head>
	</head>
	<body>
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!"><img src="png/logo2.png"> Start Shopping </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page">Accueil&nbsp&nbsp</a></li>
                         <li class="nav-item"><a class="nav-link active" aria-current="page" href="ListProduit.jsp">Produits&nbsp&nbsp</a></li>
                          <li class="nav-item"><a class="nav-link active" aria-current="page" href="List Client.jsp">Clients&nbsp&nbsp</a></li>
                     
                        
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
                </div>  
            </div>
              <a href="Login.jsp"><img src="png/user.png"></a>
                <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
              <a href="Login.jsp"><img src="png/deconnexion.png"></a>
              <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
        </nav>
 	<div class="content">
  
  


        <table class="tableRida">
          <tr class="trRA">
              <th class="thReda thAsri"><h2 class="mb-7">List Produit</h2></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri"></th>
              <th class="thReda thAsri">  <form class="d-flex" action="Ajouter.jsp">
           <button class="btn btn-outline-dark" type="submit" >
             <img src="png/add.png">
                 Produit
           </button>
      </form> <br><br></th>
          
          </tr>
            <tr class="trRA">
           
                <th class="thReda thAsri">Image</th>
                <th class="thReda thAsri">Référence</th>
                <th class="thReda thAsri">Nom</th>
                <th class="thReda thAsri">Désignation</th>
                <th class="thReda thAsri">État</th>
                <th class="thReda thAsri">Couleur</th>
                <th class="thReda thAsri">Poid(Kg)</th>
                <th class="thReda thAsri">Prix(DH)</th>
                <th class="thReda thAsri">Type</th>
                <th class="thReda thAsri">Marque</th>
                <th class="thReda thAsri">Action     </th>
                
            </tr>
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Project");
            EntityManager em = emf.createEntityManager();
            em.getTransaction().begin();
         
            List<Produit> P = em.createQuery("from Produit p").getResultList();
        
            for(int i=0;i<P.size();i++){
            %>
      <tr class="trRA">
      <td class="tdReda"><img src="images/<%=P.get(i).getImageProduit()%>" width="80px"></td>
      <td class="tdReda"><%=P.get(i).getRefProduit()%></td>
      <td class="tdReda"><%=P.get(i).getNomProduit()%></td>
      <td class="tdReda"><%=P.get(i).getDesignationProduit()%></td>
      <td class="tdReda"><%=P.get(i).getEtatProduit()%></td>
      <td class="tdReda"><%=P.get(i).getCouleurProduit()%></td>
      <td class="tdReda"><%=P.get(i).getPoidProduit()%></td>
      <td class="tdReda"><%=P.get(i).getPrixProduit()%></td>
      <td class="tdReda"><%=P.get(i).getTypeProduit()%></td>
      <td class="tdReda"><%=P.get(i).getMarque()%></td>
      <td class="tdReda"><a href="Modifier.jsp?id=<%=P.get(i).getId_produit()%>"><img src="png/mod.png"></a
      ><a href="supprimer?id=<%=P.get(i).getId_produit()%>"><img src="png/supprimer2.png"></a></td>
      </tr>
      <% 
         }
        em.getTransaction().commit();
         %>      
      
        </table>
       
      </div>
  
     <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        
    <script src="js/js1/bootstrap.bundle.min.js"></script>
    <script src="js/js1/scripts.js"></script>
    <script src="js/js2/bootstrap.min.js"></script>
    <script src="js/js2/main.js"></script>
     <script src="js/script.js"></script> 
	</body>
</html>

    