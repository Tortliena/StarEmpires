<?php
$nombrenewsaffichees = 3;
if (isset($_GET['news']))
	{
	$idnews = $_GET['news'];
	}
else
	{
	$idnews = 0;
	}

$reqnbnews = $bd->query('SELECT COUNT(*) nb FROM b_news');
$repnbnews = $reqnbnews->fetch();

echo '<p><h3>News du site : </h3>';
$reqvoirnews = $bd->prepare('SELECT * FROM b_news ORDER BY datenews DESC LIMIT :exclusion , :nombredenews ');
$reqvoirnews->bindParam(':nombredenews', $nombrenewsaffichees, PDO::PARAM_INT);
$reqvoirnews->bindParam(':exclusion', $idnews, PDO::PARAM_INT);
$reqvoirnews->execute();
while($repvoirnews = $reqvoirnews->fetch())
	{
	echo 'Date : '.$repvoirnews['datenews'];
	echo '&ensp;Titre : '.$repvoirnews['titrenews'];
	if (isset($replvl['niveauadmin']) AND $replvl['niveauadmin'] >0)
		{
		echo '&ensp;<form method="post" action="/administration/administration.php?idnews='. urlencode($repvoirnews['idnews']).'">';
		echo '<input type="submit" value="Modifier" /></form>';
		}
	echo '<br>'.$repvoirnews['textenews'].'<br><br>';
	}
	
if ($idnews > 0)
	{
	$idnewsprecedente = max(0, $idnews-$nombrenewsaffichees);
	echo '<button onclick="window.location.href = \''.$_SERVER['PHP_SELF'].'?news='.$idnewsprecedente.' \';">Précédents</button>';
	}
if ($idnews < $repnbnews['nb']-$nombrenewsaffichees)
	{
	$idnewssuivante = min($idnews + $nombrenewsaffichees, $repnbnews['nb'] - $nombrenewsaffichees);
	echo '<button onclick="window.location.href = \''.$_SERVER['PHP_SELF'].'?news='.$idnewssuivante.' \';">Suivants</button>';
	}
echo '</p>';
?>