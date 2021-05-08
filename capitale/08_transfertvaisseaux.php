<?php
$tempstransfert = variable(11);
$couttransfert = variable(12);

$optionplanete = '';
$nbplanetetransfert = 0;
$reqplanetetransfert = $bd->prepare('SELECT idplanete, nomplanete FROM c_planete WHERE idjoueurplanete = ? AND biens > ?');
$reqplanetetransfert->execute(array($_SESSION['id'], $couttransfert));
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

if ($replvl['lvl'] > 11)
  {
  echo '</br></br><h3>Transferts de vaisseaux :</h3>';

  if ($nbplanetetransfert > 0 AND $nbvaisseauxtransferable > 0)
    {
    echo '<form method="post" action="script/transfertvaisseau.php"><p>';
    echo 'Transférer le vaisseau : <select name="idvaisseau">';
    echo $optionvaisseau ;  
    echo '</select> vers ';
    echo '<select name="idplanetearrivee">';
    echo $optionplanete ;  
    echo '</select>';
    echo ' <input type="submit" value="Transférer" /></p></form>';
    }
  }

$reqtransfertencours = $bd->prepare(' SELECT tv.idtransfert, tv.toursrestantstranfert, po.nomplanete AS origine, pd.nomplanete AS dest, v.nomvaisseau
                                      FROM c_transfertvaisseau tv
                                      LEFT JOIN c_planete po ON po.idplanete = tv.idplanetedepart
                                      LEFT JOIN c_planete pd ON pd.idplanete = tv.idplanetearrivee
                                      LEFT JOIN c_vaisseau v ON v.idvaisseau = tv.idvaisseautransfert
                                      WHERE tv.idjoueurtransfert = ?');
$reqtransfertencours->execute(array($_SESSION['id']));
while ($reptransfertencours  = $reqtransfertencours ->fetch())
  {
  echo 'Le vaisseau "'.$reptransfertencours['nomvaisseau'].'" est en cours de transfert de '.$reptransfertencours['origine'].' à '.$reptransfertencours['dest'].' et il reste '.$reptransfertencours['toursrestantstranfert'].' tours.';
  if ($tempstransfert == $reptransfertencours['toursrestantstranfert'])
    {
    echo '<form method="post" action="script/annulertransfert.php"><input type="hidden" name="idtransfert" value="'.$reptransfertencours['idtransfert'].'"/><input type="submit" value="Annuler"/></form>';
    }
  }
echo '<br>';
?>