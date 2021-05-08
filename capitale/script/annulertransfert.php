<?php 
session_start(); 
require __DIR__ . '/../../include/bddconnection.php'; 

/*
echo $_SESSION['id'] . ' id du joueur </br>';
echo $_POST['idtransfert'] . ' id du transfert </br>';
*/

// Vérifier qu'on possede le transfert et que le compteur est au max.
$reqinfotrasnfert = $bd->prepare('SELECT * FROM c_transfertvaisseau WHERE idtransfert = ?');
$reqinfotrasnfert->execute(array($_POST['idtransfert']));
$repinfotrasnfert = $reqinfotrasnfert->fetch();

if ($repinfotrasnfert['idjoueurtransfert'] != $_SESSION['id'])
    {
    header('Location: ../capitale.php?message=31');
    exit;
    }
elseif ($repinfotrasnfert['toursrestantstranfert'] < 3)
    {
    header('Location: ../capitale.php?message=31');
    exit;
    }
else
    {
    $reqdeletetransfert = $bd->prepare('DELETE FROM c_transfertvaisseau WHERE idtransfert = ?');
    $reqdeletetransfert->execute(array($_POST['idtransfert']));
    header('Location: ../capitale.php?message=89');
    exit;
    }
?>