<?php
$path = $_SERVER['DOCUMENT_ROOT'];
try
	{
	if ($path == 'C:/wamp64/www/Starempires')
		{
		$bd = new PDO('mysql:host=localhost;dbname=kaien_starsempire;charset=utf8', 'root', 'root', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));	
		}
	else
		{	
		$bd = new PDO('mysql:host=localhost;dbname=kaien_starsempire;charset=utf8', 'kaien_kaien', 'ucqX8kaS7LtT3ni', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));	
		}
	}

catch(Exception $e)
	{
	    // En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur (valeur de e !) : '.$e->getMessage());
	}
?>