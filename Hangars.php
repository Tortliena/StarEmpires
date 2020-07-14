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
   
$reqflotte = $bdg->prepare('SELECT * FROM flotte WHERE idflotte = ?');
$reqflotte->execute(array($_GET['id']));
$repflotte = $reqflotte->fetch();

if (!isset($repflotte['idplaneteflotte']))   // pas de flotte avec cet id.
	{ header('Location: Accueil.php'); exit(); }

$reqplanete2 = $bdg->prepare('SELECT idplanete, idjoueurplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? LIMIT 1');
$reqplanete2->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte']));
$repplanete2 = $reqplanete2->fetch();

$reqplanete = $bdg->prepare('SELECT idplanete, idjoueurplanete FROM planete WHERE idplanete = ?');
$reqplanete->execute(array($repflotte['idplaneteflotte']));
$repplanete = $reqplanete->fetch();

if ($repplanete['idjoueurplanete'] != $_SESSION['id'])   // La planète dont est originaire la flotte n'est pas celle de du joueur.
	{ header('Location: Accueil.php'); exit(); }

/*
else    
	{ // code permettant de récupérer les info sur une planète ou la flotte orbite.   
	$reqplanete2->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
	$repplanete = $reqplanete2->fetch();
	}
*/
 
?>   
<div class="corps">   
<form method="post" action="script/renommer.php"><h1>Flotte : <?php echo $repflotte['nomflotte'] ;?>    
<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />   
<input name="id" type="hidden" value="<?php echo $_GET['id'] ;?>">   
<input name="type" type="hidden" value="flotte">   
<input type="submit" value="Renommer"/></h1></form>   
   
<?php   
include("include/message.php");   
$typemessage = 'flotte' ;   
include("include/resume.php");   
include("function/fonctionhangars.php");
include("function/flotte.php");

$minageflotte = minageflotte($_GET['id']) ; 
$souteflotte = souteflotte($_GET['id']) ;
$quantitetransportee = cargaisonflotte($_GET['id']) ;
$peutcoloniser = colonisateur($_GET['id']) ;

