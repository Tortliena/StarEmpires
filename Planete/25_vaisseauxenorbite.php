<?php
$a = 0;
$reqflotteenorbite = $bd->prepare("SELECT idflotte, nomflotte FROM c_flotte WHERE idplaneteflotte = ? AND universflotte = ? AND xflotte = ? AND yflotte = ?") ;   
$reqvaisseauenorbite = $bd->prepare(" SELECT v.idvaisseau, v.nomvaisseau, v.HPmaxvaisseau, v.HPvaisseau, tv.idtransfert
                                      FROM c_vaisseau v
                                      INNER JOIN c_flotte f ON f.idflotte = v.idflottevaisseau
                                      LEFT JOIN c_transfertvaisseau tv ON tv.idvaisseautransfert = v.idvaisseau
                                      WHERE idplaneteflotte = ?") ;   
$reqvaisseauenorbite ->execute(array(-$_GET['id']));   
while ($repvaisseauenorbite = $reqvaisseauenorbite ->fetch())   
  {
  if ($a == 0)
    {
    echo '<h2>Vaisseaux en orbite :</h2>';
    }
  $a++;

  $PourcentHP = $repvaisseauenorbite['HPvaisseau'] / $repvaisseauenorbite['HPmaxvaisseau'] * 100 ;   

  echo '<a href="../conception_vaisseau/vaisseau.php?id=' . $repvaisseauenorbite['idvaisseau'] . '">' . $repvaisseauenorbite['nomvaisseau'] . '</a> (' . number_format($PourcentHP, 0) . '%) ';

  if (isset($repvaisseauenorbite['idtransfert']))
    {
    echo 'vaisseau en cours de transfert<br>';
    }
  else
    {
    if ($PourcentHP < 100)
      {
      //Requête pour réparer le vaisseau
      echo '&nbsp<form method="post" action="../script/ordrevaisseau.php">'; 
      echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
      echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseauenorbite['idvaisseau'].'">';
      echo '<input name="idflotte" type="hidden" value="0">';
      echo '<input name="mouvement" type="hidden" value="4">';
      echo '<input type="submit" value="Réparer"/></form> '; 
      }
    
    $reqflotteenorbite ->execute(array($_GET['id'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete']));  
    while ($repflotteenorbite = $reqflotteenorbite ->fetch())   
      {
      //requete pour trouver toutes les flottes en orbite du joueur et y envoyer le vaisseau.
      echo '&nbsp<form method="post" action="../script/ordrevaisseau.php">'; 
      echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
      echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseauenorbite['idvaisseau'].'">';
      echo '<input name="idflotte" type="hidden" value="'.$repflotteenorbite['idflotte'].'">';
      echo '<input name="mouvement" type="hidden" value="1">';
      echo '<input type="submit" value="'.$repflotteenorbite['nomflotte'].'"/></form>'; 
      }
  
    if ($repcompterflotte['nb']<$repplanete['maxflotte'])
      {
      echo '&nbsp<form method="post" action="../script/ordrevaisseau.php">'; 
      echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
      echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseauenorbite['idvaisseau'].'">';
      echo '<input name="idflotte" type="hidden" value="0">';
      echo '<input name="mouvement" type="hidden" value="2">';
      echo '<input type="submit" value="Créer flotte"/></form></br>';
      }
    else
      {
      infobulle('Impossible de créer une nouvelle flotte, limite atteinte.', 'infobulle');
      }
    }
  echo '<br>';
  }
?>