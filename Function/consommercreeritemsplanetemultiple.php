<?php
function consommercreeritemsplanetemultiple($iditemdepart, $iditemarrivee, $idplanete, $nbdefois)
  {
  require __DIR__ . '/../include/BDDconnection.php';
  // Gestion silo :
  $reqverifsilo = $bdg->prepare('SELECT quantite, idsilo FROM silo WHERE idplanetesilo = ? AND iditems = ?');
  $reqcreersilo = $bdg->prepare('INSERT INTO silo (idplanetesilo, iditems, quantite) VALUES (?, ?, ?)');
  $diminutionsilo = $bdg->prepare('UPDATE silo SET quantite = quantite - 1 WHERE idsilo = ?' );
  $augmentersilo = $bdg->prepare('UPDATE silo SET quantite = quantite + 1 WHERE idsilo = ?' );
  $reqsupprimersilo = $bdg->prepare('DELETE FROM silo WHERE idsilo = ?');

  for ($i = 1; $i <= $nbdefois; $i++)
    {
    if ($iditemdepart > 0)
      {
      // Requete pour vérifier si j'en ai en stock    
      $reqverifsilo->execute(array($idplanete, $iditemdepart));
      $repverifsilodepart = $reqverifsilo->fetch();

      // Si oui, alors fait diminuer le stock
      if ($repverifsilodepart['quantite'] > 1)
          {
          $diminutionsilo->execute(array($repverifsilodepart['idsilo']));
          }
      // Sinon, on supprime le stock 
      elseif ($repverifsilodepart['quantite'] == 1)
          {
          $reqsupprimersilo->execute(array($repverifsilodepart['idsilo']));
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
          $augmentersilo->execute(array($repverifsiloarrivee['idsilo']));
          }
      // Sinon, créer le stock stock  
      else
          {
          $reqcreersilo->execute(array($idplanete, $iditemarrivee, 1));
          }
      }
    }
  }
?>