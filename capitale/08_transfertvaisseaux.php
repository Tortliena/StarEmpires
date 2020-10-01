<?php
$optionplanete = '';
$nbplanetetransfert = 0;
$reqplanetetransfert = $bd->prepare('SELECT idplanete, nomplanete FROM c_planete WHERE idjoueurplanete = ?');
$reqplanetetransfert->execute(array($_SESSION['id']));
while ($repplanetetransfert  = $reqplanetetransfert ->fetch())
  {
  $nbplanetetransfert++;
  $optionplanete .= '<option value="'.$repplanetetransfert['idplanete'].'">'.$repplanetetransfert['nomplanete'].'</option>';
  }

$optionvaisseau = '';
$nbvaisseauxtransferable = 0;
$reqvaisseautransfert = $bd->prepare('SELECT idvaisseau, nomplanete, nomvaisseau FROM c_vaisseau
                                      INNER JOIN c_flotte ON idflottevaisseau = idflotte
                                      INNER JOIN c_planete ON idplanete = - idplaneteflotte
                                      WHERE idjoueurplanete = ?');
$reqvaisseautransfert->execute(array($_SESSION['id']));
while ($repvaisseautransfert  = $reqvaisseautransfert ->fetch())
  {
  $nbvaisseauxtransferable++;
  $optionvaisseau .= '<option value="'.$repvaisseautransfert['idvaisseau'].'">'.$repvaisseautransfert['nomvaisseau'].' ('.$repvaisseautransfert['nomplanete'].')</option><br>';
  }

if ($nbplanetetransfert > 1 AND $nbvaisseauxtransferable >0)
  {
  echo '</br></br><h3>Transferts de vaisseaux :</h3>';
  echo '<form method="post" action="script/transfertvaisseau.php"><p>';
  echo 'Transférer le vaisseau : <select name="idvaisseau">';
  echo $optionvaisseau ;  
  echo '</select> vers ';
  echo '<select name="idplanetearrivee">';
  echo $optionplanete ;  
  echo '</select>';
  echo ' <input type="submit" value="Transférer" title="valider pour aller à la page sélectionnée" /></p></form>';
  }
?>