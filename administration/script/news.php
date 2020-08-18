<?php
session_start();
require __DIR__ . '/../../include/BDDconnection.php';


echo 'Id du joueur : '.$_SESSION['id'].'</br>' ;
echo 'Texte de la news : '.$_POST['textenews'].'</br>';
echo 'Titre de la news : '.$_POST['titre'].'</br>';

$reqcreernews = $bda->prepare('INSERT INTO news(textenews, titrenews) VALUES(?, ?)');
$reqcreernews->execute(array($_POST['textenews'], $_POST['titre']));

header('Location: ../administration.php');
?>