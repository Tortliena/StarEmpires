<?php
// requetes pour la carte et/ou les ordres.   
$reqdect = $bdg->prepare('SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? LIMIT 1');   
// Revoir cette requete pour trouver que les flottes 'ennemies'. 
$reqflottecarte = $bdg->prepare('SELECT idflotte FROM flotte WHERE xflotte = ? AND yflotte = ? AND universflotte = ? AND idplaneteflotte = 0 LIMIT 1');
$reqstationcarte = $bdg->prepare('SELECT idstation  FROM station WHERE xstation = ? AND ystation = ? AND universstation = ? LIMIT 1');

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
		$reqdect->execute(array($x , $y, $repflotte['universflotte'], $_SESSION['id']));   
		$repdect = $reqdect->fetch();

		$reqflottecarte->execute(array($x , $y, $repflotte['universflotte']));   
		$repflottecarte = $reqflottecarte->fetch();

		$reqstationcarte->execute(array($x , $y, $repflotte['universflotte']));   
		$repstationcarte = $reqstationcarte->fetch();
		
		// Requete issue de la page principale.
		$reqplanete2->execute(array($x , $y, $repflotte['universflotte']));   
		$repplanete = $reqplanete2->fetch();   
		
		// Requete issue de la page principale.
		$reqasteroide->execute(array($x , $y, $repflotte['universflotte']));   
		$repasteroide = $reqasteroide->fetch();   

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
  }}
?>