<?php
echo '<p><h3>News du site : </h3>';
$nombredenews = 3;
$combiendenewsexclues = 0 ;
$reqvoirnews = $bda->prepare('SELECT * FROM news ORDER BY datenews DESC LIMIT :exclusion , :nombredenews ');
$reqvoirnews->bindParam(':nombredenews', $nombredenews, PDO::PARAM_INT);
$reqvoirnews->bindParam(':exclusion', $combiendenewsexclues, PDO::PARAM_INT);
$reqvoirnews->execute();
while($repvoirnews = $reqvoirnews->fetch())
	{
	echo 'Date : '.$repvoirnews['datenews'];
	echo '&ensp;Titre : '.$repvoirnews['titrenews'];
	if (isset($replvl['niveauadmin']) AND $replvl['niveauadmin'] >0)
		{
		echo '&ensp;<form method="post" action="/starempires/administration/Administration.php?idnews='. urlencode($repvoirnews['idnews']).'">';
		echo '<input type="submit" value="Modifier" /></form>';
		}
	echo '<br>'.$repvoirnews['textenews'].'<br><br>';
	}
  echo '</p>';
?>