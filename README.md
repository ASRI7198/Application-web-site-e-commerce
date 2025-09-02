# Conception et Développement d’un Système de Recommandation pour E‑Commerce

[▶️ **Vidéo de démonstration (WMV)**](Réalisation de PFE.wmv)

> Déposez `Réalisation de PFE.wmv` à la **racine** du dépôt pour que ce lien fonctionne sur GitHub.  
> (Option : convertir en `.mp4` pour une meilleure compatibilité navigateur.)

---

## 👋 Aperçu

Projet de Fin d’Études (Licence SMI, Université Chouaib Doukkali – El Jadida) : **conception et réalisation d’une plateforme E‑Commerce** intégrant un **système de recommandation** pour proposer des produits pertinents aux clients.

- **Front‑office** : catalogue, panier, inscription/connexion, paiement (maquette).  
- **Back‑office** : gestion des produits, promotions, dépôts, clients.  
- **Recommandation** : propositions personnalisées à la reconnexion selon préférences (historique/panier).

---

## 🏗️ Structure du projet (selon la capture)

```text
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
│           ├── List Client.jsp
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
└── README.md
```

> **Remarque** : la présence de `persistence.xml` sous `src/main/java/META‑INF/` est supportée si le répertoire est bien empaqueté au runtime dans le classpath. Option plus standard : `src/main/resources/META-INF/persistence.xml`.

---

## 🧰 Stack & Outils

- **Langages** : Java (J2EE), JSP/Servlets, HTML/CSS/JavaScript, Bootstrap  
- **Persistance** : JPA / Hibernate (`persistence.xml`)  
- **Serveur** : Apache Tomcat  
- **Base de données** : MySQL (XAMPP, phpMyAdmin)  
- **IDE** : Eclipse

---

## 🧩 Organisation métier (packages)

- **Commandes/** : agrégats commande, ligne, paiement, livraison, facture, promo…  
- **Paniers/** : gestion du panier (lignes, erreurs, devis, opérations).  
- **Utilisateur/** : entités et rôles (Client, Utilisateur, Droit, Profil_*).  
- **DAO/** : servlets/handlers pour ajouter/modifier/supprimer, session, signup…  
- **SystemRecommendation/** : logique de **recommandation** (SysRecommandation).  
- **webapp/** : **JSP** (Accueil, Login, Panier, Paiement, Détails…), assets (css/js/images).

---

## 🚀 Déploiement local (Tomcat)

> **Pré‑requis** : Java 8+, Tomcat 9+, MySQL.

1. **Base de données**  
   - Créez la base `ecommerce` dans MySQL.  
   - Renseignez l’URL et identifiants dans `persistence.xml`.

2. **Build & déploiement**  
   - Via Eclipse (Dynamic Web Project) : *Run on Server* (Tomcat).  
   - Ou empaquetez en **WAR** puis déposez-le dans `TOMCAT_HOME/webapps/`.

3. **Accès**  
   - Front : `http://localhost:8080/<nom-app>/`  
   - Admin : `http://localhost:8080/<nom-app>/admin` (si prévu)

---

## 🔐 Notes & bonnes pratiques

- Ajouter un `.gitignore` (ex. : `.settings/`, `build/`, `*.class`, `*.log`, `*.war`).  
- Gérer les **sessions** et la sécurité des formulaires (login, panier, paiement).  
- RGPD : mentions et consentement si données personnelles.

---

## 📎 Documents

- Rapport et présentation (à ajouter au dépôt si souhaité) :  
  `Rapport-Asri Rida.pdf`, `Présentation Rida (1).pptx`.

---

## 👤 Crédits

- **Auteur** : Rida ASRI  
- **Encadrement** : Pr. Inssaf EL GUABASSI, Pr. Hassan SILKAN
