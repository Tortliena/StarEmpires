<?php
echo '</br><h3>Objectifs :</h3>'; 
$reqtexteniveau = $bd->prepare('SELECT texteniveau FROM a_texteniveau WHERE niveau = ?'); 
$reqtexteniveau->execute(array($replvl['lvl'])); 
$reptexteniveau = $reqtexteniveau->fetch();
if (isset($reptexteniveau['texteniveau']))
  {
  echo $reptexteniveau['texteniveau'];
  } 
else
  {
  echo 'Pas d\'objectif prévu pour ce niveau.';
  }
?>