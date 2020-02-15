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
  ON cv.iditemcomposant = c.idcomposant WHERE cv.tirrestant > 0 AND cv.idvaisseaucompo = ? ORDER BY c.degatpartir DESC LIMIT 1");

$reqinfopvvaisseau = $bdg->prepare('SELECT HPvaisseau FROM vaisseau WHERE idvaisseau = ?');

// Désactiver bataille en cours :
$reqbatailleactive = $bdg->prepare('UPDATE bataille SET active = 0 WHERE idbataille = ?');

$reqdiminuernbtir = $bdg->prepare("UPDATE composantvaisseau SET tirrestant = tirrestant-1 WHERE idtable = ?");

function gestiondegats($idvaisseau, $pvvaisseau, $degatdutir, $idarme, $idvaisseauoffensif)
	{
	include("../include/BDDconnection.php");

	$reqdiminuernbtir = $bdg->prepare("UPDATE composantvaisseau SET tirrestant = tirrestant-1 WHERE idtable = ?");
	$reqdiminuernbtir->execute(array($idarme));

	$nvpv = $pvvaisseau - $degatdutir;

	if ($nvpv < 0)
		{
		$reqinfopvvaisseau = $bdg->prepare('
			SELECT nomvaisseau, x, y, univers, idjoueurbat, biensvaisseau, titanevaisseau
			FROM vaisseau WHERE idvaisseau = ?');
		$reqinfopvvaisseau->execute(array($idvaisseau));
		$repinfopvvaisseau = $reqinfopvvaisseau->fetch();

		if ($repinfopvvaisseau['idjoueurbat'] != 0)
			{ // Problème avec les vaisseaux bot ici !
			$textemessage = 'Nous avons perdu le vaisseau ' . $repinfopvvaisseau['nomvaisseau'] . ' en ' . $repinfopvvaisseau['x'] . '-' . $repinfopvvaisseau['y'] . ' lors d\'une bataille spatiale.' ; 
			$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
			$reqmessageinterne->execute(array('Amirauté', $repinfopvvaisseau['idjoueurbat'], 0, 'Perte d\'un vaisseau', $textemessage));
			}

		// Créer champs d'astéroides : Reprendre le prix du vaisseau
		$nbchampsastebien = floor(($repinfopvvaisseau['biensvaisseau'] / 150));
		$nbchampsastetitane = floor(($repinfopvvaisseau['titanevaisseau'] / 30));

		$reqcreerasteroides = $bda->prepare('INSERT INTO champsasteroides (xaste , yaste , uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)');
		if ($nbchampsastebien > 0)
			{
			$reqcreerasteroides->execute(array($repinfopvvaisseau['x'], $repinfopvvaisseau['y'], $repinfopvvaisseau['univers'], 6, $nbchampsastebien));
			}
		if ($nbchampsastetitane > 0)
			{
			$reqcreerasteroides->execute(array($repinfopvvaisseau['x'], $repinfopvvaisseau['y'], $repinfopvvaisseau['univers'], 8, $nbchampsastetitane));
			}		

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
	// echo $repbatailleencours['idbataille'] . 'id de la bataille</br>';
	if (isset($repbatailleencours[0]))
		{
		$a++;
		$reparmeoffensive['degatpartir'] = 0 ;
		$reparmedefensive['degatpartir'] = 0 ;

		// On récupère les infos sur le défenseur (dont ses PV)
		$reqinfopvvaisseau->execute(array($repbatailleencours['idvaisseaudefensif']));
		$repinfopvvaisseaudefensif = $reqinfopvvaisseau->fetch();
		// echo $repinfopvvaisseaudefensif['HPvaisseau'] . 'PV du vaisseau defenseur avant tir</br>';

		// Gestion arme attaque. On prend l'arme la plus puissante avec encore un tir.
		$reqselectionnerarme->execute(array($repbatailleencours['idvaisseauoffensif']));
		$reparmeoffensive = $reqselectionnerarme->fetch();
		// echo 'Larme du attaquant ' . $reparmeoffensive['idtable'] . ' fait ' . $reparmeoffensive['degatpartir'] . ' dégats</br>' ;

		// On récupère les infos sur l'attaquant (dont ses PV)
		$reqinfopvvaisseau->execute(array($repbatailleencours['idvaisseauoffensif']));
		$repinfopvvaisseauattaquant = $reqinfopvvaisseau->fetch();
		// echo $repinfopvvaisseauattaquant['HPvaisseau'] . 'PV du vaisseau attaquant avant tir</br>';

		// Gestion arme defenseur. On prend l'arme la plus puissante avec encore un tir.
		$reqselectionnerarme->execute(array($repbatailleencours['idvaisseaudefensif']));
		$reparmedefensive = $reqselectionnerarme->fetch();
		// echo 'Larme du défenseur ' . $reparmedefensive['idtable'] . ' fait ' . $reparmedefensive['degatpartir'] . ' dégats</br>' ; 
		
		// Si les deux dernières requetes ne donnent aucune réponse : 
		if (!isset($reparmeoffensive['tirrestant']) AND !isset($reparmedefensive['tirrestant']))
			{ // On désactive la bataille.
			$reqbatailleactive->execute(array($repbatailleencours['idbataille']));
			goto a;
			}

		if (isset($reparmeoffensive[0]))
			{ // Si on a une arme de l'attaquant, on gère le tir sur le défenseur.
			gestiondegats($repbatailleencours['idvaisseaudefensif'], $repinfopvvaisseaudefensif['HPvaisseau'], $reparmeoffensive['degatpartir'], $reparmeoffensive['idtable'], $repbatailleencours['idvaisseauoffensif']);
			}

		if (isset($reparmedefensive[0]))
			{ // Si on a une arme du défenseur, on gère le tir sur l'attaquant.
			gestiondegats($repbatailleencours['idvaisseauoffensif'], $repinfopvvaisseauattaquant['HPvaisseau'], $reparmedefensive['degatpartir'], $reparmedefensive['idtable'], $repbatailleencours['idvaisseauoffensif']);
			}
		a:
		}
	}
?>