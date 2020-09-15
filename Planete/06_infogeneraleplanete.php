<?php
echo 'Taille : '.$repplanete['taille'].' ';
infobulle('Population maximale de base de la planète', 'infobulle');

if ($repplanete['environnement'] < -3000)
	{
	$environnement = 'détruit';
	$nomimage = 'environnementdetruit';
	}
elseif ($repplanete['environnement'] < 0)
	{
	$environnement = 'abimé';
	$nomimage = 'environnementabime';
	}
elseif ($repplanete['environnement'] < 1000)
	{
	$environnement = 'normal';
	$nomimage = 'environnement';
	}
elseif ($repplanete['environnement'] < 3000)
	{
	$environnement = 'amélioré';
	$nomimage = 'environnement';
	}
else
	{
	$environnement = 'idyllique';
	$nomimage = 'environnement';
	}

if ($repplanete['stabiliteenvironnement'] == 1000)
	{
	$stabenv = 'parfaite';
	}
elseif ($repplanete['stabiliteenvironnement'] > 800)
	{
	$stabenv = 'bonne';
	}
elseif ($repplanete['stabiliteenvironnement'] > 400)
	{
	$stabenv = 'faible';
	}
else
	{
	$stabenv = 'instable';
	}

infobulle('Environnement : '.$environnement.'<br>- Change la population maximale de la planète.<br>- Peut diminuer en cas de combat intenses.<br>- Peut-être (ré)augmenté.<br><br>Stabilité de l\'environnement : '.$stabenv.'<br>- Facilité à influencer l\'environnement.', $nomimage);

$reqsilo = $bd->prepare('	SELECT	sum(case when iditems = 39 then 1 else 0 end) AS restau,
	                                sum(case when iditems = 40 then 1 else 0 end) AS amelio
	                        FROM c_silo WHERE idplanetesilo = ?');
$reqsilo->execute(array($_GET['id']));
$repsilo = $reqsilo->fetch();

if ($repplanete['restauration'] > 0)
	{
	echo 'Modification planétaire en cours';
	infobulle('La stabilité environnementale va diminuer alors que la qualité de l\'environnement va augmenter.<br>Il est conseillé d\'attendre ensuite que la stabilité environnementale remonte avant de retenter d\'améliorer les conditions climatiques', 'infobulle');
	}	
elseif (($repplanete['environnement'] < 0 AND $repsilo['restau'] > 0) OR ($repplanete['environnement'] < 3000 AND $repsilo['amelio'] > 0))
	{
	echo '&nbsp;<form method="post" action="script/ordreterraformation.php">';
	echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
	echo '<input type="submit" value="Restaurer" />';
	echo '</form>';
	if ($repplanete['environnement'] < 0 AND $repsilo['restau'] > 0)
		{	
		infobulle('Action qui consomme un module de restauration planétaire.<br>Inefficace si votre stabilité environnementale est faible.', 'infobulle');
		}
	else
		{	
		infobulle('Action qui consomme un module d\'amélioration planétaire.<br>Inefficace si votre stabilité environnementale est faible.<br>Si vous planète est abimée, vous devriez plutôt restaurer votre planète avant de l\'améliorer', 'infobulle');
		}
	}


if ($repplanete['lune'] > 0)
  {
  echo '&nbsp;Lunes : '.$repplanete['lune'];
  infobulle('Permet de construire des bâtiments particuliers', 'infobulle');
  }

$bonusbatiment = $repplanete['popmax'] - floor($repplanete['environnement']/1000) - $repplanete['taille'];

echo '</br>'.$repcompterpop['population']. '/'.$repplanete['popmax'].' unités de population au total.';
infobulle('Composée de : <br>'.$repcompterpop['citoyens'].' citoyen(s) <br> '.$repcompterpop['ouvriers'].'/'.$repplanete['ouvriermax'].' ouvrier(s) <br> '.$repcompterpop['scientifiques'].'/'.$repplanete['scientmax'].' scientifique(s).<br>'.$repcompterpop['soldats'].'/'.$repplanete['soldatmax'].' soldat(s).<br><br>De base : +'.$repplanete['taille'].'<br>Environnement : '.floor($repplanete['environnement']/1000).'<br>Ensemble des bâtiments : +'.$bonusbatiment.'<br>(Minimum de 2)', 'infobulle');

$efficacite = MIN($repplanete['efficacite'], 100);
echo '&nbsp;Efficacite : '.$efficacite.'%';
infobulle('Influence la production de la planete. Augmente avec le temps.', 'infobulle');

echo '</br>'.$repcompterflotte['nb']. '/'.$repplanete['maxflotte'].' flotte(s).';
infobulle('De base : +1<br>Planète mère : + 1 (le cas échéant)', 'infobulle');

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
$reqprod = $bd->prepare('SELECT prodbiens, consobiens, coutstockage, entretien, entretienflotte FROM c_variationstour WHERE idplanetevariation = ?');
$reqprod->execute(array($_GET['id']));
$prodbiens = $reqprod->fetch();
echo '<br>Évolution des biens du dernier tour : ';
$totalvariation = $prodbiens['prodbiens'] - $prodbiens['consobiens'] - $prodbiens['coutstockage'] - $prodbiens['entretien'];
echo $totalvariation;
infobulle('Production : +'.$prodbiens['prodbiens'].'<br>Utilisation par la population : -'.$prodbiens['consobiens'].'<br>Cout de stockage : -'.$prodbiens['coutstockage'].'<br> Frais d\'entretien des bâtiments : -'.$prodbiens['entretien'].'<br>Entretien militaire : -'.$prodbiens['entretienflotte'], 'infobulle');


$reqstructureflottedefense = $bd->prepare('SELECT structuretotale FROM c_flotte WHERE idplaneteflotte = ?');
$reqstructureflottedefense->execute(array(-$_GET['id']));
$repstructureflottedefense = $reqstructureflottedefense->fetch();

$texteentretienflotte = '';
$total = 0;
$reqstructureflotte = $bd->prepare('SELECT structuretotale, nomflotte FROM c_flotte WHERE idplaneteflotte = ? AND structuretotale > 0');
$reqstructureflotte->execute(array($_GET['id']));
while ($repstructureflotte = $reqstructureflotte->fetch())
	{
	$texteentretienflotte .= '- La flotte \''.$repstructureflotte['nomflotte'].'\' a une structure/entretien total de '.$repstructureflotte['structuretotale'].'<br>';
	$total = $total + $repstructureflotte['structuretotale'];
	}

$puissancemilitaire = floor($repcompterpop['soldats'] * 20 * $efficacite/100);
$restedefense = max(0, $repstructureflottedefense['structuretotale']-$puissancemilitaire);
$total = $total + $restedefense;
$deductionflotteexterne = 2*$puissancemilitaire;
echo '&nbsp;Puissance militaire : '.$puissancemilitaire;
infobulle('Permet de réduire l\'entretien militaire de vos flottes.<br>Dernier tour :<br>- Flotte en défense : '.$repstructureflottedefense['structuretotale'].' de structure/entretien<br>- Déduction de '.$puissancemilitaire.' max<br>Reste :'.$restedefense.'<br>'.$texteentretienflotte.'<br>Reste : '.$total.'<br>Déduction de '.$deductionflotteexterne.' max.', 'infobulle');
?>