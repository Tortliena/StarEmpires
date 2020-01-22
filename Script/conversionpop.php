<?php
session_start();
include("BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['combien'] . '</br>';
echo $_POST['popdepart'] . '</br>';
echo $_POST['poparrivee'] . '</br>';
*/

// Compter nombre de ouvrier et de citoyens
$reqcompterpop  = $bdd->prepare('SELECT COUNT(*) as pop FROM population WHERE joueurpop= ? AND typepop = ? AND typepoparrivee = "rien"');
$reqcompterpop ->execute(array($_SESSION['id'], $_POST['popdepart']));  
$repcompterpop = $reqcompterpop->fetch();

$req = $bdd->prepare('UPDATE population SET typepoparrivee = ? WHERE joueurpop = ? AND typepop = ? AND typepoparrivee = 0 LIMIT 1');
$a = $_POST['combien']; 

$reqnompop = $bdd->prepare('SELECT nompop, prixchangementpop from typepop WHERE idtypepop = ?');

$reqbiens = $bdd->prepare('SELECT biens, titane FROM utilisateurs WHERE id= ?');
$reqbiens->execute(array($_SESSION['id']));
$quantbiens = $reqbiens->fetch();

if ($_POST['combien'] <= 0 OR $_POST['combien'] > $repcompterpop['pop'])
    {
	header('Location: ../capitale.php?message=9');
    exit();
    }
if ($_POST['popdepart'] == $_POST['poparrivee'])
	{
	header('Location: ../capitale.php?message=24');
    exit();
	}

if (in_array($_POST['poparrivee'], array(2,3))) // permet de limiter aux pop avec des limites.
	{
	//Compter le nombre de pop de destination 
	$reqcompterdestination = $bdd->prepare('SELECT COUNT(*) as pop FROM population WHERE joueurpop= ? AND typepop = ?');
	$reqcompterdestination ->execute(array($_SESSION['id'], $_POST['poparrivee']));  
	$repcompterdestination = $reqcompterdestination->fetch();

	//Compter le nombre de pop actuellement en cours de transfo vers cette destination.
	$reqcompterencoursdetransfo  = $bdd->prepare('SELECT COUNT(*) as pop FROM population WHERE joueurpop= ? AND typepoparrivee = ?');
	$reqcompterencoursdetransfo ->execute(array($_SESSION['id'], $_POST['poparrivee']));  
	$repcompterencoursdetransfo = $reqcompterencoursdetransfo->fetch();

	// Récupérer la limite associée à cette pop.
	if ($_POST['poparrivee'] == 2)
		{
		$reqlimitepop = $bdd->prepare('SELECT ouvriermax FROM limitesjoueurs WHERE id= ?');
		}
	elseif($_POST['poparrivee'] == 3)
		{
		$reqlimitepop = $bdd->prepare('SELECT scientmax FROM limitesjoueurs WHERE id= ?');
		}
	$reqlimitepop->execute(array($_SESSION['id']));
	$replimitepop = $reqlimitepop->fetch();

	if ($repcompterdestination['pop'] + $repcompterencoursdetransfo['pop'] + $_POST['combien'] > $replimitepop[0])
		{
		$_SESSION['message1'] = $replimitepop[0] ; 
		header('Location: ../capitale.php?message=30');
	    exit();
		}	
	}

$reqnompop->execute(array($_POST['popdepart']));
$nompopdepart = $reqnompop->fetch();

$reqnompop->execute(array($_POST['poparrivee']));
$nompoparrivee = $reqnompop->fetch();

$_SESSION['message4'] = $a * $nompoparrivee['prixchangementpop'] ; 

do { $req->execute(array($_POST['poparrivee'], $_SESSION['id'], $_POST['popdepart']));
    $a--; }
while($a > 0);


$_SESSION['message1'] = $_POST['combien'];
$_SESSION['message2'] = $nompopdepart['nompop'];
$_SESSION['message3'] = $nompoparrivee['nompop'];

header('Location: ../capitale.php?message=10');
?>