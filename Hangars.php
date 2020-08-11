<?php
include("hangars/1_entete.php");

$reqflotte = $bdg->prepare('SELECT * FROM flotte WHERE idflotte = ?');
$reqflotte->execute(array($_GET['id']));
$repflotte = $reqflotte->fetch();

$reqplanete2 = $bdg->prepare('SELECT idplanete, idjoueurplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? LIMIT 1');
$reqplanete2->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte']));
$repplanete2 = $reqplanete2->fetch();

$reqplanete = $bdg->prepare('SELECT idplanete, idjoueurplanete FROM planete WHERE idplanete = ?');
$reqplanete->execute(array($repflotte['idplaneteflotte']));
$repplanete = $reqplanete->fetch();

$reqstation = $bdg->prepare('SELECT idstation, nomstation, idjoueurstation FROM station WHERE xstation = ? AND	ystation = ? AND universstation = ?');
$reqstation->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte']));
$repstation = $reqstation->fetch();

$minageflotte = minageflotte($_GET['id']);
$souteflotte = souteflotte($_GET['id']);
$quantitetransportee = cargaisonflotte($_GET['id']);
$peutcoloniser = colonisateur($_GET['id']);
$estarme = armement($_GET['id']);
$vitesse = vitesseflotte($_GET['id']);

$reqasteroide = $bda->prepare('SELECT idasteroide , quantite, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');  
// Si on a un champs d'astéroide, formulaire pour embarquer les trucs.
$reqasteroide->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte']));
$repasteroide = $reqasteroide->fetch();

include("hangars/2_debutpage.php");

include("hangars/3_infoflotte.php");

// Inclu aussi les ordres de déchargement face à une planète.
include("hangars/10_gestionsoute.php");

if ($repflotte['universflotte'] > 0)
	{
	$xymax = 5 ; // valeurs maximales de la carte.
	}
else
	{
	$xymax = 20 ; // valeurs maximales de la carte.
	}

if ($repflotte['universflotte'] == 0)
	{
	include("hangars/11_sautencours.php");
	}
else
	{
	include("hangars/12_ordreasteroides.php");

	include("hangars/13_flottesproximite.php");

	include("hangars/14_commercestation.php");

	include("hangars/15_ordresclassiques.php");

	include("hangars/17_faceauneplanete.php");

	include("hangars/20_carte.php");

	include("hangars/25_affichervaisseauflotte.php");
	}
echo '</div></body></html>';