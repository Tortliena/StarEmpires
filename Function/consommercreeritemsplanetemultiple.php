<?php
function consommercreeritemsplanetemultiple($iditemdepart, $iditemarrivee, $idplanete, $nbdefois)
  {
  include("../include/BDDconnection.php");
  // Gestion silo :
  $reqverifsilo = $bdg->prepare('SELECT quantite FROM silo WHERE idplanetesilo = ? AND iditems = ?');
  $reqcreersilo = $bdg->prepare('INSERT INTO silo (idplanetesilo, iditems, quantite) VALUES (?, ?, ?)');
  $diminutionsilo = $bdg->prepare('UPDATE silo SET quantite = quantite - 1 WHERE idplanetesilo = ? AND iditems = ?' );
  $augmentersilo = $bdg->prepare('UPDATE silo SET quantite = quantite + 1 WHERE idplanetesilo = ? AND iditems = ?' );
  $reqsupprimersilo = $bdg->prepare('DELETE FROM silo WHERE idplanetesilo = ? AND iditems = ?');

  for ($i = 1; $i <= $nbdefois; $i++)
    {
    if ($iditemdepart > 0)
      {
      // Requete pour vérifier si j'en ai en stock    
      $reqverifsilo->execute(array($idplanete, $iditemdepart));
      $repverifsilodepart = $reqverifsilo->fetch();

      // Si oui, alors augmenter le stock
      if ($repverifsilodepart['quantite'] > 1)
          {
          $diminutionsilo->execute(array($idplanete, $iditemdepart));
          }
      // Sinon, on supprime le stock 
      elseif ($repverifsilodepart['quantite'] == 1)
          {
          $reqsupprimersilo->execute(array($idplanete, $iditemdepart));
          }
      // Si on a pas de stock, on ne va pas créer le nouvel équipement après.
      else
          {
          break;
          }
      }

    if ($iditemarrivee > 0)
      {
      // Requete pour vérifier si j'en ai en stock    
      $reqverifsilo->execute(array($idplanete, $iditemarrivee));
      $repverifsiloarrivee = $reqverifsilo->fetch();
                  
      // Si oui, alors augmenter le stock
      if (isset($repverifsiloarrivee['quantite']))
          {
          $augmentersilo->execute(array($idplanete, $iditemarrivee));
          }

      // Sinon, créer le stock stock  
      else
          {
          $reqcreersilo->execute(array($idplanete, $iditemarrivee, 1));
          }
      }
    }
    a:
  }
?>