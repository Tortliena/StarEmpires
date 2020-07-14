<?php
function formulaireordredeplacement($typeordre, $idflotte, $texteexplication, $valeur1, $valeur2, $valeur3)
  {
  switch ($typeordre)
    {
    case 1:
      $texteexplication = 'Votre flotte se trouve à proximité champs d\'astéroides. ';
      $textevalidation = 'Récolter';
    break;
    case 2:
      $textevalidation = 'Décharger';
    break;
    case 3:
      $texteexplication = 'Votre flotte se trouve à proximité d\'une de vos planètes. ';
      $textevalidation = 'Rentrer en orbite';
    break;
    case 4:
      $texteexplication = 'Votre flotte se trouve au hangars de la planète '.$valeur3.'. ';
      $textevalidation = 'Quitter l\'orbite';
    break;
    case 5:
      $textevalidation = 'Attaquer';
    break;
    case 6:
      $texteexplication = '<input type="number" name="xobjectif" value="' . $valeur1 . '" min="1" max="' . $valeur3 . '"><input type="number" name="yobjectif" value="' . $valeur2 . '" min="1" max="' . $valeur3 . '">';
      $textevalidation = 'déplacer';
    break;
    case 7:
      $textevalidation = 'Réparer';
    break;
    case 10:
      $texteexplication = 'Saut dimensionnel : ';
      $textevalidation = 'Sauter';
    break;
    case 11:
      $texteexplication = 'Un monde se trouve à proximité : ';
      $textevalidation = 'Coloniser';
    break;
    default :
      $textevalidation = 'ORDRE NON PREVU ! Voir fonction hangars/ordre ';
    break;
    }

  echo '<form method="post" action="script/ordredeplacement.php"><p>';
  echo '<input name="xobjectif" type="hidden" value="' . $valeur1 . '">';
  echo '<input name="yobjectif" type="hidden" value="' . $valeur2 . '">';
  echo $texteexplication ;
  echo '<input name="typeordre" type="hidden" value="' . $typeordre . '">';
  echo '<input name="idflotte" type="hidden" value="' . $idflotte . '">';
  echo '<input type="submit" value="' . $textevalidation . '" />';
  echo '</p></form>';
  }

// Utiliser avec annulerordrededeplacement($reponseordredeplacementactuel['typeordre'], $_GET['id'], $reponseordredeplacementactuel['xdestination'], $reponseordredeplacementactuel['ydestination'])
function annulerordrededeplacement($typeordre, $idflotte, $xdest, $ydest, $bloque)
  {
  switch ($typeordre)
    {
      case 1:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de miner le champs d\'astéroides. ';
      break;
      case 2:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de décharger sa cargainson. ';
      break;
      case 3:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de rentrer en orbite de la planète mère. ';
      break;
      case 4:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de sortir de l\'orbite de la planète. ';
      break;
      case 5:
        $messageannulerdeplacement = 'Vous allez attaquer une autre flotte. ';
      break;
      case 6:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de se déplacer en ' . $xdest . '-' . $ydest . ' ';
       
        /* ancien code 6 = changer composants.
        include("include/BDDconnection.php");
        $reqcomposant = $bdd->prepare(" SELECT i.nombatiment FROM gamer.conceptionencours c
                                        INNER JOIN items i ON i.iditem = c.idnouvcomposant
                                        WHERE c.idvaisseauconception = ?");
        $reqcomposant ->execute(array($idflotte));
        $repcomposant = $reqcomposant->fetch();
        $messageannulerdeplacement = 'Vous êtes en train d\'équiper un "'.$repcomposant['nombatiment'].'". ';
        */
      break;
      case 7:
        $messageannulerdeplacement = 'Votre flotte est en réparation. ';
      break;
      case 8:
        $messageannulerdeplacement = 'Votre flotte est actuellement occupée et ne réponds pas à vos tentatives de communication. ';
      break;
      case 10:
        $messageannulerdeplacement = 'Votre flotte prépare un saut dimensionnel. ';
      break;
      case 11:
        $messageannulerdeplacement = 'Colonisation en cours. ';
      break;
      default :
        $messageannulerdeplacement = 'ORDRE NON PREVU ! Voir fonction hangars/annuler ';
      break;
    }
    echo '<form method="post" action="script/ordredeplacement.php"><p>';
    echo $messageannulerdeplacement ;
    echo '<input name="idflotte" type="hidden" value="' . $idflotte . '">';
    if ($bloque == 1)
      {
      echo '<input type="hidden" name="confirmer" value="off"/>'; 
      echo '<input id = "checkbox" type="checkbox" name="confirmer"/> <label for="checkbox"></label>  '; 
      }
    echo '<input name="typeordre" type="hidden" value="-1">';
    echo '<input type="submit" value="Supprimer l\'ordre"/>';
    echo '</p></form>';
  }

  ?>