<?php
session_start();
if (!$_SESSION['pseudo'])
  {
  header('Location: Accueil.php');
  exit();
  }
require __DIR__ . '/include/BDDconnection.php';
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

$reqstation = $bdg->prepare('SELECT idstation, nomstation, idjoueurstation FROM station WHERE xstation = ? AND	ystation = ? AND universstation = ?');
$reqstation->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte']));
$repstation = $reqstation->fetch();

?>
<div class="corps">
<form method="post" action="script/renommer.php"><h1>Flotte : <?php echo $repflotte['nomflotte'] ;?>    
<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />   
<input name="id" type="hidden" value="<?php echo $_GET['id'] ;?>">
<input name="type" type="hidden" value="flotte">
<input type="submit" value="Renommer"/></h1></form>

<?php
include("include/message.php");
$typemessage = 'flotte';
include("include/resume.php");
include("function/fonctionhangars.php");
include("function/variable.php");

$minageflotte = minageflotte($_GET['id']);
$souteflotte = souteflotte($_GET['id']);
$quantitetransportee = cargaisonflotte($_GET['id']);
$peutcoloniser = colonisateur($_GET['id']);
$estarme = armement($_GET['id']);
$vitesse = vitesseflotte($_GET['id']);

if ($replvl['lvl']>=3)
    {
    echo '<p>Vitesse de la flotte : ' . $vitesse . ' parsec/cycle</p>';
    }
if ($vitesse == 0)
	{
	header("location: planete.php?id=" . urlencode($repplanete['idplanete']));
	}

