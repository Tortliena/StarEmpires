<?php
echo '<p><h3>News du site : </h3>';
$nombredenews = 3;
$combiendenewsexclues = 0 ;
$reqvoirnews = $bd->prepare('SELECT * FROM b_news ORDER BY datenews DESC LIMIT :exclusion , :nombredenews ');
$reqvoirnews->bindParam(':nombredenews', $nombredenews, PDO::PARAM_INT);
$reqvoirnews->bindParam(':exclusion', $combiendenewsexclues, PDO::PARAM_INT);
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
  echo '</p>';
?>