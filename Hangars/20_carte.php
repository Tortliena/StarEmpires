<?php
// requetes pour la carte et/ou les ordres.   

// Revoir cette requete pour trouver que les flottes 'ennemies'. 
$reqflottecarte = $bd->prepare('SELECT idflotte FROM c_flotte WHERE xflotte = ? AND yflotte = ? AND universflotte = ? AND idplaneteflotte = 0 LIMIT 1');

$reqetoileneutrinos = $bd->prepare('SELECT idetoileneutrinos FROM c_etoileneutrinos WHERE xneutrinos = ? AND yneutrinos = ? AND universneutrinos = ?');

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

		$reqstation->execute(array($x , $y, $repflotte['universflotte']));   
		$repstation = $reqstation->fetch();

		$reqplanete2->execute(array($x , $y, $repflotte['universflotte']));   
		$repplanete = $reqplanete2->fetch();   
		
		$reqflottecarte->execute(array($x , $y, $repflotte['universflotte']));   
		$repflottecarte = $reqflottecarte->fetch();
		
		$reqasteroide->execute(array($x , $y, $repflotte['universflotte']));   
		$repasteroide = $reqasteroide->fetch();

		$reqetoileneutrinos->execute(array($x , $y, $repflotte['universflotte']));   
		$repetoileneutrinos = $reqetoileneutrinos->fetch();   

		if ($repflotte['xflotte'] == $x AND $repflotte['yflotte'] == $y) // Si je suis sur mon vaisseau, afficher mon vaisseau.   
			{   
			echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/monvaisseau.png" alt="monvaisseau" /></a></td>';   
			}   
		// Mettre ici un /* pour enlever le brouillard de guerre.
		elseif (!isset($repdect['idexplore']) AND $repflotte['universflotte'] > -3)
			{// Si la case n'est pas exploré, alors afficher planète cachée ou station cachée s'il y a lieu, sinon rien.
			if (isset($repstation['idstation']))   
				{ 
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/pointinteret.png" alt="pointinteret" /></a></td>' ;   
				} 
			elseif (isset($repplanete['idplanete']))   
				{ 
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/planeteinconnu.png" alt="planete" /></a></td>' ;   
				}
			else
				{   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/inconnu.png" alt="inconnu" /></a></td>' ;   
				}
			}
		// Mettre ici un */ pour enlever le brouillard de guerre !
		else
			{
			if (isset($repstation['idstation']))   
				{ // Sinon, si la case est occupée par une planète, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/station.png" alt="station" /></a></td>' ;   
				}
			elseif (isset($repetoileneutrinos['idetoileneutrinos']))
				{ // Sinon, si la case est occupée par une étoile à neutrinos.  
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/etoileneutrinos.png" alt="Étoile à neutrinos" /></a></td>' ;     
				}
			elseif (isset($repplanete['idplanete']))   
				{ // Sinon, si la case est occupée par une planète, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/planete.png" alt="planete" /></a></td>' ;   
				}
			elseif (isset($repasteroide['idasteroide']))   
				{ // Sinon, si la case est occupée par un champs d'astéroides, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/asteroide.png" alt="asteroide" /></a></td>' ;   
				}
			elseif (isset($repflottecarte['idflotte']))
				{ // Sinon, si la case est occupée par une flotte neutre, l'afficher.   
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/vaisseaumechant.png" alt="vaisseaumechant" /></a></td>' ;     
				}
			else
				{
				$randimage = rand (1,2);  
				echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="../imagecarte/explore'.$randimage.'.png" alt="explore" /></a></td>' ;   
				}   
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