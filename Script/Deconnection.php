<?php 
session_start();

// Suppression des variables de session et de la session
$_SESSION = array();
session_destroy();

// Suppression des cookies de connexion automatique
setcookie("id", 0, time(), "/"); 
setcookie("pass", 0, time(), "/");

header('Location: ../accueil.php?message=8');
?>