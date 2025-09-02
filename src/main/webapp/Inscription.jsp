<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Formulaire d'inscription</title>
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="css/fonts.googleapis" rel="stylesheet">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <link href="css/css/style3.css" rel="stylesheet" media="all">
    <link href="css/css/main.css" rel="stylesheet" media="all">
    <link href="css/css/styles.css" rel="stylesheet" media="all">
    <link href="css/styleB.css" rel="stylesheet" />
</head>

<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="Accueil.jsp"><img src="png/logo2.png"> Start Shopping </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Accueil&nbsp&nbsp</a></li>
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="produits.jsp">Produits&nbsp&nbsp</a></li>
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
            </div>  
        </div>
          <a href="Login.jsp"><img src="png/user.png"></a>
            <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
          <a href="Login.jsp"><img src="png/deconnexion.png"></a>
          <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
    </nav>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body py-2">
                    <h2 class="title">Formulaire d'inscription</h2>
                    <form method="POST" action="signup">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Nom*</label>
                                    <input class="input--style-4" type="text" name="nom" >
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Prenom*</label>
                                    <input class="input--style-4" type="text" name="prenom">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Ville*</label>
                                    <input class="input--style-4" type="text" name="ville">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Adresse*</label>
                                    <input class="input--style-4" type="text" name="Adresse">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Pays*</label>
                                    <input class="input--style-4" type="text" name="pays">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email*</label>
                                    <input class="input--style-4" type="email" name="email">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Code Postal*</label>
                                    <input class="input--style-4" type="number" name="codepostal">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Téléphone*</label>
                                    <input class="input--style-4" type="tel" name="tele">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Référence*</label>
                                        <input class="input--style-4" type="text" name="ref">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Connexion*</label>
                                        <input class="input--style-4" type="text" name="login">
                                    </div>
                                </div>
                        </div>
                        <div class="row row-space">
                           
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Mot de passe*</label>
                                    <input class="input--style-4" type="password" name="pass" required onChange="onChange()">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Confirmer*</label>
                                    <input class="input--style-4" type="password"  name="passC"  required onChange="onChange()">
                                </div>
                            </div>
                        </div>
                     </div>
                        <div class="py-3 pb-4 d-flex justify-content-center w-100">
                            <button class="btn btn-outline-dark w-25" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Votre site Web 2022</p></div>
    </footer>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>
    <script src="js/global.js"></script>
 
    <script src="js/js1/conpass.js"></script>
    <script src="js/js1/bootstrap.bundle.min.js"></script>
    <script src="js/js1/scripts.js"></script>
</body>
</html>