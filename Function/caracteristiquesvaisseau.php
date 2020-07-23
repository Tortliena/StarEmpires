<?php
function caracteristiquesvaisseau ($idvaisseau)
    {
    require __DIR__ . '/../include/BDDconnection.php';
    $totalprixbien = 40;
    $totalprixtitane = 0;
    $capacitedesoute = 0;
    $capaciteminage = 0;
    $HPvaisseau = 3;
    $structure = -11;
    $vitesse = 1;

    $reqinformationcomposant = $bdg ->prepare('
      SELECT c.idcomposant, c.typebonus, c.totalbonus, c.HPcomposant, i.coutbien, i.couttitane, c.structure
      FROM gamer.composantvaisseau cv
      INNER JOIN datawebsite.composant c ON cv.iditemcomposant = c.idcomposant
      INNER JOIN datawebsite.items i ON cv.iditemcomposant = i.iditem
      WHERE cv.idvaisseaucompo = ?');
    $reqinformationcomposant->execute(array($idvaisseau));
    while ($repinformationcomposant = $reqinformationcomposant->fetch())
        {
        if ($repinformationcomposant['typebonus'] > 0)
            {
            switch ($repinformationcomposant['typebonus'])
                {
                case 1: // 1 = bonus à la vitesse.
                $vitesse = $repinformationcomposant['totalbonus'];
                break;

                case 2: // capacité des soutes.
                $capacitedesoute = $repinformationcomposant['totalbonus'] + $capacitedesoute ;
                break;

                case 3: // capacité du minage.
                $capaciteminage = $repinformationcomposant['totalbonus'];
                break;
                }
            }
        $HPvaisseau = $HPvaisseau + $repinformationcomposant['HPcomposant'];
        $totalprixbien = $totalprixbien + $repinformationcomposant['coutbien'];
        $totalprixtitane = $totalprixtitane + $repinformationcomposant['couttitane'];
        $structure = $repinformationcomposant['structure'] + $structure;
        }

    $capacitedesoute = MAX($capacitedesoute, 1);

    if ($idvaisseau > 0) // On passe par cette partie seulement durant le tour normalement.
        {
        $reqPVvaisseau = $bdg ->prepare('SELECT HPmaxvaisseau FROM vaisseau WHERE idvaisseau = ?');
        $reqPVvaisseau->execute(array($idvaisseau));
        $repPVvaisseau = $reqPVvaisseau->fetch();

        $requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ?, structure = ? WHERE idvaisseau = ?'); 
        $requpdatedesignvaisseau->execute(array($totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $structure, $idvaisseau));
        
        if ($repPVvaisseau['HPmaxvaisseau'] != $HPvaisseau)
            {
            // echo 'On passe par la boucle permettant de changer les PV. PV max avant : '.$repPVvaisseau['HPmaxvaisseau'].'. PV max apres et appliques : '.$HPvaisseau.'.<br>';
            $requpdatePVvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
            $requpdatePVvaisseau->execute(array($HPvaisseau, $idvaisseau));
            }
        }
    else
        {
        return array ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $structure, $HPvaisseau);
        // list ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $structure, $HPvaisseau) = caracteristiquesvaisseau ($idvaisseau);
        }
    }

function structurevaisseau($idvaisseau) 
  { // Utiliser pour afficher au joueur la structure
  require __DIR__ . '/../include/BDDconnection.php';
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