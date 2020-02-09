<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

// Monter de niveau
$reqlvlup = $bdg->prepare('UPDATE utilisateurs SET lvl = lvl + 1 WHERE id = ?');

// Pour lvl 0 à 1
$reqcountpop = $bdg->prepare('SELECT COUNT(*) AS nb FROM population WHERE joueurpop = ? AND typepop = ?');

// Pour lvl 1 à 2
$reqrechechemoteur = $bdg->prepare('SELECT COUNT(*) AS nb FROM rech_joueur WHERE 
idjoueurrecherche = ? AND rechposs = 1');

// Pour lvl 2 à 3
$reqvaisseausorti = $bdg->prepare('SELECT COUNT(*) AS nb FROM vaisseau WHERE 
idjoueurbat = ? AND x = ?');

// Pour lvl 3 à 4
$reqcompterexplo = $bdg->prepare('SELECT COUNT(*) AS nb FROM explore WHERE idexplorateur = ?') ; 

// Pour lvl 4 à 5
$reqcomptersilo = $bdg->prepare('SELECT COUNT(*) AS nb FROM silo WHERE idjoueursilo = ?');
$reqlimitebaselunaire = $bdg->prepare('UPDATE limitesjoueurs SET maxbaselunaire = ? WHERE id = ?');

// Pour lvl 5 à 6
$reqcountbat = $bdg->prepare('SELECT COUNT(*) AS nb FROM batiments WHERE idjoueurbat = ? AND typebat = ?');

// Pour lvl 6 à 7
$reqcomposantsurlevaisseau = $bdg->prepare("SELECT COUNT(*) AS nb 
      FROM gamer.composantvaisseau c
      INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucompo
      WHERE v.idjoueurbat = ?");

// Pour lvl 7 à 8
// Permet de repérer un vaisseau sans tous ses PV ! Problème si le vaisseau se fait détruire ?
$reqvaisseau = $bdg->prepare("SELECT idvaisseau FROM vaisseau WHERE HPmaxvaisseau <> HPvaisseau AND idjoueurbat = ?");

// Fonction permettant de créer une recherche :
function creerrecherche($idrecherche, $idjoueur)
	{
	include("../include/BDDconnection.php");
  
  $reqrechercheexistedeja = $bdg->prepare('SELECT COUNT(*) AS nb FROM rech_joueur WHERE idrech = ? AND idjoueurrecherche = ?');
  $reqrechercheexistedeja->execute(array($idrecherche, $idjoueur));
  $reprechercheexistedeja = $reqrechercheexistedeja->fetch();
  if ($reprechercheexistedeja['nb'] == 0)
    {
  	$prixrech = $bdd->prepare("SELECT prixrecherche FROM recherche WHERE idrecherche = ? ");
  	$reqcreerrecherche = $bdg->prepare("INSERT INTO rech_joueur(idjoueurrecherche, idrech, rechnesc) VALUES (?,?,?)");	
      $prixrech->execute(array($idrecherche));
      $repprixrech = $prixrech->fetch();
      $aleatoirerecherche = rand(100 , 200) ;
      $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
      $reqcreerrecherche->execute(array($idjoueur, $idrecherche, $reelprixrech));
    }
  }
// À utiliser :  creerrecherche( X (= num recherche) , $replvl['id']); 


$reqlvl = $bdg->QUERY('SELECT lvl, id from utilisateurs ORDER BY id ASC');
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
	            
	            // Recherche des moteurs interstellaires.
	            creerrecherche(4, $replvl['id']); 
        		}  
      break;
      case 1:
      		$reqrechechemoteur->execute(array($replvl['id']));
        	$reprechechemoteur = $reqrechechemoteur->fetch();
          	// Si on a fait la recherche des moteurs interstellaires, alors monter niveau.
        	if ($reprechechemoteur['nb']>0)
        		{
        		$reqlvlup->execute(array($replvl['id']));

        		// Cela donne accès aux centre de recherche et au chantier.
        		creerrecherche(3, $replvl['id']);
        		creerrecherche(1, $replvl['id']);
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

	            // Donner accès à la recherche sur les bases lunaires.
	            creerrecherche(2, $replvl['id']);
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
	            creerrecherche(5, $replvl['id']);

	            // Cela donne accès aux soutes.
   	          creerrecherche(7, $replvl['id']);
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
      case 6:
            // Pour monter de niveau, il équiper un composant.
            $reqcomposantsurlevaisseau->execute(array($replvl['id']));
            $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();
            if ($repcomposantsurlevaisseau['nb']>0)
              {
              $reqlvlup->execute(array($replvl['id']));

              // Cela donne accès aux lasers miniers.
              creerrecherche(6, $replvl['id']);
              }
      break;
      case 7:
            // Pour monter de niveau, il faut avoir perdu des points de vie d'un vaisseau.
            $reqvaisseau->execute(array($replvl['id']));
            $repvaisseau = $reqvaisseau->fetch();
            if (isset($repvaisseau['idvaisseau']))
              {
              $reqlvlup->execute(array($replvl['id']));

              // Cela donne accès aux lasers miniers.
              creerrecherche(10, $replvl['id']);

              // Cela donne accès aux lasers miniers.
              creerrecherche(11, $replvl['id']);
              }
      break;
  	}
	}
?>