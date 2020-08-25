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
  echo 'Date : '.$repvoirnews['datenews'].'<br>';
  echo 'Titre : '.$repvoirnews['titrenews'].'<br>';
  echo $repvoirnews['textenews'].'<br><br>';
  }
  echo '</p>';
?>