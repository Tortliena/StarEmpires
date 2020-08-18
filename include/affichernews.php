<?php
echo '<p><h3>News du site : </h3>';
$nombredenews = 2;
$combiendenewsexclues = 1 ;
$reqvoirnews = $bda->prepare('SELECT * FROM news ORDER BY datenews DESC LIMIT :exclusion , :nombredenews ');
$reqvoirnews->bindParam(':nombredenews', $nombredenews, PDO::PARAM_INT);
$reqvoirnews->bindParam(':exclusion', $combiendenewsexclues, PDO::PARAM_INT);
$reqvoirnews->execute();
while($repvoirnews = $reqvoirnews->fetch())
  {
  echo 'Date : '.$repvoirnews['datenews'].'<br>';
  echo 'Titre : '.$repvoirnews['titrenews'].'<br>';
  echo $repvoirnews['textenews'].'<br>';
  }
  echo '</p>';
?>