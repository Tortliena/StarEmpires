<?php
session_start();
require __DIR__ . '/../../include/bddconnection.php';
require __DIR__ . '/includescriptadmin.php';
/*
echo $_SESSION['id'] . ' = ID de l\'admin.</br>' ;
echo $_POST['destinataire'] . ' = ID du joueur auquel on tente de se connecter.</br>';
*/

$reqcible = $bd->prepare('SELECT id, pseudo, niveauadmin FROM c_utilisateurs WHERE id = ?');
$reqcible->execute(array($_POST['destinataire']));
$repcible = $reqcible->fetch();

$reqadmin = $bd->prepare('SELECT niveauadmin FROM c_utilisateurs WHERE id = ?');
$reqadmin->execute(array($_SESSION['id']));
$repadmin = $reqadmin->fetch();

if (!isset($repcible['niveauadmin']) OR  !isset($repadmin['niveauadmin']))
    {
    header('Location: ../../accueil.php');
    exit;
    }
elseif ($repcible['niveauadmin'] < $repadmin['niveauadmin'])
    {
    $_SESSION['id'] = $repcible['id'];
    $_SESSION['pseudo'] = $repcible["pseudo"];
    header('Location: ../../capitale/capitale.php');
    exit;
    }
else
    {
    header('Location: ../../accueil.php');
    exit;
    }
?>