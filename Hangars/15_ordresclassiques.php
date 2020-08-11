<?php
// Si valeur de 0, alors aucun vaisseau n'a de noyau. Si valeur de 1, alors certains ont des noyaux. Si valeur de 2, alors tous ont des noyaux. Si 3, certains ont un niveau 2, si 4, tous ont un niveau 2.
$touslesvaisseauxontunnoyau = touslesvaisseauxontunnoyau($_GET['id']);

if ($touslesvaisseauxontunnoyau == 0)
	{
	echo '<p>Cette flotte ne peut pas voyager entre les dimensions !</p>';
	}
elseif ($touslesvaisseauxontunnoyau == 1)
	{
	echo '<p>Il y a dans cette flotte certains vaisseaux pouvant voyager entre les dimensions, mais pas tous.</p>';
	}
elseif ($touslesvaisseauxontunnoyau == 2)
	{
	formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);
	}
elseif ($touslesvaisseauxontunnoyau == 3)
	{
	echo '<p>Il y a dans cette flotte certains vaisseaux avec un noyau supérieur, mais pas tous.</p>';
	formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);
	}
elseif ($touslesvaisseauxontunnoyau == 4)
	{
	formulaireordredeplacement(2, $_GET['id'], 'Saut dimensionnel : ', $_SESSION['id'], 0, 0);
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
?>