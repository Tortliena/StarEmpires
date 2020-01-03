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

$reponse = $bdd->query('SELECT id FROM utilisateurs ORDER BY id');
while ($donnees = $reponse->fetch())
	{
	// Production des citoyens :
	$compterpop->execute(array($donnees['id'], 1));
	$nbcitoyens = $compterpop->fetch();
	// echo $nbcitoyens[0] . ' citoyens ! <br /> ';
	$prodbiens = $nbcitoyens['nb'] * 5  ;

	// Production des ouvriers :
	$compterpop->execute(array($donnees['id'], 2));
	$nbouvriers = $compterpop->fetch();
	// echo $nbouvriers[0] . ' ouvriers ! <br /> ';
	$prodchantier = $nbouvriers['nb'] * 20  ;

	// Production des chercheurs :
	$compterpop->execute(array($donnees['id'], 3));
	$nbchercheur = $compterpop->fetch();
	// echo $nbouvriers[0] . ' ouvriers ! <br /> ';
	$prodrecherche = $nbchercheur['nb'] * 1  ;

	// consommation de la population :
	$compterpop->execute(array($donnees['id'] , '%'));
	$reponseconsommation = $compterpop->fetch();
	// echo $nbcitoyens[0] . ' citoyens ! <br /> ';
	$consommation = $reponseconsommation['nb'] * 1  ;

	// echo $donnees['id'] . ' id joueur <br /> ';
	$creationvariationdutour->execute(array($donnees['id'], $prodbiens, $prodchantier, $prodrecherche, $consommation));
	}
$reponse->closeCursor();

/*
function add_some_extra5(&$Commentairestour)
{
    $Commentairestour .= '</br> Fin de la croissance des pop';
}
add_some_extra5($Commentairestour);
*/
?>




