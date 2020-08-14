<?php
/*
session_start();
require __DIR__ . '/../include/BDDconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

// Trouver les flotte qui n'ont pas de vaisseau et trouver leur ID.
$reqrepositionnersurlaplanetemere = $bdg->prepare('UPDATE flotte SET xflotte = ?, yflotte = ?, universflotte = ?, universdestination = 0, xdestination = 0,   ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');
$reqpositionplanetemere = $bdg->prepare('SELECT xplanete, yplanete, universplanete FROM planete WHERE idplanete = ?');
$reqsupprimerflotte = $bdg->prepare('DELETE FROM flotte WHERE idflotte = ?');
$reqsupprimerbataille = $bdg->prepare('DELETE FROM bataille WHERE idflottedefensive = ? OR idflotteoffensive = ?');

$reqflottesansvaisseau = $bdg->query('SELECT f.idflotte, f.idplaneteflotte FROM flotte f LEFT JOIN vaisseau v ON f.idflotte = v.idflottevaisseau WHERE v.idflottevaisseau IS NULL');
while ($repflottesansvaisseau = $reqflottesansvaisseau->fetch())
  {
  $idplanete = abs($repflottesansvaisseau['idplaneteflotte']);
  $reqpositionplanetemere->execute(array($idplanete));
  $reppositionplanetemere = $reqpositionplanetemere->fetch();
  if (isset($reppositionplanetemere['xplanete']))
    {
    $reqrepositionnersurlaplanetemere->execute(array($reppositionplanetemere['xplanete'], $reppositionplanetemere['yplanete'], $reppositionplanetemere['universplanete'], $repflottesansvaisseau['idflotte']));
    }
  else
    {
    $reqsupprimerflotte->execute(array($repflottesansvaisseau['idflotte']));
    }
  $reqsupprimerbataille->execute(array($repflottesansvaisseau['idflotte'], $repflottesansvaisseau['idflotte']));
  }

$requpdateordre = $bdg->prepare('UPDATE flotte SET universdestination = 0, xdestination = 0, ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');

$reqflotteattaquesanscible = $bdg->query('SELECT f.idflotte FROM flotte f LEFT JOIN bataille b ON b.idflotteoffensive = f.idflotte WHERE b.idbataille IS NULL AND typeordre = 5'); // type ordre 5 = bataille
while ($repflotteattaquesanscible = $reqflotteattaquesanscible->fetch())
  {
  $requpdateordre->execute(array($repflotteattaquesanscible['idflotte']));
  }
?>