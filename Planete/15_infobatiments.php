<?php
echo '<h2>Bâtiments :</h2>'; 

$reqcompterbatiment = $bdg->prepare('SELECT sum(case when typebat = 1 then 1 else 0 end) AS centrederecherche,
                                            sum(case when typebat = 2 then 1 else 0 end) AS chantier,
                                            sum(case when typebat = 3 then 1 else 0 end) AS megalopole,
                                            sum(case when typebat = 4 then 1 else 0 end) AS baselunaire,
                                            sum(case when typebat = 21 then 1 else 0 end) AS traitement1,
                                            sum(case when typebat = 22 then 1 else 0 end) AS traitement2,
                                            sum(case when typebat = 38 then 1 else 0 end) AS basemilitaire,
                                            sum(case when typebat = 33 then 1 else 0 end) AS HQ
                                            FROM batiment WHERE idplanetebat = ?');
$reqcompterbatiment->execute(array($_GET['id']));
$repcompterbatiment = $reqcompterbatiment->fetch();

if(!isset($repcompterbatiment['centrederecherche'])){$repcompterbatiment['centrederecherche']=0;}
if(!isset($repcompterbatiment['chantier'])){$repcompterbatiment['chantier']=0;}
if(!isset($repcompterbatiment['megalopole'])){$repcompterbatiment['megalopole']=0;}
if(!isset($repcompterbatiment['baselunaire'])){$repcompterbatiment['baselunaire']=0;}
if(!isset($repcompterbatiment['traitement1'])){$repcompterbatiment['traitement1']=0;}
if(!isset($repcompterbatiment['traitement2'])){$repcompterbatiment['traitement2']=0;}

if ($repcompterbatiment['chantier'] > 0)
  {
  echo 'Chantier de construction';
  infobulle('Permet d\'avoir jusqu\'à 5 ouvriers<br>Max 1 par planète', 'infobulle');
  destruction(2, $_GET['id']);
  }

if ($repcompterbatiment['centrederecherche'] > 0)
  {
  echo '<br>Centre de recherche';
  infobulle('Permet d\'avoir jusqu\'à 5 scientifiques<br>Max 1 par planète', 'infobulle');
  destruction(38, $_GET['id']);
  }

if ($repcompterbatiment['basemilitaire'] > 0)
  {
  echo '<br>Base militaire';
  infobulle('Permet d\'avoir jusqu\'à 5 soldats<br>Max 1 par planète', 'infobulle');
  destruction(1, $_GET['id']);
  }

echo '<br>Mégalopoles : '.$repcompterbatiment['megalopole'].'/'.$repplanete['maxmegalopole'];
infobulle('Augmente la pop max.<br> Possbilité d\'en construire une par tranche de 4 de pop', 'infobulle');
if ($repcompterbatiment['megalopole'] > 0)
  {
  destruction(3, $_GET['id']);
  }

if ($repplanete['lune'] > 0)
  {
  echo '<br>Base lunaire : '.$repcompterbatiment['baselunaire'].'/'.$repplanete['maxbaselunaire'];
  infobulle('Augmente la pop max de 1.<br>Une constructible par lune.', 'infobulle');
  }
if ($repcompterbatiment['baselunaire'] > 0)
  {
  destruction(4, $_GET['id']);
  }

if ($repcompterbatiment['traitement1'] > 0)
  {
  echo '<br>Usine de traitement';
  infobulle('+30% en biens et +20% en titane lors des traitements des débris</br>Max 1 par planète', 'infobulle');
  destruction(21, $_GET['id']);
  }

if ($repcompterbatiment['traitement2'] > 0)
  {
  echo '<br>Usine de traitement avancée';
  infobulle('+25% en biens et +60% en titane lors des traitements</br>Max 1 par planète', 'infobulle');
  destruction(22, $_GET['id']);
  }

if ($repcompterbatiment['HQ'] > 0)
  {
  echo '<br>Quartier général des armées';
  infobulle('Bâtiment unique.<br>+1 aux flottes de la planète', 'infobulle');
  }

echo '<br>';

$reqdestructionencours = $bdg->prepare('SELECT d.iddestruction, d.idbatimentdestruction, i.nombatiment FROM destruction d INNER JOIN datawebsite.items i ON i.iditem = d.idbatimentdestruction WHERE idplanetedestruction = ?');
$reqdestructionencours->execute(array($_GET['id']));
$repdestructionencours = $reqdestructionencours->fetch();

if (isset($repdestructionencours['iddestruction']))
  {
  echo 'Vous avez ordonné de détruire un(e) '.lcfirst($repdestructionencours['nombatiment']);
  destruction(0, $_GET['id']);
  }

?>