if (isset($repstation['idstation']))
	{
    echo '<p>Une station accepte de faire du commerce ! </p>';

	// Requête pour compter le nombre d'item.
	$reqcargocommerce = $bdg->prepare("	SELECT SUM(c.quantiteitems) AS nb, i.nombatiment 
						                FROM cargovaisseau c   
						                INNER JOIN datawebsite.items i ON i.iditem = c.typeitems
						                INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucargo   
						                WHERE v.idflottevaisseau = ? AND i.iditem = ?");

	// Cas des débris de métaux rares
	$reqcargocommerce ->execute(array($_GET['id'], 8));
	$reqdebrisrares = $reqcargocommerce ->fetch();
    // Variable avec prix des items selon la function !
	$prixdebrisrares = variable(3);
    // function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
	if ($reqdebrisrares['nb'] > 0)
		{
		vendrestation($_GET['id'], $repstation['idstation'], 8, $reqdebrisrares['nb'], $reqdebrisrares['nombatiment'], $prixdebrisrares[0]);
		}
	else
		{
		echo '<p>Cette station accepte les '.$reqdebrisrares['nombatiment'].' au prix de '.$prixdebrisrares[0].'$, mais votre flotte n\'en transporte pas.</p>';
		}

    // $replvl['creditgalactique'] vient du include menu.
	echo 'Vous avez '.$replvl['creditgalactique'].'$.'; 

	// Acheter des moyaux lvl 2 :
	$prixnoyau2 = variable(5);
	$maxpossible = min(floor($replvl['creditgalactique']/$prixnoyau2[0]) , $souteflotte-$quantitetransportee);
	acheterstation($_GET['id'], $repstation['idstation'], 25, $maxpossible, 'Noyaux à sub-tachyons', $prixnoyau2[0]);
    }

$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.   
// Requête pour compter le nombre d'item.
$reqverifcargo = $bdg->prepare("	SELECT SUM(c.quantiteitems) AS nb, i.nombatiment 
					                FROM cargovaisseau c   
					                INNER JOIN datawebsite.items i ON i.iditem = c.typeitems
					                INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucargo   
					                WHERE v.idflottevaisseau = ?
					                GROUP BY i.iditem");

$reqverifcargo ->execute(array($_GET['id']));   
while ($repverifcargo  = $reqverifcargo ->fetch())   
	{   
	if ($a == 0)   
		{   
		$texteexplication = '<p>Cette flotte transporte ';   
		}   
	else   
		{ // Permet de gérer les cas avec de multiples items dans les soutes.   
		$texteexplication .= ', ';   
		}   
	// Affiche ce qui est dans le cargo.   
	$texteexplication .= $repverifcargo['nb'].' '.$repverifcargo['nombatiment'] ;   

	$a = $a + $repverifcargo['nb'];   
	}   
	if ($a != 0)   
	    {   
	    echo $texteexplication. '.</p>' ;   
		if ($replvl['lvl']>=3)   
		    { 
		    echo '<p>Capacité des soutes : ' . $quantitetransportee . '/' . $souteflotte . '. '; 

			if ($repplanete2['idjoueurplanete'] == $repplanete['idjoueurplanete'])
				{  // formulaire pour transférer des vaisseaux vers la planète.
				echo '<form method="post" action="script/ordrechargement.php">'; 
				echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
				echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
				echo ' <input type="submit" value="Décharger"/></form>';
				}
			echo '</p><p>Capacité de minage : ' . $minageflotte . '</p>';
		    }
	    }   

// requetes pour la carte et/ou les ordres.   
$reqdect = $bdg->prepare('SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? LIMIT 1');   
$reqasteroide = $bda->prepare('SELECT idasteroide , quantite, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');   
// Revoir cette requete pour trouver que les flottes 'ennemies'. 
$reqflottecarte = $bdg->prepare('SELECT idflotte FROM flotte WHERE xflotte = ? AND yflotte = ? AND universflotte = ? AND idplaneteflotte = 0 LIMIT 1');
$reqstationcarte = $bdg->prepare('SELECT idstation  FROM station WHERE xstation = ? AND ystation = ? AND universstation = ? LIMIT 1');

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

// Détection flottes ennemies  
$reqdetectionflotteennemi = $bdg->prepare("SELECT f.idflotte, f.nomflotte FROM flotte f
		LEFT JOIN planete p on p.idplanete = f.idplaneteflotte
		INNER JOIN vaisseau v on v.idflottevaisseau = f.idflotte
		WHERE f.idflotte <> ? AND f.universflotte = ? AND f.xflotte = ? AND f.yflotte = ? AND (p.idjoueurplanete <> ? OR p.idjoueurplanete IS NULL)
		GROUP BY f.idflotte"); // INNER sur vaisseau = pour éliminer les flottes sans vaisseau.
$reqdetectionflotteennemi->execute(array($_GET['id'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte'], $_SESSION['id']));   
while($repdetectionflotteennemi = $reqdetectionflotteennemi->fetch())   
	{   
	if ($estarme == true)   // Si on a des armes, on peut tirer. 
		{   
		formulaireordredeplacement(5, $_GET['id'], 'flotte inconnue détectée : ' . $repdetectionflotteennemi['nomflotte'] . ' ', $repdetectionflotteennemi['idflotte'], 0, 0);   
		}   
	else   
		{   
		echo '<p>Flotte potentiellement hostile à proximité : ' . $repdetectionflotteennemi['nomflotte'] . '</p>';   
		}   
	}   

// Détection des flotte alliées.
$reqdetectionflottealliee = $bdg->prepare("SELECT f.idflotte, f.nomflotte FROM flotte f
		INNER JOIN planete p on p.idplanete = f.idplaneteflotte
		INNER JOIN vaisseau v on v.idflottevaisseau = f.idflotte
		WHERE f.idflotte <> ? AND f.universflotte = ? AND f.xflotte = ? AND f.yflotte = ? AND p.idjoueurplanete = ?"); // INNER sur vaisseau = pour éliminer les flottes sans vaisseau.
$reqdetectionflottealliee->execute(array($_GET['id'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte'], $_SESSION['id']));   
while($repdetectionflottealliee = $reqdetectionflottealliee->fetch())   
	{   
	echo '<p>Flotte amie à proximité : ' . $repdetectionflottealliee['nomflotte'] . '</p>';   
	}   

// Faire un elseif ici après avoir retravaillé la partie juste au dessus.
if ($repflotte['universflotte'] == 0)
	{// Si le vaisseau est dans l'hyperespace :
	$jourrestant = $repflotte['xdestination']+1;
	echo '<p>Votre vaisseau est en cours de voyage. Reste '.$jourrestant.' jours.</p>';
	}

// Si le vaisseau est de sortie sur la carte :
else
	{
	// Si valeur de 0, alors aucun vaisseau n'a de noyau. Si valeur de 1, alors certains ont des noyaux. Si valeur de 2, alors tous ont des noyaux.
	$touslesvaisseauxontunnoyau = touslesvaisseauxontunnoyau($_GET['id']);
	if ($touslesvaisseauxontunnoyau[0] == 0)
		{
		echo '<p>Cette flotte ne peut pas voyager entre les dimensions !</p>';
		}
	elseif ($touslesvaisseauxontunnoyau[0] == 1)
		{
		echo '<p>Il y a dans cette flotte certains vaisseaux pouvant voyager entre les dimensions, mais pas tous.</p>';
		}
	elseif ($touslesvaisseauxontunnoyau[0] == 2)
		{
		formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);
		}

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
			$reqflottecarte->execute(array($x , $y, $repflotte['universflotte']));   
			$repflottecarte = $reqflottecarte->fetch();   
			$reqplanete2->execute(array($x , $y, $repflotte['universflotte']));   
			$repplanete = $reqplanete2->fetch();   
			$reqasteroide->execute(array($x , $y, $repflotte['universflotte']));   
			$repasteroide = $reqasteroide->fetch();   
			$reqdect->execute(array($x , $y, $repflotte['universflotte'], $_SESSION['id']));   
			$repdect = $reqdect->fetch();
			$reqstationcarte->execute(array($x , $y, $repflotte['universflotte']));   
			$repstationcarte = $reqstationcarte->fetch();

			if ($repflotte['xflotte'] == $x AND $repflotte['yflotte'] == $y) // Si je suis sur mon vaisseau, afficher mon vaisseau.   
				{   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/monvaisseau.png" alt="monvaisseau" /></a></td>';   
				}   
			elseif (isset($repflottecarte['idflotte']))   
				{// Sinon, si la case est occupée par un vaisseau n'appartement pas au joueur, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/vaisseaumechant.png" alt="vaisseaumechant" /></a></td>' ;   
				}   
			elseif (isset($repplanete['idplanete']))   
				{ // Sinon, si la case est occupée par une planète, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/planete.png" alt="planete" /></a></td>' ;   
				}
			elseif (isset($repstationcarte['idstation']))   
				{ // Sinon, si la case est occupée par une planète, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/station.png" alt="station" /></a></td>' ;   
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

$a = 0; 
$reqvaisseaudanslaflotte = $bdg->prepare("SELECT idvaisseau, nomvaisseau, HPmaxvaisseau, HPvaisseau   
                FROM vaisseau
                WHERE idflottevaisseau = ?") ;
$reqvaisseaudanslaflotte ->execute(array($_GET['id']));
while ($repvaisseaudanslaflotte = $reqvaisseaudanslaflotte ->fetch())
	{
	$a++; 
	$PourcentHP = $repvaisseaudanslaflotte['HPvaisseau'] / $repvaisseaudanslaflotte['HPmaxvaisseau'] * 100 ;
	echo '<a href="vaisseau.php?id=' . $repvaisseaudanslaflotte['idvaisseau'] . '">' . $repvaisseaudanslaflotte['nomvaisseau'] . '</a> (' . number_format($PourcentHP, 0) . '%)'; 

	if ($repplanete2['idplanete'] == $repflotte['idplaneteflotte'])
		{
		if ($PourcentHP < 100)
		    {
		    //Requête pour réparer le vaisseau
		    echo '&nbsp<form method="post" action="script/ordrevaisseau.php">'; 
		    echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
		    echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseaudanslaflotte['idvaisseau'].'">';
		    echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
		    echo '<input name="mouvement" type="hidden" value="5">';
		    echo '<input type="submit" value="Réparer"/></form> '; 
		    }
		echo '<form method="post" action="script/ordrevaisseau.php">'; 
		echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
		echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseaudanslaflotte['idvaisseau'].'">';
		echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
		echo '<input name="mouvement" type="hidden" value="3">';
		echo ' <input type="submit" value="Rejoindre la planète"/></form>';
		}
	echo '</br>';
	}
	?>
  </div>
  </body>
</html>