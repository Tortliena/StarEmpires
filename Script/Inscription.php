<?php
session_start();
include("../include/BDDconnection.php");

//pseudo vide lors de la tentative d'inscription.
if (empty($_POST["pseudo"]) or !isset($_POST["pseudo"]))
    {
    header('Location: ../accueil.php?message=5');
    exit();  
    }

//Mots de passe indentiques lors de la tentative d'inscription.
if ($_POST["pass"] != $_POST["pass2"])
    {
    header('Location: ../accueil.php?message=1');
    exit();  
    }

//Mots de passe vides lors de la tentative d'inscription.
if (empty($_POST["pass"]) or !isset($_POST["pass"]))
    {
    header('Location: ../accueil.php?message=2');
    exit();  
    }

//Pseudo déjà présent dans la bdd.
$reponse = $bdg->query('SELECT pseudo FROM utilisateurs');
while ($donnees = $reponse->fetch())
    {
    if ($_POST["pseudo"] == $donnees['pseudo'])
        {
    header('Location: ../accueil.php?message=3');
    exit();
        }
    }

// Dans le cas d'une inscription réussie :
// Hachage du mot de passe
$pass_hache = password_hash($_POST['pass'], PASSWORD_DEFAULT);
$requtilisateur = $bdg->prepare('INSERT INTO utilisateurs(pseudo, motdepasse, dateinscription) VALUES(:pseudo, :pass, CURDATE())');
$requtilisateur->execute(array(
    'pseudo' => $_POST["pseudo"],
    'pass' => $pass_hache,));
$dernierIDjoueur = $bdg->lastInsertId();

$reqcreerplanete = $bdg->prepare('INSERT INTO planete(xplanete, yplanete, universplanete, idjoueurplanete, biens, organisation, efficacite) VALUES(?, ?, ?, ?, ?, ?, ?)');
$reqcreerplanete->execute(array(3, 3, $dernierIDjoueur, $dernierIDjoueur, 300, 9000, 100));
$dernierIDplanete = $bdg->lastInsertId();

// Permet de créer des citoyens de multiples fois
$reqpop = $bdg->prepare('INSERT INTO population(idplanetepop, typepop) VALUES(?, ?)');

$nbdepop = 6;
for ($i = 0; $i < $nbdepop; $i++)
    { // Permet d'inserer 6 citoyens sur la planete cree.
    $reqpop->execute(array($dernierIDplanete, 1));
    }

$reqcreervariation = $bdg->prepare('INSERT INTO variationstour (idplanetevariation, prodbiens, consobiens) VALUES(?, ?, ?)');
$reqcreervariation->execute(array($dernierIDplanete, 5*$nbdepop, $nbdepop));
$reqcreerlimiteplanete = $bdg->prepare('INSERT INTO limiteplanete (idlimiteplanete) VALUES(?)');
$reqcreerlimiteplanete->execute(array($dernierIDplanete));
$reqexplorationplanete = $bdg->prepare('INSERT INTO explore (univers, x, y, idexplorateur, tourexploration) VALUES(?, ?, ?, ?, ?)');
$reqexplorationplanete->execute(array($dernierIDjoueur, 3, 3, $dernierIDjoueur, 1));



$_SESSION['pseudo'] = $_POST["pseudo"];
$_SESSION['id'] = $dernierIDjoueur;

header('Location: ../capitale.php?message=4');
?>