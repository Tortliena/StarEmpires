<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

// 
/* function ajcomproddutourdebut(&$Commentairestour)
{
    $Commentairestour .= '</br> Début des prods du tour.';
}
ajcomproddutourdebut($Commentairestour);
*/

// Permet de gérer les joueurs un par un.
// Ajouter une valeur 'pause' sur les joueurs pour leur désactiver la pause ?

$compterpop = $bdd->prepare('SELECT COUNT(*) AS nb FROM population WHERE joueurpop = ? and typepop like ?');
$creationvariationdutour = $bdd->prepare('INSERT INTO variationstour (idjoueur, prodbiens, chantier, recherche, consobiens) VALUES (?, ?, ?, ?, ?)');

$reqjoueur = $bdd->query('SELECT id, lvl FROM utilisateurs ORDER BY id');
while ($repjoueur = $reqjoueur->fetch())
	{
	// Production des citoyens :
	$compterpop->execute(array($repjoueur['id'], 1));
	$nbcitoyens = $compterpop->fetch();
	$prodbiens = $nbcitoyens['nb'] * 5  ;

	// Production des ouvriers :
	$compterpop->execute(array($repjoueur['id'], 2));
	$nbouvriers = $compterpop->fetch();
	$prodchantier = $nbouvriers['nb'] * 20  ;

	// Production de recherche :
	if ($repjoueur['lvl']==0) // Si niveau 0 (donc pas de chercheur et de recherche) alors 1 pt de recherche
		{$prodrecherche = 1;}
	else
		{ // Sinon prod dep du nb de chercheurs.
	$compterpop->execute(array($repjoueur['id'], 3));
	$nbchercheur = $compterpop->fetch();
	$prodrecherche = $nbchercheur['nb'] * 1  ;
		}

	// consommation de la population :
	$compterpop->execute(array($repjoueur['id'] , '%'));
	$reponseconsommation = $compterpop->fetch();
	$consommation = $reponseconsommation['nb'] * 1  ;

	$creationvariationdutour->execute(array($repjoueur['id'], $prodbiens, $prodchantier, $prodrecherche, $consommation));
	}
$reqjoueur->closeCursor();

/*
function add_some_extra5(&$Commentairestour)
{
    $Commentairestour .= '</br> Fin de la croissance des pop';
}
add_some_extra5($Commentairestour);
*/
?>




