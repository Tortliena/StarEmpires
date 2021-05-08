<?php 
session_start(); 
require __DIR__ . '/../../include/bddconnection.php'; 
include("../../function/variable.php");

/*
echo $_SESSION['id'] . ' id du joueur </br>';
echo $_POST['idvaisseau'] . ' id du vaisseau </br>';
echo $_POST['idplanetearrivee'] . ' id de la planète de destination </br>';
*/

// Vérifier qu'il n'y a pas d'ordre de transfert actuellement.
$reqnbtrasnfertencours = $bd->prepare('SELECT COUNT(*) AS nb FROM c_transfertvaisseau WHERE idjoueurtransfert = ?');
$reqnbtrasnfertencours->execute(array($_SESSION['id']));
$repnbtrasnfertencours = $reqnbtrasnfertencours->fetch();
if ($repnbtrasnfertencours['nb'] > 0)
    {
    header('Location: ../capitale.php?message=86');
    exit;
    }

// Vérifier que le joueur possède le vaisseau
$reqvaisseautransfert = $bd->prepare('SELECT idplanete, idjoueurplanete FROM c_vaisseau
                                      INNER JOIN c_flotte ON idflottevaisseau = idflotte
                                      INNER JOIN c_planete ON idplanete = - idplaneteflotte
                                      WHERE idvaisseau = ?');
$reqvaisseautransfert->execute(array($_POST['idvaisseau']));
$repvaisseautransfert  = $reqvaisseautransfert ->fetch();
if ($repvaisseautransfert['idjoueurplanete'] != $_SESSION['id'])
    {
    header('Location: ../capitale.php?message=31');
    exit;
    }

// Vérifier que le joueur possède la planète
$reqplanetetransfert = $bd->prepare('SELECT idjoueurplanete FROM c_planete WHERE idplanete = ?');
$reqplanetetransfert->execute(array($_POST['idplanetearrivee']));
$repplanetetransfert  = $reqplanetetransfert->fetch();
if ($repplanetetransfert['idjoueurplanete'] != $_SESSION['id'])
    {
    // echo $repplanetetransfert['idjoueurplanete']. 'id du joueur de la planète.';
    header('Location: ../capitale.php?message=31');
    exit;
    }

// Vérifier que la planète de destination est différente de celle d'arrivée.
if ($repvaisseautransfert['idplanete'] == $_POST['idplanetearrivee'])
    {
    header('Location: ../capitale.php?message=87');
    exit;
    }
else  // Faire le transfert. 
    {
    $tempstransfert = variable(11);
    $reqfairetransfert = $bd->prepare(' INSERT INTO c_transfertvaisseau (idjoueurtransfert, idplanetedepart, idplanetearrivee, toursrestantstranfert, idvaisseautransfert)
                                        VALUES (?, ?, ?, ?, ?)');
    $reqfairetransfert->execute(array($_SESSION['id'], $repvaisseautransfert['idplanete'], $_POST['idplanetearrivee'], $tempstransfert, $_POST['idvaisseau']));
    header('Location: ../capitale.php?message=88');
    exit;
    }

header('Location: ../capitale.php?message=31');
exit;
?>