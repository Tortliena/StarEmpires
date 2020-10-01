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

$req = $bd->prepare('INSERT INTO b_afaire(texteafaire, priorite) VALUES(:texteafaire, :priorite)');
$req->execute(array(
            'texteafaire' => $_POST['nouveauprojet'],
            'priorite' => $_POST['niveaudeprojet']));

header('Location: ../afaire.php');
?>