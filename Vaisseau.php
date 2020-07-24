<?php   
session_start();   
if (!$_SESSION['pseudo'])   
  {   
  header('Location: Accueil.php');   
  exit();   
  }   
include("include/BDDconnection.php");   
?>   
<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="style.css" /><title>Mon super site</title></head>   
   
<body><?php include("include/menu.php");    

$reqvaisseau = $bdg->prepare('SELECT * FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseau->execute(array($_GET['id']));
$repvaisseau = $reqvaisseau->fetch();

// chercher info sur la flotte du vaisseau :
$reqinfoflotte = $bdg->prepare('SELECT idplaneteflotte FROM flotte WHERE idflotte = ?');
$reqinfoflotte->execute(array($repvaisseau['idflottevaisseau']));   
$repinfoflotte = $reqinfoflotte->fetch();

// On prend la valeur absolue car si valeur négative, cela veut dire que la flotte est défensive/en orbite.
$idplanete = abs($repinfoflotte['idplaneteflotte']) ; 

$reqinfoplanete = $bdg->prepare('SELECT idjoueurplanete FROM planete WHERE idplanete = ?');
$reqinfoplanete->execute(array($idplanete));   
$repinfoplanete = $reqinfoplanete->fetch();

if ($repinfoplanete['idjoueurplanete'] != $_SESSION['id'])
	{ header('Location: Accueil.php'); exit(); }   
  
?>   
<div class="corps">   
<form method="post" action="script/renommer.php"><h1>Vaisseau : <?php echo $repvaisseau['nomvaisseau'] ;?>    
<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />   
<input name="id" type="hidden" value="<?php echo $_GET['id'] ;?>">   
<input name="type" type="hidden" value="vaisseau">   
<input type="submit" value="Renommer"/></h1></form>   
   
<?php   
include("include/message.php");   
$typemessage = 'vaisseau' ;   
include("include/resume.php");   
include("function/fonctionconception.php");
include("function/fonctionvaisseau.php");   


descriptioncompletevaisseau($_GET['id'], $_SESSION['id'], $replvl['lvl']); 

$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.   
echo '<p>';
$reqverifcargo = $bdg->prepare("SELECT c.quantiteitems , i.nombatiment   
                FROM cargovaisseau c   
                INNER JOIN datawebsite.items i   
                ON i.iditem = c.typeitems   
                WHERE idvaisseaucargo = ?") ;   
$reqverifcargo ->execute(array($_GET['id']));   
while ($repverifcargo  = $reqverifcargo ->fetch())   
  {   
  if ($a == 0)   
    {   
    $texteexplication = 'Ce vaisseau transporte ';   
    }   
  else   
    { // Permet de gérer les cas avec de multiples items dans les soutes.   
    $texteexplication .= ', ';   
    }   
  // Affiche ce qui est dans le cargo.   
  $texteexplication .= $repverifcargo['quantiteitems'].' '.$repverifcargo['nombatiment'] ;   

  $a = $a + $repverifcargo['quantiteitems'];   
  } 
if ($a != 0)   
    {   
    echo $texteexplication.'. ' ;   
    }

if ($replvl['lvl']>=3)   
    {   
    echo ' Total soute : ' . $a . '/' . $repvaisseau['capacitedesoute'];   
    }
echo '.</p>'; 

if ($replvl['lvl']>=5)   
  {   
  $PourcentHP = $repvaisseau['HPvaisseau'] / $repvaisseau['HPmaxvaisseau'] * 100 ;   
  echo '<p>PV : ' . number_format($PourcentHP, 0) . '%';    
  }   

if ($repinfoflotte['idplaneteflotte']<0) // Pouvoir faire une modification d'un vaisseau uniquement s'il est dans une flotte de défense.
  {
  // Début du plan modifié :
  echo '<h3>Modifications en cours :</h3>'; 

  list($structure, $structuremax) = structurevaisseau (-$repvaisseau['idvaisseau']);
  echo $structure.'/'.$structuremax.' de structure. </br>';

  list ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $structure2, $HPvaisseau) = caracteristiquesvaisseau (-$repvaisseau['idvaisseau']);


  $reqcomposantsurlevaisseau = $bdd->prepare("  SELECT COUNT(idtable) AS nb, i.nombatiment, c.iditemcomposant, c.typecomposant
                                                  FROM gamer.composantvaisseau c 
                              INNER JOIN items i ON i.iditem = c.iditemcomposant 
                              WHERE c.idvaisseaucompo = ? AND c.typecomposant like ?
                                                  GROUP BY iditemcomposant");
  $reqcomposantsurlevaisseau->execute(array(-$repvaisseau['idvaisseau'], '%'));
  $repmodifplanexiste = $reqcomposantsurlevaisseau->fetch();
  $reqcomposantsurlevaisseau->execute(array($repvaisseau['idvaisseau'], '%'));
  $repplanorigineaquelquechose = $reqcomposantsurlevaisseau->fetch(); 
  if (!isset($repmodifplanexiste['nombatiment']) AND isset($repplanorigineaquelquechose['nombatiment']))
    {
    $reqrecreerplanoriginal = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 
    $reqcomposantsurlevaisseau->execute(array($repvaisseau['idvaisseau'], '%'));
    while($repcomposantvaisseauoriginal = $reqcomposantsurlevaisseau->fetch())
      {
      for ($i = 1; $i <= $repcomposantvaisseauoriginal['nb']; $i++)
        {
        $reqrecreerplanoriginal->execute(array(-$repvaisseau['idvaisseau'], $repcomposantvaisseauoriginal['iditemcomposant'], $repcomposantvaisseauoriginal['typecomposant']));
        }
      }
    header("Location: vaisseau.php?message=".urlencode($_GET['message'])."&id=" . urlencode($_GET['id']));
    exit; 
    } 



  $reqcomposantsurlevaisseau->execute(array(-$repvaisseau['idvaisseau'], "moteur")); 
  $repmoteursurlevaisseau = $reqcomposantsurlevaisseau->fetch();
  if (isset($repmoteursurlevaisseau['nombatiment']))
    {
        echo $repmoteursurlevaisseau['nombatiment'].'&emsp;&emsp;Vitesse : '.$vitesse. ' parsec/cycle. </br>'; 
    } 
  else 
    { 
    echo 'Moteur I';
      echo '&emsp;&emsp;Vitesse : '.$vitesse. ' parsec/cycle. </br>';
    } 

    $a = 0;
    $reqcomposantsurlevaisseau->execute(array(-$repvaisseau['idvaisseau'], "soute"));
  while($repsoutesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $a++;
        $texte = $repsoutesurlevaisseau['nb'].' '.$repsoutesurlevaisseau['nombatiment'].'&emsp;';
        Supprimercomposant($repsoutesurlevaisseau['iditemcomposant'], $texte);
        }
    if ($a == 0)
      {
        echo 'Soute à échantillons : &emsp;' ;
        }
    echo $capacitedesoute . ' places dans les soutes. </br>';

    echo 'Armement : ';
    $a = 0;
    $reqcomposantsurlevaisseau->execute(array(-$repvaisseau['idvaisseau'], "arme"));
  while($reparmesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'] ;
        Supprimercomposant($reparmesurlevaisseau['iditemcomposant'], $texte);
        $a++;
        }
    if ($a == 0)
    { 
    echo 'Vaisseau non armé.<br>';
    } 
  echo $capaciteminage . ' capacité de minage. <br>';

    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array(-$repvaisseau['idvaisseau'], "coque"));
  while($repcoquesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repcoquesurlevaisseau['nb'].' '.$repcoquessurlevaisseau['nombatiment'];
        Supprimercomposant($repcoquesurlevaisseau['iditemcomposant'], $texte);
        $a++;
        }
    if ($a == 0)
    {
    echo 'Coque civile. ';
    }

  $reqcomposantsurlevaisseau->execute(array(-$repvaisseau['idvaisseau'], "autre")); 
  while($repautresurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repautresurlevaisseau['nb'].' '.$repautresurlevaisseau['nombatiment'] ;
        Supprimercomposant($repautresurlevaisseau['iditemcomposant'], $texte);
        }

  echo 'Total : '.$HPvaisseau . ' PV.</br>';
  echo 'Prix : '.$totalprixbien.' biens';
  if ($totalprixtitane > 0)
    {
    echo ' et ' . $totalprixtitane . ' de titane';
    }
  echo '. </br></br>';
  // Fin du plan modifié :


  // Début modification :
  composantdesign($_SESSION['id'], 'arme', 'Pas d\'arme disponible');
  composantdesign($_SESSION['id'], 'coque', 'Pas de coque disponible');
  composantdesign($_SESSION['id'], 'soute', 'Pas de soute disponible');
  composantdesign($_SESSION['id'], 'autre', 'Pas de module complémentaire disponible');

  if ($structure <= $structuremax)
    {
    echo '<form method="post" action="script/validerplan.php"><p>';
    echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
    echo '<input type="submit" id="formulaire" value="Valider les modifications" /></p></form>' ;
    }
  else
    {
    echo 'Impossible de valider (structure incorrecte)';
    }
  }
/*
  $reqsilo = $bdd->prepare("
                SELECT s.quantite, i.nombatiment, i.iditem, i.souscategorie
                FROM gamer.silo s
                INNER JOIN items i
                ON i.iditem = s.iditems
                WHERE s.idjoueursilo = ?
                AND i.souscategorie = ?");
  $reqsilo ->execute(array($idjoueur, $typecomposant));

  while($repsilo = $reqsilo->fetch())
    { 
    if ($repsilo['quantite']>0)
      {
      ?>
      <option value="<?php echo $repsilo['iditem']; ?>|<?php echo $repsilo['souscategorie']; ?>"><?php echo $repsilo['nombatiment']; ?></option>
      <?php
      $a++;
      } 
    }


  if ($a == 0)
    {
    echo '<option disabled selected>Pas de composant en stock</option>';
    }
  else
    {
    echo '<input name="idvaisseau" type="hidden" value="' . $idvaisseau . '"> ';
    echo '<input name="xobjectif" type="hidden" value="0">';
    echo '<input name="yobjectif" type="hidden" value="0">';
    echo '<input name="typeordre" type="hidden" value="6">';
    echo '<input type="submit" value="Échanger" />';
    } ?>
    </select>
 </p>
</form><?php

	/* 
	composantvaisseau('soute', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

	composantvaisseau('arme', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

	if ($replvl['lvl']>=8)
		{
		// Donner accès à cette partie plus tard dans les niveaux.
		composantvaisseau('coque', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);
		}

	if ($replvl['lvl']>=10)
		{
		// Donner accès à cette partie plus tard dans les niveaux.
		composantvaisseau('noyau', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);
		}

	echo '<h2>Composants dans les stocks :</h2>';
	$reqsiloitems = $bdd->prepare("
	                SELECT s.quantite, i.description, i.nombatiment   
	                FROM gamer.silo s   
	                INNER JOIN items i   
	                ON i.iditem = s.iditems   
	                WHERE s.idplanetesilo = ?   
	                AND i.typeitem = 'composant'");   
	$reqsiloitems->execute(array($repplanete['idplanete']));   

	$b = 0; // Permet de gérer le cas avec 0 composant en stock   
	while($repsiloitems = $reqsiloitems->fetch())   
		{   

		if ($repsiloitems['quantite']>0)   
		    {   
		    $b++;   
		    echo $repsiloitems['quantite'] . ' ' . $repsiloitems['nombatiment'] . '</br>';   
		    }    
	 	}   
	if ($b == 0)   
		{   
		echo 'Rien en stock' ;    
		}   
	 }*/ // Fin de la partie sur les modules.   
?>   
  </div>   
  </body>   
</html>