<?php

// Toutes les batailles sont actives :
$reqbatailleactive = $bdg->query('UPDATE bataille SET active = 1');

// Recharge des armes :
$reqrechargearmes = $bdg->prepare('UPDATE composantvaisseau SET tirrestant = ? WHERE iditemcomposant = ?');
$reqcomposantinfo = $bdd->prepare('SELECT nbtir, idcomposant FROM composant');
$reqcomposantinfo->execute(); 
while ($repcomposantinfo = $reqcomposantinfo->fetch())
  {
  $reqrechargearmes ->execute(array($repcomposantinfo['nbtir'], $repcomposantinfo['idcomposant'])); 
  }

// récupération des batailles en cours :
$reqbatailleencours = $bdg->prepare('SELECT idbataille, idvaisseauoffensif, idvaisseaudefensif FROM bataille WHERE active = 1 ORDER BY RAND()');
// Sélectionner une arme avec un tir.
$reqselectionnerarme = $bdd->prepare("SELECT cv.idtable, c.degatpartir, cv.tirrestant
  FROM gamer.composantvaisseau cv INNER JOIN composant c
  ON cv.iditemcomposant = c.idcomposant WHERE cv.tirrestant > 0 AND cv.idvaisseaucompo = ? ORDER BY c.degatpartir DESC");

$reqinfopvvaisseau = $bdg->prepare('SELECT HPvaisseau FROM vaisseau WHERE idvaisseau = ?');

// Désactiver bataille en cours :
$reqbatailleactive = $bdg->prepare('UPDATE bataille SET active = 0 WHERE idbataille = ?');

$reqdiminuernbtir = $bdg->prepare("UPDATE composantvaisseau SET tirrestant = tirrestant-1 WHERE idtable = ?");

function gestiondegats($idvaisseau, $nvpv, $idvaisseauoffensif)
	{
	include("../include/BDDconnection.php");

	if ($nvpv < 0)
		{
		$reqinfopvvaisseau = $bdg->prepare('SELECT nomvaisseau, x, y FROM vaisseau WHERE idvaisseau = ?');
		$reqinfopvvaisseau->execute(array($idvaisseau));
		$repinfopvvaisseau = $reqinfopvvaisseau->fetch();

		$textemessage = 'Nous avons perdu le vaisseau ' . $repinfopvvaisseau['nomvaisseau'] . ' en ' . $repinfopvvaisseau['x'] . '-' . $repinfopvvaisseau['y'] . ' lors d\'une bataille spatiale.' ; 
		$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
		$reqmessageinterne->execute(array('Amirauté', $repexplorationexistante['idexplorateur'], 0, 'Perte d\'un vaisseau', $textemessage));

		// Bataille défenseur ou attaquant
		$reqdeletebataille = $bdg->prepare("DELETE FROM bataille WHERE idvaisseauoffensif = ? OR idvaisseaudefensif = ?");
		$reqdeletebataille->execute(array($idvaisseau, $idvaisseau));

		// cargovaisseau
		$reqdeletecargo = $bdg->prepare("DELETE FROM cargovaisseau WHERE idcargovaisseau = ?");
		$reqdeletecargo->execute(array($idvaisseau));

		// composantvaisseau
		$reqdeletecomposant = $bdg->prepare("DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?");
		$reqdeletecomposant->execute(array($idvaisseau));

		// vaisseau
		$reqdeletevaisseau = $bdg->prepare("DELETE FROM vaisseau WHERE idvaisseau = ?");
		$reqdeletevaisseau->execute(array($idvaisseau));

		// ordredeplacement
		$reqsupprimerordreprecedent = $bdg->prepare("DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?");
		$reqsupprimerordreprecedent->execute(array($idvaisseau));
		$reqsupprimerordreprecedent->execute(array($idvaisseauoffensif));
		}
	else
		{
		$reqdiminuerpvvaisseau = $bdg->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
		$reqdiminuerpvvaisseau->execute(array($nvpv, $idvaisseau));
		}
	}

for($a = 1 ; $a != 0 ; )
	{
	$a = 0; // Si on arrive pas à trouver une bataille, alors on arrête.
	$reqbatailleencours->execute(); // Sélectionne une bataille au hasard.
	$repbatailleencours = $reqbatailleencours->fetch();
	if (isset($repbatailleencours[0]))
		{
		$a++;
		echo 'a1</br>';

		// Gestion arme attaque 
		$reqselectionnerarme->execute(array($repbatailleencours['idvaisseauoffensif']));
		$reparmeoffensive = $reqselectionnerarme->fetch();
		echo 'Larme ' . $reparmeoffensive['idtable'] . ' fait ' . $reparmeoffensive['degatpartir'] . ' dégats</br>' ;
		if (isset($reparmeoffensive[0]))
			{
			$reqdiminuernbtir->execute(array($reparmeoffensive['idtable']));

			// On récupère les infos sur le défenseur
			$reqinfopvvaisseau->execute(array($repbatailleencours['idvaisseaudefensif']));
			$repinfopvvaisseau = $reqinfopvvaisseau->fetch();
			echo $repinfopvvaisseau['HPvaisseau'] . 'PV du vaisseau </br>';

			$nouveaupvdef = $repinfopvvaisseau['HPvaisseau'] - $reparmeoffensive['degatpartir'];
			}

		// Gestion arme défense
		$reqselectionnerarme->execute(array($repbatailleencours['idvaisseaudefensif']));
		$reparmedefensive = $reqselectionnerarme->fetch();
		echo 'Larme ' . $reparmedefensive['idtable'] . ' fait ' . $reparmedefensive['degatpartir'] . ' dégats</br>' ; 
		if (isset($reparmedefensive[0]))
			{
			$reqdiminuernbtir->execute(array($reparmedefensive['idtable']));

			// On récupère les infos sur le défenseur
			$reqinfopvvaisseau->execute(array($repbatailleencours['idvaisseauoffensif']));
			$repinfopvvaisseau = $reqinfopvvaisseau->fetch();
			echo $repinfopvvaisseau['HPvaisseau'] . 'PV du vaisseau </br>';

			$nouveaupvoff = $repinfopvvaisseau['HPvaisseau'] - $reparmedefensive['degatpartir'];
			}

		if ($reparmeoffensive['tirrestant'] < 2 AND $reparmedefensive['tirrestant'] < 2)
			{ // Dans le cas ou les deux armes tombent à 0 : 
			$reqbatailleactive->execute(array($repbatailleencours['idbataille']));
			}

		// Gestion dégat sur défenseur
		gestiondegats($repbatailleencours['idvaisseaudefensif'], $nouveaupvdef, $repbatailleencours['idvaisseauoffensif']);
		
		// Gestion dégat sur attaquant
		gestiondegats($repbatailleencours['idvaisseauoffensif'], $nouveaupvoff, $repbatailleencours['idvaisseauoffensif']);
		}
	}
?>