$reqcomposantsurlevaisseau = $bdd->prepare("SELECT i.nombatiment FROM gamer.composantvaisseau c   
          INNER JOIN items i ON i.iditem = c.iditemcomposant   
          WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?");   
      
if ($replvl['lvl']>=3)   
    {
    $vitesse = vitesseflotte($_GET['id']) ;
    echo '<p>Vitesse de la flotte : ' . $vitesse . ' parsec/cycle</p>';    
    }

/*
$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.   

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
		$texteexplication = '<p>Ce vaisseau transporte ';   
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
	    $texteexplication .= '. ';   
	    if  ($repplanete['idjoueurplanete'] == $_SESSION['id'] OR $repvaisseau['y'] == 0) // Au hangars   
	    	{ // Formulaire pour décharger le cargo. Ne s'exécute que si on a quelque chose en soute ($a)   
	    	formulaireordredeplacement(2, $_GET['id'], $texteexplication, 0, 0, 0);   
	    	}   
	    else   
	    	{ // Permet de mettre un point à la fin de la phase avec les trucs en soute.    
	    	echo $texteexplication ;   
	    	}   
	    echo '</p>';    
	    }   
*/
	
	if ($replvl['lvl']>=3)   
	    { 
	    echo '<p>Capacité des soutes : ' . $quantitetransportee . '/' . $souteflotte . '. Capacité de minage : ' . $minageflotte . '</p>';   
	    }   
/*  
	if ($replvl['lvl']>=5)   
	    {   
	    $PourcentHP = $repvaisseau['HPvaisseau'] / $repvaisseau['HPmaxvaisseau'] * 100 ;   
	    if ($PourcentHP != 100 AND $repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0 AND $repvaisseau['univers'] == $_SESSION['id'])   
	     	{ // Permet de réparer le vaisseau.   
	    	formulaireordredeplacement(7, $_GET['id'], 'PV : ' . number_format($PourcentHP, 0) . '% ', 0, 0, 0);   
	     	}    
	    else   
	    	{   
	    	echo '<p>PV : ' . number_format($PourcentHP, 0) . '%';    
	      	}   
	       
	    $reqcomposantsurlevaisseau->execute(array($_GET['id'], 'arme'));   
	    $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();   
	    echo '&emsp; Armement : ';   
		if (isset($repcomposantsurlevaisseau['nombatiment']))   
			{   
			echo ucfirst($repcomposantsurlevaisseau['nombatiment']);   
			}   
		else   
			{   
			echo 'Vaisseau non armé.';   
			}   
	    echo '</p>';   
	    }   
*/

// requetes pour la carte et/ou les ordres.   
$reqdect = $bdg->prepare('SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? LIMIT 1');   
$reqasteroide = $bda->prepare('SELECT idasteroide , quantite, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');   
// Revoir cette requete pour trouver que les flottes 'ennemies'. 
$reqflottecarte = $bdg->prepare('SELECT idflotte FROM flotte WHERE xflotte = ? AND yflotte = ? AND universflotte = ? AND idplaneteflotte <> ? LIMIT 1');   

// Si on a un champs d'astéroide, formulaire pour embarquer les trucs.
$reqasteroide->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte']));
$repasteroide = $reqasteroide->fetch();
if (isset($repasteroide['idasteroide']))   
	{
	if ($quantitetransportee < $souteflotte)   
		{
		formulaireordredeplacement(1, $_GET['id'], 0, 0, 0, 0);   
		}
	else   
		{
		echo '<p>Vous êtes à proximité d\'un champs de débris, mais vous ne pouvez pas miner faute de place dans les soutes</p>';    
		}   
	}   

/*  
$reqarmesurvaisseau = $bdg->prepare("SELECT COUNT(*) AS nb FROM composantvaisseau WHERE tirrestant > 0 AND idvaisseaucompo = ?");   
$reqarmesurvaisseau->execute(array($_GET['id']));   
$reparmesurvaisseau = $reqarmesurvaisseau->fetch();   
*/

/*
// Détection flottes ennemies  
$reqdetectionflotteennemi = $bdg->prepare("SELECT idflotte, nomflotte FROM flotte WHERE idflotte <> ? AND universflotte = ? AND xflotte = ? AND yflotte = ? AND xflotte <> 0");
$reqdetectionflotteennemi->execute(array($_GET['id'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte']));   
while($repdetectionflotteennemi = $reqdetectionflotteennemi->fetch())   
	{   
	if (1 > 0)   // avant : $reparmesurvaisseau['nb'] > 0 dans le cas ou il y a des armes. 
		{   
		formulaireordredeplacement(5, $_GET['id'], 'flotte inconnue détectée : ' . $repdetectionvaisseauennemi['nomflotte'] . ' ', $repdetectionvaisseauennemi['idflotte'], 0, 0);   
		}   
	else   
		{   
		echo '<p>flotte potentiellement hostile à proximité : ' . $repdetectionflotteennemi['nomflotte'] . '</p>';   
		}   
	}   
*/
	
/*   // Refaire ici et au dessus en séparant les cas des flottes amies et ennemies.
// Détection des flotte alliées.
$reqdetectionvaisseau = $bdg->prepare("SELECT idvaisseau, nomvaisseau FROM vaisseau WHERE idjoueurvaisseau = ? AND univers = ? AND x = ? AND y = ? AND  idvaisseau <> ? AND x <> 0");   
$reqdetectionvaisseau->execute(array($_SESSION['id'], $repvaisseau['univers'], $repvaisseau['x'], $repvaisseau['y'], $repvaisseau['idvaisseau']));   
while($repdetectionvaisseau = $reqdetectionvaisseau->fetch())   
	{   
	echo '<p>Vaisseau ami à proximité : ' . $repdetectionvaisseau['nomvaisseau'] . '</p>';   
	}   
*/



/*
// Si le vaisseau est au hangars :    
if ($repvaisseau['y'] == 0 AND $repvaisseau['univers'] == 0)   
	{   
	$reqcomposantsurlevaisseau->execute(array($_GET['id'], 'noyau'));   
	$repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();   
	if (isset($repcomposantsurlevaisseau['nombatiment']))   
		{   
		formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);   
		}   

	echo '<h3></br>Votre vaisseau est au hangars.</h3>' ;   
	if (isset($reponseordredeplacementactuel['typeordre']))   
		{   
		annulerordrededeplacement($reponseordredeplacementactuel['typeordre'], $_GET['id'], $reponseordredeplacementactuel['xdestination'], $reponseordredeplacementactuel['ydestination'], $reponseordredeplacementactuel['bloque']);   
		}   

	$reqinfoplanete = $bdg->prepare('SELECT nomplanete, xplanete, yplanete, universplanete FROM planete WHERE idplanete = ?');   
	$reqinfoplanete->execute(array($repvaisseau['x']));   
	$repinfoplanete = $reqinfoplanete->fetch();   
	// Ordre de sortir du hangars.   
	formulaireordredeplacement(4, $_GET['id'], 0, 0, 0, $repinfoplanete['nomplanete']);   

	// Permet d'afficher cette partie avec le niveau suffisant.   
	if ($replvl['lvl']>=6)   
		{   
		// Afficher ce qui est actuellement sur votre vaisseau.    
		echo '<h2>Composants dans votre vaisseau :</h2>';   
		   
		composanthangars('moteur', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

		composanthangars('soute', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

		composanthangars('arme', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

		if ($replvl['lvl']>=8)   
			{   
			// Donner accès à cette partie plus tard dans les niveaux.   
			composanthangars('coque', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   
			}   

		if ($replvl['lvl']>=10)   
			{   
			// Donner accès à cette partie plus tard dans les niveaux.   
			composanthangars('noyau', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   
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
		} // Fin de la partie sur les modules.    
	} // Fin de la partie dans le hangars.   
*/

// Faire un elseif ici après avoir retravaillé la partie juste au dessus.
if ($repflotte['universflotte'] == 0)   
	{// Si le vaisseau est dans l'hyperespace :   
	$jourrestant = $repflotte['xdestination']+1;   
	echo '<p>Votre vaisseau est en cours de voyage. Reste '.$jourrestant.' jours.</p>';   
	}   
   
// Si le vaisseau est de sortie sur la carte :   
else   
	{   
	/*
	$reqcomposantsurlevaisseau->execute(array($_GET['id'], 'noyau'));   
	$repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();   
	if (isset($repcomposantsurlevaisseau['nombatiment']))   
		{   
		formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);   
		}   
	*/

	if ($repflotte['universflotte'] > 0)   
		{   
		$xymax = 5 ; // valeurs maximales de la carte.   
		}   
	else   
		{   
		$xymax = 20 ; // valeurs maximales de la carte.   
		}   

	// Si il y a un ordre de déplacement en cours :    
	if ($repflotte['typeordre']>0)   
		{
		annulerordrededeplacement($repflotte['typeordre'], $_GET['id'], $repflotte['xdestination'], $repflotte['ydestination'], $repflotte['bloque']);   
		}

	echo '<p>Votre flotte est en balade en ' . $repflotte['universflotte'] . ' , ' . $repflotte['xflotte'] . ' , ' . $repflotte['yflotte'] . '</p>';   

	// Formulaire pour donner un ordre de déplacement.   
	if (isset($_GET['x']))   
		{
		formulaireordredeplacement(6, $_GET['id'], 0, $_GET['x'], $_GET['y'], $xymax);   
		}
	else   
		{
		// formulaireordredeplacement(0, $_GET['id'], 0, $repflotte['xflotte'], $repflotte['yflotte'], $xymax);   
		}

	if ($peutcoloniser[0] == true)
		{
		// Formulaire pour coloniser
		if (isset($repplanete2['idjoueurplanete']) AND $repplanete2['idjoueurplanete'] == 0)   
			{
			formulaireordredeplacement(11, $_GET['id'], 0, $repplanete2['idplanete'], 0, 0);   
			}
		elseif (isset($repplanete2['idjoueurplanete']) AND $repplanete2['idjoueurplanete'] != 0)
			{
			echo '<p>Au moins un vaisseau dans cette flotte possède un module de colonisation. Un monde se trouve à proximité mais est déjà colonisé.</p>';
			}
		else
			{
			echo '<p>Au moins un vaisseau dans cette flotte possède un module de colonisation mais aucun monde est à proximité.</p>'; 
			}
		}

  

	// Carte spatiale :   
	for ($y = 0 ; $y <= $xymax ; $y++)   
		{   
	for ($x = 0 ; $x <= $xymax ; $x++)   
	  	{   
		if ($x == 0 AND $y == 0)   
			{ // Début du tableau + tout en haut à gauche.   
			echo '<table class = "carte"><caption>Univers ' . $repflotte['universflotte'] . '!</caption><tr><td class = "xycarte">x/y</td>' ;   
			}   
		elseif ($x > 0 AND $x <= $xymax AND $y > 0 AND $y <= $xymax)   
			{ // interieur du tableau   
			$reqflottecarte->execute(array($x , $y, $repflotte['universflotte'], $_SESSION['id']));   
			$repflottecarte = $reqflottecarte->fetch();   
			$reqplanete2->execute(array($x , $y, $repflotte['universflotte']));   
			$repplanete = $reqplanete2->fetch();   
			$reqasteroide->execute(array($x , $y, $repflotte['universflotte']));   
			$repasteroide = $reqasteroide->fetch();   
			$reqdect->execute(array($x , $y, $repflotte['universflotte'], $_SESSION['id']));   
			$repdect = $reqdect->fetch();   
			if ($repflotte['xflotte'] == $x AND $repflotte['yflotte'] == $y) // Si je suis sur mon vaisseau, afficher mon vaisseau.   
				{   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/monvaisseau.png" alt="monvaisseau" /></a></td>';   
				}   
			elseif (isset($repvaisseaucarte['idvaisseau']))   
				{// Sinon, si la case est occupée par un vaisseau n'appartement pas au joueur, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/vaisseaumechant.png" alt="vaisseaumechant" /></a></td>' ;   
				}   
			elseif (isset($repplanete['idplanete']))   
				{ // Sinon, si la case est occupée par une planète, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/planete.png" alt="planete" /></a></td>' ;   
				}   
			elseif (isset($repasteroide['idasteroide']))   
				{ // Sinon, si la case est occupée par un champs d'astéroides, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/asteroide.png" alt="asteroide" /></a></td>' ;   
				}   
			elseif (isset($repdect['idexplore']))   
				{   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/explore.png" alt="explore" /></a></td>' ;   
				}   
			else   
				{   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/inconnu.png" alt="inconnu" /></a></td>' ;   
				}      
			}   
	  	elseif ($x == 0 AND $y > 0 AND $y <= $xymax)   
		    { // Première colonne du tableau (hors haut à gauche)   
		      echo '<tr><td class = "xycarte">' . $y . '</td>' ;   
		    }    
	  	elseif ($x > 0 AND $x <= $xymax AND $y == 0)     
		    { // Première ligne du tableau (hors haut à gauche)   
		      echo '<td class = "xycarte">' . $x . '</td>' ;   
		    }    
		if ($x == $xymax)   
			{ // Arrivée à la droite du tableau   
			echo '</tr>' ;   
			}   
		if ($x == $xymax AND $y == $xymax)   
		    { // fin du tableau   
		    echo '</table></br></br>' ;   
		    }   
	  }} // Acolades pour fermer les for de la carte.   
	} // acolade pour fermer la partie sur la carte.   

$reqvaisseaudanslaflotte = $bdg->prepare("SELECT idvaisseau, nomvaisseau, HPmaxvaisseau, HPvaisseau   
                FROM vaisseau
                WHERE idflottevaisseau = ?") ;
$reqvaisseaudanslaflotte ->execute(array($_GET['id']));
while ($repvaisseaudanslaflotte = $reqvaisseaudanslaflotte ->fetch())
	{
	if ($repplanete2['idplanete'] == $repflotte['idplaneteflotte'])
		{ // formulaire pour transférer des vaisseaux vers la planète.
		echo '<form method="post" action="script/envoyerenorbite.php">'; 
		echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
		echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseaudanslaflotte['idvaisseau'].'">';
		echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
		echo '<input name="mouvement" type="hidden" value="3">';
		}

	$PourcentHP = $repvaisseaudanslaflotte['HPvaisseau'] / $repvaisseaudanslaflotte['HPmaxvaisseau'] * 100 ;
	echo '<a href="vaisseau.php?id=' . $repvaisseaudanslaflotte['idvaisseau'] . '">' . $repvaisseaudanslaflotte['nomvaisseau'] . '</a> (' . number_format($PourcentHP, 0) . '%)'; 
	
	if ($repplanete2['idplanete'] == $repflotte['idplaneteflotte'])
		{
		echo '<input type="submit" value="Rejoindre la planète"/></form>';
		}
	echo '</br>';
	}
	?>
  </div>
  </body>
</html>