<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['perdreressources'] . '</br>' ;
echo $_POST['idconstruction'] . '</br>' ;
echo $_POST['avancementbiens'] . '</br>' ;
echo $_POST['avancementtitane'] . '</br>' ;
echo $_POST['prixbiens'] . '</br>' ;
echo $_POST['prixtitane'] . '</br>' ;
*/

//Vérifier propriétaire de la construction.  
$reqproprietaireordreconstruction = $bdg->prepare('SELECT idjoueurconst FROM construction WHERE idconst = ?');
$reqproprietaireordreconstruction->execute(array($_POST['idconstruction']));
$repproprietaireordreconstruction = $reqproprietaireordreconstruction->fetch();

if ($repproprietaireordreconstruction['idjoueurconst'] != $_SESSION['id'])
    {
    header('Location: ../Acceuil.php'); exit();
    }

// Si pas d'avancement, on supprime tout.
if ($_POST['avancementbiens'] == $_POST['prixbiens'] AND $_POST['avancementtitane'] == $_POST['prixtitane'])
    {
    $stmt = $bdg->prepare("DELETE FROM construction WHERE idconst = :idconst AND idjoueurconst = :idjoueurconst");
    $stmt->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
    $stmt->bindParam(':idjoueurconst', $_SESSION['id'], PDO::PARAM_INT);   
    $stmt->execute();
    header('Location: ../chantier.php?message=13');
    exit(); 
    }

// Si avancé et pas coché, alors on ne laisse qu'une seule construction et on renvoie vers la page avec un message d'alerte.
elseif (!isset($_POST['perdreressources']))
    {
    $stmt = $bdg->prepare("UPDATE construction SET nombre = 1 WHERE idconst = :idconst AND idjoueurconst = :idjoueurconst");
    $stmt->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
    $stmt->bindParam(':idjoueurconst', $_SESSION['id'], PDO::PARAM_INT);   
    $stmt->execute();
    header('Location: ../chantier.php?message=14');
    exit(); 
    }

// Si avancé et coché, on delete.
else
    {
    $stmt = $bdg->prepare("DELETE FROM construction WHERE idconst = :idconst AND idjoueurconst = :idjoueurconst");
    $stmt->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
    $stmt->bindParam(':idjoueurconst', $_SESSION['id'], PDO::PARAM_INT);   
    $stmt->execute();
    header('Location: ../chantier.php?message=13');
    exit(); 
    }

header('Location: ../chantier.php');
?>