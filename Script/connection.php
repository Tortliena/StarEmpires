<?php
session_start();
include("BDDconnection.php");

if (isset($_COOKIE['id']) AND !isset($_SESSION['id']))
    {
    $_POST['pass'] = $_COOKIE['pass'];
    $req = $bdd->prepare('SELECT motdepasse, id, pseudo FROM utilisateurs WHERE id = ?');
    $req->execute(array($_COOKIE['id']));
    $resultat = $req->fetch();
    goto a;
    }

setcookie("id", 0, time(), "/");
setcookie("pass", 0, time(), "/");

//  Récupération de l'utilisateur et de son pass hashé
$req = $bdd->prepare('SELECT motdepasse, id, pseudo FROM utilisateurs WHERE pseudo = ?');
$req->execute(array($_POST["pseudo"]));
$resultat = $req->fetch();
a: // On arrive ici si on a déjà des cookies.

// Vous devriez avoir ces variables ici.
/*
echo "</br>Value is: " . $_COOKIE['id'] . " cookie" ;
echo "</br>Value is: " . $_COOKIE['pass'] . " mdp cookie";
echo "</br>Value is: " . $_SESSION['id'] . " session" ;
echo "</br>Value is: " . $_POST["pseudo"] . ' post pseudo </br>' ;
echo "</br>Value is: " . $resultat['motdepasse'] . " resultat mdp"  ;
echo "</br>Value is: " . $resultat['id'] . " resultat id"  ;
echo "</br>Value is: " . $resultat['pseudo'] . " resultat pseudo"  ;
echo "</br>Value is: " . $_POST['pass'] . " resultat pass" ;
echo $_POST["cookie"] . '</br>' ;
*/

// Comparaison du pass envoyé via le formulaire avec la base
$isPasswordCorrect = password_verify($_POST['pass'], $resultat['motdepasse']);


// Cas ou l'on a pas entré un pseudo existant.
if (!$resultat)
{
    header('Location: ../accueil.php?message=7');
    exit();
}

// Cas ou l'on a a bien entré le pseudo et le mdp.
else
{
    if ($isPasswordCorrect)
    {
        $_SESSION['pseudo'] = $resultat["pseudo"];
        $_SESSION['id'] = $resultat['id'];
        if (isset($_POST["cookie"]))
        {
            echo 'boucle de cookie </br>' ;
            setcookie("id", $_SESSION['id'], time() + (86400 * 30), "/");
            setcookie("pass", $_POST['pass'], time() + (86400 * 30), "/");
        }
        header('Location: ../capitale.php');
        exit();
    }

// Le pseudo existe, mais le mot de passe ne colle pas.
    else {
    setcookie("id", 0, time(), "/");
    setcookie("pass", 0, time(), "/");
    header('Location: ../accueil.php?message=6');
    exit();
    }
}

?>