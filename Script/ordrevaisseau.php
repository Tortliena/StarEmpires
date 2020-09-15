<?php
session_start();
require __DIR__ . '/../include/bddconnection.php';

/*
echo $_SESSION['id'] .' id du joueur <br>' ;
echo $_POST['idvaisseau'] .' = id vaisseau <br>';
echo $_POST['idplanete'] .' = id planete <br>';
echo $_POST['idflotte'] .' = id de la flotte (0 = création d\'une flotte ou réparation) <br>';
echo $_POST['mouvement'] .' avec 1 = envoyer en orbite, 2 créer une flotte, 3 envoyer sur planète, 4 réparer depuis planète, 5 réparer depuis flotte.'; 
*/

$reqflotteenorbite = $bd->prepare('SELECT nomflotte FROM c_flotte
									WHERE idplaneteflotte = ? AND universflotte = ? AND xflotte = ? AND yflotte = ? AND idflotte = ?'); 
$reqcreerflotte = $bd->prepare('INSERT INTO c_flotte(idplaneteflotte, universflotte, xflotte, yflotte, nomflotte, typeordre)
								VALUES (?, ?, ?, ?, ?, ?);');

$reqvaisseau = $bd->prepare('	SELECT f.idplaneteflotte, v.HPmaxvaisseau, v.HPvaisseau, v.biensvaisseau, v.titanevaisseau
								FROM c_vaisseau v
								INNER JOIN c_flotte f ON v.idflottevaisseau = f.idflotte
								WHERE v.idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));   
$repvaisseau = $reqvaisseau->fetch();   

$idplanete = abs($repvaisseau['idplaneteflotte']);  // Permet de gérer les cas ou la flotte est dans une flotte de défense.
$reqplanete = $bd->prepare('	SELECT idjoueurplanete, universplanete, xplanete, yplanete, idplanete
								FROM c_planete WHERE idplanete = ?');
$reqplanete->execute(array($idplanete));   
$repplanete = $reqplanete->fetch();

if ($repplanete['idjoueurplanete'] != $_SESSION['id'])   // Vérification du possesseur du vaisseau. Si pas bon = dégage vers l'acceuil.
	{ header("location: /accueil.php?message=31"); exit();}

if ($_POST['idplanete'] != $idplanete)   // Vérification que la planète entrée est la bonne.
	{ header("location: /accueil.php?message=31"); exit();}
if (in_array($_POST['mouvement'], array(1, 3, 5)))
	{
	// Vérifier que la flotte est bel et bien en orbite de la planète : 
	$reqflotteenorbite->execute(array($_POST['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], $_POST['idflotte'])); 
	$repflotteenorbite = $reqflotteenorbite->fetch(); 
	if (!isset($repflotteenorbite['nomflotte']))
		{ header("location: /accueil.php?message=31"); exit();}	
	}

if ($_POST['mouvement'] == 1)
	{// rejoindre une flotte
	$idmessage = 69;
	$idflotte = $_POST['idflotte'];
	}
elseif ($_POST['mouvement'] == 2)
	{ // Créer la flotte qui va acceuillir le vaisseau.
	$reqcreerflotte->execute(array($repplanete['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], 'nouvelleflotte', 0));
	$_POST['idflotte'] = $bd->lastInsertId();
	$idflotte = $_POST['idflotte'];
	$idmessage = 68; 
	}
elseif ($_POST['mouvement'] == 3)
	{ // Rejoindre la planète
	// récupérer l'ID de la flotte en orbite autour de la planète, éventuellement la créer. 
	$reqflotteendefense = $bd->prepare("SELECT idflotte FROM c_flotte WHERE idplaneteflotte = ?") ;
	$reqflotteendefense->execute(array(-$_POST['idplanete'])); 
	$repflotteendefense = $reqflotteendefense->fetch();

	if (!isset($repflotteendefense['idflotte']))
		{
		$reqcreerflotte->execute(array(-$repplanete['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], 'nouvelleflotte', 0));
		$idflotte = $bd->lastInsertId();
		}
	else
		{
		$idflotte = $repflotteendefense['idflotte'];
		}
	$idmessage = 70;
	}
elseif ($_POST['mouvement'] == 4 OR $_POST['mouvement'] == 5)
	{ // réparer vaisseau, 4 = depuis la planète, 5 = depuis une flotte.
	if ($_POST['mouvement'] == 4)
        { 
        $idflotte = -$_POST['idplanete'] ; // Permet de rediriger vers la planète à la fin.
        }
    else
    	{ 
        $idflotte = 0 ; // On reste sur la page de la flotte.
        }
	if($repvaisseau['HPvaisseau'] == $repvaisseau['HPmaxvaisseau']) 
        { // Le vaisseau est full HP ! 
        $idmessage = 37; 
        }
    else
    	{ 
        $idflottevaisseau = 0;
        $idmessage = 44;
        $trucaconstruire = -$_POST['idvaisseau']; 

	    // Gestion des réparations et des rénovations avec les constructions : 
        // Calculer le prix de réparation avec les dégats. 
        $prixbienreparation = ROUND($repvaisseau['biensvaisseau']*(1 - $repvaisseau['HPvaisseau']/$repvaisseau['HPmaxvaisseau'])/2 
            + ($repvaisseau['HPmaxvaisseau']-$repvaisseau['HPvaisseau'])*10);
        $prixtitanereparation = ROUND($repvaisseau['titanevaisseau']*(1 - $repvaisseau['HPvaisseau']/$repvaisseau['HPmaxvaisseau'])/2); 
        
        // Requete pour gérer l'ordre des constructions. 
        $reqderniereconst = $bd->query('SELECT ordredeconstruction FROM c_construction ORDER BY ordredeconstruction DESC LIMIT 1'); 
        $repderniereconst = $reqderniereconst ->fetch(); 

        // Insérer construction/prix 
        $reqcreerconstruction = $bd->prepare('INSERT INTO c_construction(trucaconstruire, nombre, idplaneteconst, avancementbiens, avancementtitane, prixbiens, prixtitane, ordredeconstruction) 
            								VALUES(?, ?, ?, ?, ?, ?, ?, ?)'); 
        $reqcreerconstruction->execute(array($trucaconstruire, 1, $_POST['idplanete'], $prixbienreparation, $prixtitanereparation, $prixbienreparation, $prixtitanereparation, $repderniereconst['ordredeconstruction']+1)); 
 
        $dernierID = $bd->lastInsertId(); 
        }
	}

if (isset($idmessage) AND isset($idflotte))
	{
	$requpdatevaisseau = $bd->prepare('UPDATE c_vaisseau SET idflottevaisseau = ? WHERE idvaisseau = ?');
	if ($idflotte > 0 OR $_POST['mouvement'] == 5) // Vaisseau dans une flotte et avec ordre de réparation. Si inf à zéro, alors vaisseau sur planète.
		{
		$requpdatevaisseau->execute(array($idflotte, $_POST['idvaisseau']));
		header("location: /hangars/hangars.php?message=".urlencode($idmessage)."&id=" . urlencode($_POST['idflotte']));
		}
	else
		{
		$requpdatevaisseau->execute(array(0, $_POST['idvaisseau']));
		header("location: /planete/planete.php?message=".urlencode($idmessage)."&id=" . urlencode(-$idflotte));
		}
	exit();
	}
	
header("location: /accueil.php?message=31");
?>