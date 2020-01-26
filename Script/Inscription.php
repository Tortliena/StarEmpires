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
$reponse->closeCursor();

// Dans le cas d'une inscription réussie :
// Hachage du mot de passe
$pass_hache = password_hash($_POST['pass'], PASSWORD_DEFAULT);
$requtilisateur = $bdg->prepare('INSERT INTO utilisateurs(pseudo, motdepasse, dateinscription, biens) VALUES(:pseudo, :pass, CURDATE(), :biens)');
$requtilisateur->execute(array(
    'pseudo' => $_POST["pseudo"],
    'pass' => $pass_hache,
    'biens' => 300));

$reqdernierid = $bdg->query('SELECT id FROM utilisateurs ORDER BY id DESC LIMIT 1');
$repdernierid = $reqdernierid->fetch();

$reqlimite = $bdg->prepare('INSERT INTO limitesjoueurs(id) VALUES(:id)');
$reqlimite->execute(array(
    'id' => $repdernierid['id']));

$reqpop = $bdg->prepare('INSERT INTO population(joueurpop, typepop) VALUES(:joueurpop, :typepop)');
$reqpop->execute(array(
    'joueurpop'=> $repdernierid['id'],
    'typepop'=> 1));
$reqpop->execute(array(
    'joueurpop'=> $repdernierid['id'],
    'typepop'=> 1));
$reqpop->execute(array(
    'joueurpop'=> $repdernierid['id'],
    'typepop'=> 1));
$reqpop->execute(array(
    'joueurpop' => $repdernierid['id'],
    'typepop'=> 1));
$reqpop->execute(array(
    'joueurpop' => $repdernierid['id'],
    'typepop'=> 1));
$reqpop->execute(array(
    'joueurpop' => $repdernierid['id'],
    'typepop'=> 1));

$reqcreerplanete = $bda->prepare('INSERT INTO planete(xplanete, yplanete, universplanete) VALUES(:xplanete, :yplanete, :universplanete)');
$reqcreerplanete->execute(array(
    'xplanete'=> 3,
    'yplanete'=> 3,
    'universplanete'=> $repdernierid['id']));

$_SESSION['pseudo'] = $_POST["pseudo"];
$_SESSION['id'] = $repdernierid['id'];

header('Location: ../accueil.php?message=4');
?>