<?php
session_start();
include("../include/bddconnection.php");

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
$reponse = $bd->query('SELECT pseudo FROM c_utilisateurs');
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
$requtilisateur = $bd->prepare('INSERT INTO c_utilisateurs(pseudo, motdepasse, dateinscription) VALUES(:pseudo, :pass, CURDATE())');
$requtilisateur->execute(array(
    'pseudo' => $_POST["pseudo"],
    'pass' => $pass_hache,));
$dernierIDjoueur = $bd->lastInsertId();

$reqexplorationplanete = $bd->prepare('INSERT INTO c_explore(univers, x, y, idexplorateur, tourexploration) VALUES(?, ?, ?, ?, ?)');
$reqexplorationplanete->execute(array($dernierIDjoueur, 3, 3, $dernierIDjoueur, 1));

//GESTION DE LA CRÉATION DE LA PLANÈTE
$reqcreerplanete = $bd->prepare('INSERT INTO c_planete(xplanete, yplanete, universplanete, idjoueurplanete, biens, organisation, efficacite) VALUES(?, ?, ?, ?, ?, ?, ?)');
$reqcreerplanete->execute(array(3, 3, $dernierIDjoueur, $dernierIDjoueur, 300, 9000, 100));
$dernierIDplanete = $bd->lastInsertId();
// Permet de créer des citoyens de multiples fois
$reqpop = $bd->prepare('INSERT INTO c_population(idplanetepop, typepop) VALUES(?, ?)');
$nbdepop = 6;
for ($i = 0; $i < $nbdepop; $i++)
    { // Permet d'inserer 6 citoyens sur la planete cree.
    $reqpop->execute(array($dernierIDplanete, 1));
    }
$reqcreervariation = $bd->prepare('INSERT INTO c_variationstour(idplanetevariation, prodbiens, consobiens) VALUES(?, ?, ?)');
$reqcreervariation->execute(array($dernierIDplanete, 5*$nbdepop, $nbdepop));
$reqcreerlimiteplanete = $bd->prepare('INSERT INTO c_limiteplanete (idlimiteplanete) VALUES(?)');
$reqcreerlimiteplanete->execute(array($dernierIDplanete));
$reqcreerquartiergeneral = $bd->prepare('INSERT INTO c_batiment(typebat, idplanetebat) VALUES(?, ?)');
$reqcreerquartiergeneral->execute(array(33, $dernierIDplanete));
// FIN GESTION CRÉATION PLANETE.

$_SESSION['pseudo'] = $_POST["pseudo"];
$_SESSION['id'] = $dernierIDjoueur;

header('Location: ../capitale/capitale.php?message=4');
?>