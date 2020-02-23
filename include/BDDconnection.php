<?php
try
	{
    // On se connecte à MySQL
	// $bda = new PDO('mysql:host=localhost;dbname=autre;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	// $bdd = new PDO('mysql:host=localhost;dbname=datawebsite;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	// $bdg = new PDO('mysql:host=localhost;dbname=gamer;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	
    $bda = new PDO('mysql:host=localhost;dbname=autre;charset=utf8', 'root', 'root', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	$bdd = new PDO('mysql:host=localhost;dbname=datawebsite;charset=utf8', 'root', 'root', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	$bdg = new PDO('mysql:host=localhost;dbname=gamer;charset=utf8', 'root', 'root', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	
    }
catch(Exception $e)
	{
	    // En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}
?>
