<?php 
// Pour pouvoir exécuter un script, doit avoir au moins le niveau 1 de l'administation.
$reqinfoadmin = $bd->prepare('SELECT niveauadmin FROM c_utilisateurs WHERE id = ?');
$reqinfoadmin->execute(array($_SESSION['id']));
$repinfoadmin = $reqinfoadmin->fetch();

if ($repinfoadmin['niveauadmin'] < 1)
    {
    header('Location: /accueil.php?message=51');
    exit();
    }
?>