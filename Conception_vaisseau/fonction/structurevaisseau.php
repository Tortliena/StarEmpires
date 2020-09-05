<?php
function structurevaisseau($idvaisseau)
  { // Utiliser pour afficher au joueur la structure
  require __DIR__ . '/../../include/bddconnection.php';
  $structure = 1;
  $reqcomposantsurlevaisseau = $bd->prepare("  SELECT structure FROM c_composantvaisseau cv
                                                INNER JOIN a_composant c ON c.idcomposant = cv.iditemcomposant
                                                WHERE cv.idvaisseaucompo = ? AND c.typecomposant <> 'moteur'");
  $reqcomposantsurlevaisseau->execute(array($idvaisseau));
  while ($repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch())
    {
    $structure = $structure + $repcomposantsurlevaisseau['structure'];
    }

  $reqmoteursurlevaisseau = $bd->prepare("  SELECT structure FROM c_composantvaisseau cv
                                            INNER JOIN a_composant c ON c.idcomposant = cv.iditemcomposant
                                            WHERE cv.idvaisseaucompo = ? AND c.typecomposant = 'moteur' ");
  $reqmoteursurlevaisseau->execute(array($idvaisseau));
  $repmoteursurlevaisseau = $reqmoteursurlevaisseau->fetch();
  $structuremax = 12 - $repmoteursurlevaisseau['structure'];

  return array($structure, $structuremax);
  }
?>