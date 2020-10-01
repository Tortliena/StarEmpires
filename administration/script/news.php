<?php
session_start();
require __DIR__ . '/../../include/bddconnection.php';
require __DIR__ . '/includescriptadmin.php';

/*
echo 'Id du joueur : '.$_SESSION['id'].'</br>' ;
echo 'Texte de la news : '.$_POST['textenews'].'</br>';
echo 'Titre de la news : '.$_POST['titre'].'</br>';
echo 'id de la news en cours de modifications (s\'il y a lieu) : '.$_POST['modifnews'].'</br>';
*/

if(isset($_POST['modifnews']))
	{
	$reqMAJnews = $bd->prepare('UPDATE b_news SET textenews = ?, titrenews = ? WHERE idnews = ?');
	$reqMAJnews->execute(array($_POST['textenews'], $_POST['titre'], $_POST['modifnews']));
	}
else
	{
	$reqcreernews = $bd->prepare('INSERT INTO b_news(textenews, titrenews) VALUES(?, ?)');
	$reqcreernews->execute(array($_POST['textenews'], $_POST['titre']));
	}

header('Location: ../administration.php');
?>