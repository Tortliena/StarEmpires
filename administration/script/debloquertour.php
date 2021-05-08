<?php
session_start();
require __DIR__ . '/../../include/bddconnection.php';
require __DIR__ . '/includescriptadmin.php';

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['nouveauprojet'] . '</br>';
echo $_POST['niveaudeprojet'] . '</br>';
*/

$reqinfoderniertour = $bd->query('SELECT fintour, id FROM c_tour ORDER BY id DESC LIMIT 1');
$repinfoderniertour = $reqinfoderniertour->fetch();

if ($repinfoderniertour['fintour'] > 0)
    {
    header('Location: ../administration.php?message=92');
    }
else
    {
    $requpdatetour = $bd->prepare('UPDATE c_tour SET fintour = ? WHERE id = ?');
    $requpdatetour->execute(array(2, $repinfoderniertour['id']));
    }


header('Location: ../administration.php?message=91');
?>