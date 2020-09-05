<?php
function consommercreeritemsplanetemultiple($iditemdepart, $iditemarrivee, $idplanete, $nbdefois)
  {
  require __DIR__ . '/../include/bddconnection.php';
  // Gestion silo :
  $reqverifsilo = $bd->prepare('SELECT quantite, idsilo FROM c_silo WHERE idplanetesilo = ? AND iditems = ?');
  $reqcreersilo = $bd->prepare('INSERT INTO c_silo (idplanetesilo, iditems, quantite) VALUES (?, ?, ?)');
  $diminutionsilo = $bd->prepare('UPDATE c_silo SET quantite = quantite - 1 WHERE idsilo = ?' );
  $augmentersilo = $bd->prepare('UPDATE c_silo SET quantite = quantite + 1 WHERE idsilo = ?' );
  $reqsupprimersilo = $bd->prepare('DELETE FROM c_silo WHERE idsilo = ?');

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