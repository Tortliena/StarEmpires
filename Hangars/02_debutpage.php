<?php
if (!isset($repflotte['idplaneteflotte']))   // pas de flotte avec cet id.
	{ header('Location: ../../Accueil.php'); exit(); }
if ($repplanete['idjoueurplanete'] != $_SESSION['id'])   // La planète dont est originaire la flotte n'est pas celle de du joueur.
	{ header('Location: ../../Accueil.php'); exit(); }
if ($vitesse == 0) // Si la vitesse est à zéro, cela veut dire que la flotte n'a pas de vaisseau.
	{
	header("location: ../../planete/planete.php?id=" . urlencode($repplanete['idplanete']));
	}

echo '<form method="post" action="/script/renommer.php"><h1>Flotte : '.$repflotte['nomflotte'];  
echo '&nbsp;<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />';
echo '<input name="id" type="hidden" value="'.$_GET['id'].'">';
echo '<input name="type" type="hidden" value="flotte">';
echo '&nbsp;<input type="submit" value="Renommer"/></h1></form>';

$typemessage = 'flotte';
include("../include/resume.php");
include("../include/message.php");
?>