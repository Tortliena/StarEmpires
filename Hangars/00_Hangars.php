<?php
include("1_entete.php");

$reqflotte = $bdg->prepare('SELECT * FROM flotte WHERE idflotte = ?');
$reqflotte->execute(array($_GET['id']));
$repflotte = $reqflotte->fetch();

$reqplanete = $bdg->prepare('SELECT * FROM planete WHERE idplanete = ?');
$reqplanete->execute(array($repflotte['idplaneteflotte']));
$repplanete = $reqplanete->fetch();

$reqplanete2 = $bdg->prepare('SELECT * FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? LIMIT 1');
$reqplanete2->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte']));
$repplanete2 = $reqplanete2->fetch();

$reqdect = $bdg->prepare('SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? LIMIT 1');
if (isset($_GET['x']))
	{
	$reqdect->execute(array($_GET['x'], $_GET['y'], $repflotte['universflotte'], $_SESSION['id']));
	}
$repdect = $reqdect->fetch();

if (isset($_GET['x']))
	{
	$reqplanete2->execute(array($_GET['x'], $_GET['y'], $repflotte['universflotte']));
	}
else
	{
	$reqplanete2->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte']));
	}
$repplanete3 = $reqplanete2->fetch();

$reqstation = $bdg->prepare('SELECT idstation, nomstation, idjoueurstation FROM station WHERE xstation = ? AND	ystation = ? AND universstation = ?');
if (!isset($_GET['x']))
	{
	$reqstation->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte']));
	}
else
	{
	$reqstation->execute(array($_GET['x'], $_GET['y'], $repflotte['universflotte']));
	}
$repstation = $reqstation->fetch();

$reqasteroide = $bda->prepare('SELECT SUM(quantite) AS nb, idasteroide, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ?');  
if (!isset($_GET['x']))
	{
	$reqasteroide->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte']));
	}
else
	{
	$reqasteroide->execute(array($_GET['x'], $_GET['y'], $repflotte['universflotte']));
	}
$repasteroide = $reqasteroide->fetch();

$minageflotte = minageflotte($_GET['id']);
$souteflotte = souteflotte($_GET['id']);
$quantitetransportee = cargaisonflotte($_GET['id']);
$peutcoloniser = colonisateur($_GET['id']);
$estarme = armement($_GET['id']);
$vitesse = vitesseflotte($_GET['id']);

include("2_debutpage.php");

include("3_infoflotte.php");

// Inclu aussi les ordres de déchargement face à une planète.
include("10_gestionsoute.php");

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
	include("11_sautencours.php");
	}
else
	{
	include("12_ordreasteroides.php");

	include("13_flottesproximite.php");

	include("14_commercestation.php");

	include("15_ordresclassiques.php");

	if (isset($_GET['x']))
		{ // Formulaire pour donner un ordre de déplacement.   
		formulaireordredeplacement(6, $_GET['id'], 0, $_GET['x'], $_GET['y'], $xymax);
		}

	include("17_faceauneplanete.php");

	include("20_carte.php");

	include("25_affichervaisseauflotte.php");
	}

include("30_rapportdecombat.php");

echo '</div></body></html>';