<?php
echo 'Taille : '.$repplanete['taille'].' ';
infobulle('Population maximale de base de la planète');

if ($repplanete['lune'] > 0) 
  { 
  echo '&nbsp;Lunes : '.$repplanete['lune'];
  infobulle('Permet de construire des bâtiments particuliers');
  }

echo '</br>'.$repcompterpop['population']. '/'.$repplanete['popmax'].' unités de population au total.';
infobulle('Composée de : <br>'.$repcompterpop['citoyens'].' citoyen(s) <br> '.$repcompterpop['ouvriers'].'/'.$repplanete['ouvriermax'].' ouvrier(s) <br> '.$repcompterpop['scientifiques'].'/'.$repplanete['scientmax'].' scientifique(s).');

$efficacite = MIN($repplanete['efficacite'], 100);
echo '&nbsp;Efficacite : '.$efficacite.'%';
infobulle('Influence la production de la planete. Augmente avec le temps.');

echo '</br>'.$repcompterflotte['nb']. '/'.$repplanete['maxflotte'].' flotte(s).';
infobulle('De base : +1<br>Planète mère : + 1 (le cas échéant)');

echo '&nbsp;Coordonnées : '.$repplanete['xplanete'].'-'.$repplanete['yplanete'];
if ($replvl['lvl'] > 11)
	{
	if ($repplanete['universplanete'] > 0)
		{
		echo '-univers mère';
		}
	elseif ($repplanete['universplanete'] == -2)
		{
		echo '-2nd univers';
		}
	elseif ($repplanete['universplanete'] == -3)
		{
		echo '-3ème univers';
		}
	}

// Affichage de la prod des biens. 
$reqprod = $bdg->prepare('SELECT prodbiens, consobiens, coutstockage, entretien FROM variationstour WHERE idplanetevariation = ?'); 
$reqprod->execute(array($_GET['id'])); 
$prodbiens = $reqprod->fetch(); 
echo '<br>Évolution des biens du dernier tour : ';
$totalvariation = $prodbiens['prodbiens'] - $prodbiens['consobiens'] - $prodbiens['coutstockage'] - $prodbiens['entretien'] ;
echo $totalvariation ;
infobulle('Production : +'.$prodbiens['prodbiens'].'<br>Utilisation par la population : -'.$prodbiens['consobiens'].'<br>Cout de stockage : -'.$prodbiens['coutstockage'].'<br> Frais d\'entretien des bâtiments : -'.$prodbiens['entretien']);
?>