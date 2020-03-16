<?php 
function structurevaisseau($idvaisseau) 
  { 
  include("include/BDDconnection.php"); 
  $structure = 1; 
  $reqcomposantsurlevaisseau = $bdd->prepare("  SELECT structure FROM gamer.composantvaisseau cv 
                                                INNER JOIN composant c ON c.idcomposant = cv.iditemcomposant 
                                                WHERE cv.idvaisseaucompo = ? AND c.typecomposant <> 'moteur'"); 
  $reqcomposantsurlevaisseau->execute(array($idvaisseau)); 
  while ($repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch()) 
    { 
    $structure = $structure + $repcomposantsurlevaisseau['structure']; 
    } 
 
  $reqmoteursurlevaisseau = $bdd->prepare(" SELECT structure FROM gamer.composantvaisseau cv 
                                            INNER JOIN composant c ON c.idcomposant = cv.iditemcomposant 
                                            WHERE cv.idvaisseaucompo = ? AND c.typecomposant = 'moteur' "); 
  $reqmoteursurlevaisseau->execute(array($idvaisseau)); 
  $repmoteursurlevaisseau = $reqmoteursurlevaisseau->fetch(); 
  $structuremax = 12 - $repmoteursurlevaisseau['structure']; 
 
  return array($structure, $structuremax); 
  } 
?>