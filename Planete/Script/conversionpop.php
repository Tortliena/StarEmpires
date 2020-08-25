<?php 
session_start(); 
require("../../include/BDDconnection.php"); 
 
/*
echo $_SESSION['id'] . '</br>' ;
echo $_POST['combien'] . '</br>';
echo $_POST['popdepart'] . '</br>';
echo $_POST['poparrivee'] . '</br>';
echo $_POST['id'] . '</br>';
echo $_POST['supprimer'] . '</br>';
*/

if ($_POST['supprimer'] == 'oui') 
	{ 
	$reqverif = $bdg->prepare('SELECT idjoueurplanete 
	FROM population po
	INNER JOIN planete pl ON pl.idplanete = po.idplanetepop 
	WHERE idpop = ?'); 
 
	$reqverif->execute(array($_POST['idpop'])); 
	$repverif = $reqverif->fetch(); 
 
	if ($repverif['idjoueurplanete'] != $_SESSION['id']) 
		{ 
		header("location: ../planete.php?message=31&id=" . urlencode($_POST['id'] ."")); 
		exit();	 
		} 
	$req = $bdg->prepare('UPDATE population SET typepoparrivee = 0 WHERE idpop = ?'); 
	$req->execute(array($_POST['idpop'])); 
	header("location: ../00_planete.php?message=60&id=" . urlencode($_POST['id'])); 
	exit(); 
	} 
elseif ($_POST['supprimer'] == 'non') 
	{ 
	$reqbiens = $bdg->prepare('SELECT * FROM planete WHERE idplanete = ?'); 
	$reqbiens->execute(array($_POST['id'])); 
	$quantbiens = $reqbiens->fetch(); 
	if ($quantbiens['idjoueurplanete'] != $_SESSION['id']) 
		{ // Permet de sortir ceux tentant de convertir les pops du voisin. 
		header('Location:../Accueil.php?message=31'); 
  		exit(); 
		}

	// Compter nombre de pop qui peuvent se transformer (bonne pop de départ et pas de pop d'arrivée) 
	$reqcompterpop  = $bdg->prepare('SELECT COUNT(*) as pop FROM population WHERE idplanetepop = ? AND typepop = ? AND typepoparrivee = 0'); 
	$reqcompterpop ->execute(array($_POST['id'], $_POST['popdepart']));   
	$repcompterpop = $reqcompterpop->fetch(); 
 
	$req = $bdg->prepare('UPDATE population SET typepoparrivee = ? WHERE idplanetepop = ? AND typepop = ? AND typepoparrivee = 0 LIMIT 1'); 
	$a = $_POST['combien'];  
 
	$reqnompop = $bdd->prepare('SELECT nompop, prixchangementpop from typepop WHERE idtypepop = ?'); 

	if ($_POST['popdepart'] == $_POST['poparrivee']) 
		{ // Cas ou l'on tente de convertir un ouvrier en ouvrier par exemple.  
		header("Location: ../00_planete.php?message=24&id=" . urlencode($_POST['id'])); 
	    exit(); 
		}  
	if ($_POST['combien'] <= 0 OR $_POST['combien'] > $repcompterpop['pop']) 
	    { // Pas bonne quantité. Soit nombre négatif, soit nombre plus grand que ce que l'on peut faire. 
		header("Location: ../00_planete.php?message=9&id=" . urlencode($_POST['id'])); 
	    exit(); 
	    }

	if (in_array($_POST['poparrivee'], array(2,3,4))) // permet de limiter aux pop avec des limites. 
		{ 
		//Compter le nombre de pop de destination  
		$reqcompterdestination = $bdg->prepare('SELECT COUNT(*) as pop FROM population WHERE idplanetepop = ? AND typepop = ?'); 
		$reqcompterdestination ->execute(array($_POST['id'], $_POST['poparrivee']));   
		$repcompterdestination = $reqcompterdestination->fetch(); 
 
		//Compter le nombre de pop actuellement en cours de transfo vers cette destination. 
		$reqcompterencoursdetransfo  = $bdg->prepare('SELECT COUNT(*) as pop FROM population WHERE idplanetepop = ? AND typepoparrivee = ?'); 
		$reqcompterencoursdetransfo ->execute(array($_POST['id'], $_POST['poparrivee']));   
		$repcompterencoursdetransfo = $reqcompterencoursdetransfo->fetch(); 
 
		// Récupérer la limite associée à cette pop. 
		if ($_POST['poparrivee'] == 2) 
			{ 
			$reqlimitepop = $bdg->prepare('SELECT ouvriermax FROM limiteplanete WHERE idlimiteplanete = ?'); 
			} 
		elseif($_POST['poparrivee'] == 3)
			{
			$reqlimitepop = $bdg->prepare('SELECT scientmax FROM limiteplanete WHERE idlimiteplanete = ?'); 
			}
		elseif($_POST['poparrivee'] == 4)
			{ 
			$reqlimitepop = $bdg->prepare('SELECT soldatmax FROM limiteplanete WHERE idlimiteplanete = ?'); 
			} 
		$reqlimitepop->execute(array($_POST['id'])); 
		$replimitepop = $reqlimitepop->fetch(); 

		if ($repcompterdestination['pop'] + $repcompterencoursdetransfo['pop'] + $_POST['combien'] > $replimitepop[0]) 
			{ 
			$_SESSION['message1'] = $replimitepop[0] ;  
			header("Location: ../00_planete.php?message=30&id=" . urlencode($_POST['id'])); 
		    exit();
			}
		}

	$reqnompop->execute(array($_POST['popdepart']));
	$nompopdepart = $reqnompop->fetch();

	$reqnompop->execute(array($_POST['poparrivee']));
	$nompoparrivee = $reqnompop->fetch();

	$_SESSION['message4'] = $a * $nompoparrivee['prixchangementpop'];

	do
		{
		$req->execute(array($_POST['poparrivee'], $_POST['id'], $_POST['popdepart']));
	    $a--;
		}
	while($a > 0);

	$_SESSION['message1'] = $_POST['combien'];
	$_SESSION['message2'] = $nompopdepart['nompop'];
	$_SESSION['message3'] = $nompoparrivee['nompop'];

	header("location: ../00_planete.php?message=10&id=" . urlencode($_POST['id']));
	exit();
	}
header("location: ../00_planete.php?message=31&id=" . urlencode($_POST['id']));
?>