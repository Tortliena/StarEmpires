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
      $texteexplication = 'Saut vers un univers : <select name="xobjectif" id="universdedestination"><option value="'.$valeur1.'">Univers mère</option><option value="-2">Danzalion (1er univers) </option><option value="-3">Catreal</option></select> ';
      $textevalidation = 'Sauter';
    break;
    case 3:
      $texteexplication = 'Un monde habité se trouve à proximité. ';
      $textevalidation = 'Envahir';
    break;
    case 5:
      $textevalidation = 'Attaquer';
    break;
    case 6:
      $texteexplication = '<input type="number" name="xobjectif" value="' . $valeur1 . '" min="1" max="' . $valeur3 . '"><input type="number" name="yobjectif" value="' . $valeur2 . '" min="1" max="' . $valeur3 . '">';
      $textevalidation = 'Déplacer';
    break;
    case 10:
      $texteexplication = 'Saut dimensionnel : ';
      $textevalidation = 'Sauter';
    break;
    case 11:
      $texteexplication = 'Un monde inhabité se trouve à proximité. ';
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
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de voyager vers une autre dimension. ';
      break;
      case 3:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte d\'envahir une planète. ';
      break;
      case 5:
        $messageannulerdeplacement = 'Vous allez attaquer une autre flotte. ';
      break;
      case 6:
        $messageannulerdeplacement = 'Vous avez ordonné à votre flotte de se déplacer en ' . $xdest . '-' . $ydest . ' ';
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

function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
  {
  echo '<form method="post" action="script/commercestation.php"><p>';
  echo 'Vendre des '.$nomitem.' pour '.$prixitem.'$ par unité : ';
  echo '<input name="idflotte" type="hidden" value="'.$idflotte.'">';
  echo '<input name="idstation" type="hidden" value="'.$idstation.'">';
  echo '<input name="iditem" type="hidden" value="'.$iditem.'">';
  echo '<input name="typetransaction" type="hidden" value="1">';
  echo '<input type="number" name="combien" min="1" max="'.$itemenstock.'" value="'.$itemenstock.'">';
  echo '<input type="submit" value="Vendre"/></p></form>';
  }

function acheterstation($idflotte, $idstation, $iditem, $maxpossible, $nomitem, $prixitem)
  {
  if ($maxpossible > 0)
    {
    echo '<form method="post" action="script/commercestation.php"><p>';
    echo 'Acheter des '.$nomitem . ' pour '.$prixitem.'$ par unité : ';
    echo '<input name="idflotte" type="hidden" value="'.$idflotte.'">';
    echo '<input name="iditem" type="hidden" value="'.$iditem.'">';
    echo '<input name="idstation" type="hidden" value="'.$idstation.'">';
    echo '<input name="typetransaction" type="hidden" value="2">';
    echo '<input type="number" name="combien" min="1" max="'.$maxpossible.'" value="'.$maxpossible.'">';  
    echo '<input type="submit" value="acheter"/></p></form>';
    }
  else
    {
    echo '<p>Pas assez d\'argent pour achetetr '.$nomitem . ' pour '.$prixitem.'$ par unité.</p>';
    }
  }
  ?>