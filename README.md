<video controls width="800" style="max-width:100%;">
  <source src="Réalisation-de-PFE.mp4" type="video/mp4" />
  ▶️ Votre navigateur ne peut pas lire la vidéo.
  <a href="Réalisation-de-PFE.mp4">Télécharger la démo vidéo</a>
</video>


# Système E‑Commerce avec Recommandation — PFE Licence SMI

Je présente ici mon projet de fin d’études, réalisé en 2022 au sein de la faculté des Sciences d’El Jadida : une application web d’E‑Commerce avec un système de recommandation intégré. J’ai conçu l’architecture, développé le front‑office et le back‑office, modélisé les entités métier et implémenté une logique simple de recommandations à partir des interactions des utilisateurs (historique, panier, catégories consultées).

## Objectifs
- Proposer une boutique en ligne fonctionnelle (catalogue, panier, commande, authentification).
- Offrir un espace d’administration pour gérer les produits, clients, promotions et dépôts.
- Recommander des produits pertinents lors de la reconnexion d’un client, en exploitant son comportement passé.

## Architecture et technologies
- **Architecture** : 3‑tiers (présentation · logique métier · données) avec pattern **MVC** côté web.
- **Technos** : Java (JSP/Servlets), JPA/Hibernate, MySQL, Apache Tomcat, HTML/CSS/JS/Bootstrap.
- **IDE** : Eclipse.
- **Persistance** : `persistence.xml` (JPA/Hibernate).

## Structure du projet
```
.
├── .settings/
├── build/
├── src/
│   └── main/
│       ├── java/
│       │   ├── Commandes/
│       │   │   ├── Commande.java
│       │   │   ├── Depot.java
│       │   │   ├── Facture.java
│       │   │   ├── Ligne_Commande.java
│       │   │   ├── Livraison.java
│       │   │   ├── Paiement.java
│       │   │   └── Promotion.java
│       │   ├── DAO/
│       │   │   ├── Ajouter.java
│       │   │   ├── AjouterdansPanier.java
│       │   │   ├── ModifierP.java
│       │   │   ├── Paiementp.java
│       │   │   ├── SupprimerLigne.java
│       │   │   ├── Test.java
│       │   │   ├── destroySession.java
│       │   │   ├── signup.java
│       │   │   └── supprimer.java
│       │   ├── Paniers/
│       │   │   ├── Devis.java
│       │   │   ├── ErreurPanierVide.java
│       │   │   ├── GestionPanier.java
│       │   │   └── Ligne_Panier.java
│       │   ├── SystemRecommendation/
│       │   │   └── SysRecommandation.java
│       │   ├── Utilisateur/
│       │   │   ├── Client.java
│       │   │   ├── Droit.java
│       │   │   ├── Profil_Facturation.java
│       │   │   ├── Profil_Livraison.java
│       │   │   ├── Role.java
│       │   │   └── Utilisateur.java
│       │   ├── ResultatRecherche.java
│       │   ├── Main.java
│       │   └── META-INF/
│       │       └── persistence.xml
│       └── webapp/
│           ├── META-INF/
│           ├── css/
│           ├── images/
│           ├── js/
│           ├── png/
│           ├── vendor/
│           ├── Accueil.jsp
│           ├── Ajouter.jsp
│           ├── Inscription.jsp
│           ├── "List Client.jsp"
│           ├── ListProduit.jsp
│           ├── Login.jsp
│           ├── Modifier.jsp
│           ├── Paiement.jsp
│           ├── Panier.jsp
│           ├── details.jsp
│           ├── file.txt
│           ├── filecom
│           └── state.txt
├── Réalisation de PFE.wmv
├── Rapport-Asri Rida.pdf
├── Présentation Rida (1).pptx
└── README.md
```

## Principales fonctionnalités
### Front‑office
- Accueil, liste et détails produits.
- Inscription/Connexion, gestion de session.
- Panier (ajout, suppression, quantités, total) et passage de commande.
- Paiement (maquette) et récapitulatif.

### Back‑office
- Gestion des produits (CRUD), promotions et dépôts.
- Gestion des clients.
- Accès réservé (profil administrateur).

### Recommandation
- À la reconnexion d’un client, je sélectionne des produits **candidats** à partir de son historique d’interactions (articles consultés/ajoutés) et des **catégories proches**.
- Je filtre les articles déjà achetés et j’ordonne les recommandations selon la **fréquence** et la **récence** d’interaction, avec un bonus pour les articles **en promotion**.
- L’affichage s’intègre à l’accueil utilisateur sous forme de carousel/cartes produits.

## Modèle métier (vue d’ensemble)
- **Utilisateur/Client, Rôle, Droit** : gestion des comptes et autorisations.
- **Produit, Promotion, Dépôt** : catalogue et stock.
- **Panier, Ligne_Panier** : construction de l’achat.
- **Commande, Ligne_Commande, Paiement, Livraison, Facture** : cycle de commande complet.
- **ResultatRecherche** : support des recherches/filtrages côté front.

## Lancement local
1. Base de données MySQL créée sous le nom **ecommerce**.
2. Paramètres de connexion configurés dans `META-INF/persistence.xml` (URL, utilisateur, mot de passe, dialecte).
3. Déploiement sur **Apache Tomcat** (ex. 9.x) depuis Eclipse (*Run on Server*) ou par empaquetage **WAR**.

## Documents
- [Rapport PFE](./Rapport-Asri Rida.pdf)

## Auteur
**Rida ASRI**
