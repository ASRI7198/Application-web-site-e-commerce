<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajouter Produit</title>
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
                <div class="card-body">
                    <h2 class="title">Ajouter Produit</h2>
                    <form method="POST" action="Ajouter" enctype="multipart/form-data">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Référence*</label>
                                    <input class="input--style-4" type="text" name="ref" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Nom*</label>
                                    <input class="input--style-4" type="text" name="nom" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="input-group">
                                <label class="label">Type*</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="type" required>
                                        <option disabled="disabled" selected="selected">Choisissez l'option</option>
                                        <option value="TV">TV</option>
                                        <option value="Caméra">Caméra</option>
                                        <option value="Smartphone">smartphone</option>
                                        <option value="e4">e4</option>
                                        <option value="e5">e5</option>
                                        <option value="e6">e6</option>
                                        <option value="e7">e7</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                               <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Prix*</label>
                                    <input class="input--style-4" type="text" name="prix" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                         
                             <div class="input-group">
                                <label class="label">État*</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="etat" required>
                                        <option disabled="disabled" selected="selected">Choisissez l'option</option>
                                        <option value="Disponible">Disponible</option>
                                        <option value="Indisponible">Indisponible</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Poid*</label>
                                    <input class="input--style-4" type="text" name="poid" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="input-group">
                                <label class="label">Couleur*</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="cou" required>
                                        <option disabled="disabled" selected="selected">Choisissez l'option</option>
                                        <option value="rouge">Rouge</option>
                                        <option value="bleu">Bleu</option>
                                        <option value="Noir">Noir</option>
                                        <option value="blanc">Blanc</option>
                                        <option value="vert">Vert</option>
                                        <option value="jaune">Jaune</option>
                                        <option value="orange">Orang</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Désignation*</label>
                                        <input class="input--style-4" type="text" name="des" required>
                                    </div>
                                </div>
                        </div>
                        <div class="row row-space">
                              <div class="input-group">
                                <label class="label">Étoile*</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="star" required>
                                        <option disabled="disabled" selected="selected">la nombre de étoile</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Description*</label>
                                    <input class="input--style-4" type="text" name="descrip">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                        
                           <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Marque*</label>
                                    <input class="input--style-4" type="text" name="marque">
                                </div>
                            </div>
                        
                        <div class="col-2">
                          <div class="input-group">
                            <label class="label">    </label><br>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="img" id="file">
                                    <label class="label--file" for="file">Insérer la Image</label>
                                </div>
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
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Votre site web 2022</p></div>
    </footer>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>
    <script src="js/global.js"></script>
    <script src="js/js1/bootstrap.bundle.min.js"></script>
    <script src="js/js1/scripts.js"></script>
</body>
</html>