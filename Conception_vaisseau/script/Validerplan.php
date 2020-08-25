<?php
session_start();
require __DIR__ . '/../../include/BDDconnection.php';
require __DIR__ . '/../fonction/caracteristiquesvaisseau.php';
require __DIR__ . '/../../function/consommercreeritemsplanetemultiple.php';
require __DIR__ . '/../fonction/structurevaisseau.php';


echo $_SESSION['id'] .' = id du joueur <br>' ;
echo $_POST['idvaisseau'] .' = id vaisseau <br>';

// Cas d'un vaisseau réel : 
$reqvaisseau = $bdg->prepare('	SELECT p.idjoueurplanete, p.idplanete
								FROM vaisseau v
								INNER JOIN flotte f ON v.idflottevaisseau = f.idflotte
								INNER JOIN planete p ON -f.idplaneteflotte = p.idplanete 
								WHERE v.idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));   
$repvaisseau = $reqvaisseau->fetch();

// Cas d'un plan : 
$reqvaisseauplan = $bdg->prepare('SELECT idflottevaisseau FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseauplan->execute(array($_POST['idvaisseau']));   
$repvaisseauplan = $reqvaisseauplan->fetch();

if ($repvaisseau['idjoueurplanete'] != $_SESSION['id'] AND -$repvaisseauplan['idflottevaisseau'] != $_SESSION['id'])   // Vérification du possesseur du vaisseau. Si pas bon = dégage vers l'acceuil.
	{ header("location: ../../accueil.php?message=31"); exit(); }   

list($structure, $structuremax) = structurevaisseau ($_POST['idvaisseau']);
if ($structure > $structuremax)
	{ header("location: ../../accueil.php?message=31"); exit(); }

$reqconstructionencours = $bdg->prepare('SELECT idconst FROM construction WHERE trucaconstruire = ?');
$reqconstructionencours->execute(array(-$_POST['idvaisseau']));   
$repconstructionencours = $reqconstructionencours->fetch();

if (!isset($repconstructionencours['idconst']))
	{ // Si aucune construction lié à ce plan existe, alors on peut le mettre à jour.
	if ($repvaisseau['idjoueurplanete'] == $_SESSION['id'])
		{ // Cas d'un vaisseau réel : Lancer le prod !
		$a = 0;
		$reqverifiertechnologie = $bdg->prepare('SELECT idrechprinc FROM rech_joueur WHERE idjoueurrecherche = ? AND idrech = ? AND rechposs = 1');
		$reqinfoitem = $bdd->prepare('SELECT coutbien, couttitane, itemnecessaire, nomlimite, technescessaire FROM items WHERE iditem = ?'); 
		$reqcreerconstruction = $bdg->prepare('INSERT INTO construction(trucaconstruire, nombre, idplaneteconst, avancementbiens, avancementtitane, prixbiens, prixtitane) VALUES(:trucaconstruire, :nombre, :idplaneteconst, :avancementbiens, :avancementtitane, :prixbiens, :prixtitane)'); 
		$reqcomposantsurlevaisseauactuellement = $bdg->prepare('SELECT COUNT(iditemcomposant) AS nb FROM composantvaisseau WHERE idvaisseaucompo = ? AND iditemcomposant = ?');
		$reqcomposantpresent = $bdg->prepare('SELECT COUNT(c.iditemcomposant) AS nb, c.iditemcomposant, s.quantite FROM composantvaisseau c LEFT JOIN silo s ON s.iditems = c.iditemcomposant AND s.idplanetesilo = ? WHERE c.idvaisseaucompo = ? GROUP BY c.iditemcomposant');
		$reqcomposantpresent->execute(array($repvaisseau['idplanete'], -$_POST['idvaisseau']));
		while($repcomposantpresent = $reqcomposantpresent->fetch())
			{ // Vérification des items présents dans le vaisseau et le silo vs dans le nouveau vaisseau
			$reqinfoitem->execute(array($repcomposantpresent['iditemcomposant']));
		    $repinfoitem = $reqinfoitem->fetch();
			
			$reqcomposantsurlevaisseauactuellement->execute(array($_POST['idvaisseau'], $repcomposantpresent['iditemcomposant']));
			$repcomposantsurlevaisseauactuellement = $reqcomposantsurlevaisseauactuellement->fetch();
			if ($repcomposantpresent['nb'] > $repcomposantpresent['quantite'] + $repcomposantsurlevaisseauactuellement['nb'])
				{ // Si un item est manquant, lancer la prod d'autant qu'il en manque.
				$a++;
				if ($repinfoitem['itemnecessaire']!=0)
		    		{ // Item 'constructible' par recherche.
					header("Location: ../../planete/00_planete.php?message=31&id=" . urlencode($_POST['id']));
				    exit();
				    }

				if ($repinfoitem['technescessaire']!=0)
					{ // Si item a besoin d'une tech, il faut que le joueur la possède.
					$reqverifiertechnologie->execute(array($_SESSION['id'], $repinfoitem['technescessaire']));
					$repverifiertechnologie = $reqverifiertechnologie->fetch();
					if (!isset($repverifiertechnologie['idrechprinc']))
						{
						header("Location: ../../00_planete.php?message=31&id=" . urlencode($_POST['id']));
				    	exit();
				    	}
				    }
				for ($i = 1; $i <= $repcomposantpresent['nb'] - $repcomposantpresent['quantite'] - $repcomposantsurlevaisseauactuellement['nb']; $i++)
					{ // Permet de lancer la prod d'un item manquant
					$reqcreerconstruction->execute(array(
			        'trucaconstruire' => $repcomposantpresent['iditemcomposant'],
			        'nombre' => 1,
			        'idplaneteconst' => $repvaisseau['idplanete'],
			        'avancementbiens' => $repinfoitem['coutbien'],
			        'avancementtitane' => $repinfoitem['couttitane'],
			        'prixbiens' => $repinfoitem['coutbien'],
			        'prixtitane' => $repinfoitem['couttitane']));
			    	}
				}
			if ($a != 0) 
				{ // Il manque des items, donc on lance la prod et on sort de là !
				header("Location: ../../00_planete.php?message=61&id=" . urlencode($repvaisseau['idplanete'])); 
			    exit(); 
			    }
			} // Fin vérification des items présents dans le vaisseau et le silo vs dans le nouveau vaisseau
		
		$coutbien = 0;
		$reqcomposantpresent->execute(array($repvaisseau['idplanete'], -$_POST['idvaisseau']));
		while($repcomposantpresent = $reqcomposantpresent->fetch())
			{ // On refait le tour ici, mais cette fois, tous les composants sont présents.
			$reqcomposantsurlevaisseauactuellement->execute(array($_POST['idvaisseau'], $repcomposantpresent['iditemcomposant']));
			$repcomposantsurlevaisseauactuellement = $reqcomposantsurlevaisseauactuellement->fetch();
			consommercreeritemsplanetemultiple($repcomposantpresent['iditemcomposant'], 0, $repvaisseau['idplanete'], $repcomposantpresent['nb'] - $repcomposantsurlevaisseauactuellement['nb']);
			$coutbien = $coutbien + 20*$repcomposantpresent['nb'] - $repcomposantsurlevaisseauactuellement['nb']; // Nombre d'items ajoutés.
			}

		$reqcreerconstruction = $bdg->prepare('INSERT INTO construction(trucaconstruire, nombre, idplaneteconst, avancementbiens, avancementtitane, prixbiens, prixtitane) VALUES(:trucaconstruire, :nombre, :idplaneteconst, :avancementbiens, :avancementtitane, :prixbiens, :prixtitane)');
		$reqcreerconstruction->execute(array(
			    'trucaconstruire' => -$_POST['idvaisseau'],
			    'nombre' => 1,
			    'idplaneteconst' => $repvaisseau['idplanete'],
			    'avancementbiens' => $coutbien,
			    'avancementtitane' => 0,
			    'prixbiens' => $coutbien,
			    'prixtitane' => 0));

		// Permet de gérer l'ordre de construction.
		$dernierID = $bdg->lastInsertId();
		$reqderniereconst = $bdg->query('SELECT ordredeconstruction FROM construction ORDER BY ordredeconstruction DESC LIMIT 1');
		$repderniereconst = $reqderniereconst ->fetch();
		$reqordredeconstruction = $bdg->prepare('UPDATE construction SET ordredeconstruction = ? WHERE idconst = ?');
		$reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $dernierID));

		$reqmettreflotteazero = $bdg->prepare('UPDATE vaisseau SET idflottevaisseau = 0 WHERE idvaisseau = ?');
		$reqmettreflotteazero->execute(array($_POST['idvaisseau']));
		} // Fin vaisseau réel. Les items nécessaire ont été consommés.
	
	// permet de supprimer le plan actuel :
	$reqsupprimerplanprecedent = $bdg->prepare('DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?');
	$reqsupprimerplanprecedent->execute(array($_POST['idvaisseau']));   

	// Permet d'appliquer le plan préparé :
	$reqappliquerplan = $bdg->prepare('UPDATE composantvaisseau SET idvaisseaucompo = ? WHERE idvaisseaucompo = ?');
	$reqappliquerplan->execute(array($_POST['idvaisseau'], -$_POST['idvaisseau']));

	caracteristiquesvaisseau ($_POST['idvaisseau']);

	if (-$repvaisseauplan['idflottevaisseau'] == $_SESSION['id'])
		{ 
		header("location: ../00_conception.php?message=75&id=" . urlencode($_POST['idvaisseau']));
		exit;
		}
	if ($repvaisseau['idjoueurplanete'] == $_SESSION['id'])
		{
		header("location: ../../planete/00_planete.php?message=32&id=" . urlencode($repvaisseau['idplanete']));
		exit;
		}
	}
else
	{
 	header("location: ../00_conception.php?message=76&id=" . urlencode($_POST['idvaisseau']));
	exit;
	}
header("location: ../../accueil.php?message=31");
?>