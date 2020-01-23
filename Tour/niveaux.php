<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

// Monter de niveau
$reqlvlup = $bdd->prepare('UPDATE utilisateurs SET lvl = lvl + 1 WHERE id = ?');

// Pour lvl 0 à 1
$reqcountpop = $bdd->prepare('SELECT COUNT(*) AS nb FROM population WHERE joueurpop = ? AND typepop = ?');

// Pour lvl 1 à 2
$reqrechechemoteur = $bdd->prepare('SELECT COUNT(*) AS nb FROM rech_joueur WHERE 
idjoueurrecherche = ? AND rechposs = 1');

// Pour lvl 2 à 3
$reqvaisseausorti = $bdd->prepare('SELECT COUNT(*) AS nb FROM vaisseau WHERE 
idjoueurbat = ? AND x = ?');

// Pour lvl 3 à 4
$reqcompterexplo = $bdd->prepare('SELECT COUNT(*) AS nb FROM explore WHERE idexplorateur = ?') ; 

// Pour lvl 4 à 5
$reqcomptersilo = $bdd->prepare('SELECT COUNT(*) AS nb FROM silo WHERE idjoueursilo = ?');
$reqlimitebaselunaire = $bdd->prepare('UPDATE limitesjoueurs SET maxbaselunaire = ? WHERE id = ?');

// Pour lvl 5 à 6
$reqcountbat = $bdd->prepare('SELECT COUNT(*) AS nb FROM batiments WHERE idjoueurbat = ? AND typebat = ?');

// Créer une recherche :
$prixrech = $bdd->prepare("SELECT prixrecherche FROM recherche WHERE idrecherche = ? ");
$reqcreerrecherche = $bdd->prepare("INSERT INTO rech_joueur(idjoueurrecherche, idrech, rechnesc) VALUES (?,?,?)");

$reqlvl = $bdd->QUERY('SELECT lvl, id from utilisateurs ORDER BY id ASC');
WHILE($replvl = $reqlvl->fetch())
	{
	switch ($replvl['lvl'])
  	{ 
      case 0:
        	$reqcountpop->execute(array($replvl['id'], 2));
        	$repcountouvrier = $reqcountpop->fetch();

          $reqcountpop->execute(array($replvl['id'], 3));
          $repcountscient = $reqcountpop->fetch();

          // Compter les ouvriers et les scientifiques, si au moins 1, alors monter de niveau.
        	if ($repcountouvrier['nb']>0 AND $repcountscient['nb']>0)
        		{
        		$reqlvlup->execute(array($replvl['id']));
            $prixrech->execute(array(4)); // Recherche des moteurs interstellaires.
            $repprixrech = $prixrech->fetch();
            $aleatoirerecherche = rand(100 , 200) ;
            $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
            $reqcreerrecherche->execute(array($replvl['id'], 4, $reelprixrech));
        		}  
      break;
      case 1:
      		$reqrechechemoteur->execute(array($replvl['id']));
        	$reprechechemoteur = $reqrechechemoteur->fetch();
          // Si on a fait la recherche des moteurs interstellaires, alors monter niveau.
        	if ($reprechechemoteur['nb']>0)
        		{
        		$reqlvlup->execute(array($replvl['id']));

            $prixrech->execute(array(3));
            $repprixrech = $prixrech->fetch();
            $aleatoirerecherche = rand(100 , 200) ;
            $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
            $reqcreerrecherche->execute(array($replvl['id'], 3, $reelprixrech));

            $prixrech->execute(array(1));
            $repprixrech = $prixrech->fetch();
            $aleatoirerecherche = rand(100 , 200) ;
            $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
            $reqcreerrecherche->execute(array($replvl['id'], 1, $reelprixrech));
            // Cela donne accès aux centre de recherche et au chantier.
        		}  
      break;
      case 2:
      		$reqvaisseausorti->execute(array($replvl['id'], 3));
        	$repvaisseausorti = $reqvaisseausorti->fetch();
          // Si un vaisseau est dehors, alors on monte de niveau.
        	if ($repvaisseausorti['nb']>0)
        		{
        		$reqlvlup->execute(array($replvl['id']));
        		}  
      break;
      case 3:
          $reqcompterexplo->execute(array($replvl['id']));
          $repcompterexplo = $reqcompterexplo->fetch();
          // Si on a fait au moins 6 exploration, alors on monte de niveau. 6eme explo = planète.
          if ($repcompterexplo['nb']>6)
            {
            $reqlvlup->execute(array($replvl['id']));
            $prixrech->execute(array(2));
            $repprixrech = $prixrech->fetch();
            $aleatoirerecherche = rand(100 , 200) ;
            $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
            $reqcreerrecherche->execute(array($replvl['id'], 2, $reelprixrech));
            }
      break;

      case 4:
          // Pour monter de niveau, il faut ramener quelque chose dans les silos.
          $reqcomptersilo->execute(array($replvl['id']));
          $reqcomptersilo = $reqcomptersilo->fetch();
          if ($reqcomptersilo['nb']>0)
            {
            $reqlvlup->execute(array($replvl['id']));
            
            // Cela permet de construire la première base lunaire.
            $reqlimitebaselunaire->execute(array(1, $replvl['id']));
            
            // Cela donne accès aux moteurs améliorés.
            $prixrech->execute(array(5));
            $repprixrech = $prixrech->fetch();
            $aleatoirerecherche = rand(100 , 200) ;
            $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
            $reqcreerrecherche->execute(array($replvl['id'], 5, $reelprixrech));
            }
      break;

      case 5:
          // Pour monter de niveau, il faut construire une base spatiale.
          $reqcountbat->execute(array($replvl['id'], 4));
          $repcountbat = $reqcountbat->fetch();
          if ($repcountbat['nb']>0)
            {
            $reqlvlup->execute(array($replvl['id']));
            }
      break;
  	}
	}


?>




