<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

// Trouver les flotte qui n'ont pas de vaisseau et trouver leur ID.
$reqrepositionnersurlaplanetemere = $bd->prepare('UPDATE c_flotte SET xflotte = ?, yflotte = ?, universflotte = ?, universdestination = 0, xdestination = 0,   ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');
$reqpositionplanetemere = $bd->prepare('SELECT xplanete, yplanete, universplanete FROM c_planete WHERE idplanete = ?');
$reqsupprimerflotte = $bd->prepare('DELETE FROM c_flotte WHERE idflotte = ?');
$reqsupprimerbataille = $bd->prepare('DELETE FROM c_bataille WHERE idflottedefensive = ? OR idflotteoffensive = ?');

$reqflottesansvaisseau = $bd->query('SELECT f.idflotte, f.idplaneteflotte FROM c_flotte f LEFT JOIN c_vaisseau v ON f.idflotte = v.idflottevaisseau WHERE v.idflottevaisseau IS NULL');
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

$requpdateordre = $bd->prepare('UPDATE c_flotte SET universdestination = 0, xdestination = 0, ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');

$reqflotteattaquesanscible = $bd->query('SELECT f.idflotte FROM c_flotte f LEFT JOIN c_bataille b ON b.idflotteoffensive = f.idflotte WHERE b.idbataille IS NULL AND typeordre = 5'); // type ordre 5 = bataille
while ($repflotteattaquesanscible = $reqflotteattaquesanscible->fetch())
  {
  $requpdateordre->execute(array($repflotteattaquesanscible['idflotte']));
  }
?>