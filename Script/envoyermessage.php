<?php
session_start();
include("BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['destinataire'] . '</br>';
echo $_POST['textemessage'] . '</br>';
echo $_POST['titre'] . '</br>';
*/

// Vérifier si le message contient du texte.
if (empty($_POST['textemessage']) or $_POST['textemessage'] == NULL)
        {
        header('Location: ../messagerie.php?message=22');
        exit();  
        }
$_SESSION['message'] = $_POST['textemessage'] ;

// Vérifier qu'il y a un titre.
    if (empty($_POST['titre']) or $_POST['titre'] == NULL)
        {
        header('Location: ../messagerie.php?message=24');
        exit();    
        }
$_SESSION['titre'] = $_POST['titre']; 


//Vérifier que l'utilisateur existe.
    if (empty($_POST['destinataire']) or $_POST['destinataire'] == NULL or $_POST['destinataire'] == $_SESSION['id'])
        {
        header('Location: ../messagerie.php?message=21');
        exit();  
        }

// Une fois la vérification faite, enregistrer le message.
    else
        {
        $req = $bdd->prepare('INSERT INTO messagerie(idjoueuremetteur , idjoueurrecepteur, textemessagerie, titremessage) VALUES(?, ?, ?, ?)');
        $req->execute(array($_SESSION['id'], $_POST['destinataire'], $_POST['textemessage'], $_POST['titre']));
        $req->closeCursor();
        unset($_SESSION['message']);
        unset($_SESSION['titre']); 
        header('Location: ../messagerie.php?message=23');
        }

header('Location: ../messagerie.php');
?>