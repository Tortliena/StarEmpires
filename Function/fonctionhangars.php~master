<?php
// Utiliser avec composanthangars(NOMTYPECOMPOSANT, $_SESSION['id'], $_GET['id'])
function composanthangars($typecomposant, $idjoueur, $idvaisseau)
  {
  include("include/BDDconnection.php");
  $reqcomposantsurlevaisseau
      = $bdd->prepare("
      SELECT i.nombatiment
      FROM gamer.composantvaisseau c
      INNER JOIN items i
      ON i.iditem = c.iditemcomposant
      WHERE c.idvaisseaucompo = ?
      AND c.typecomposant = ?
      ");

  echo '<h3>' . ucfirst($typecomposant) . ' :</h3>';

  $a = 0; ?> <!-- Variable permettant de gérer le cas avec 0 choix -->
  <form method="post" action="script/ordredeplacement.php">
    <p>
      <label for="idcomposant">
      <?php
      $composantexiste = false;
      $reqcomposantsurlevaisseau->execute(array($idvaisseau, $typecomposant));
      while($repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        echo ucfirst($repcomposantsurlevaisseau['nombatiment']);
        $composantexiste = true;
        }
      if ($composantexiste == false)
        {
        echo 'Pas d\'équipement particulier installé';
        }
        ?>
      </label>
      <select name="composant" id="idcomposant">

      <?php
      $reqsilo = $bdd->prepare("
                    SELECT s.quantite, i.nombatiment, i.iditem, i.souscategorie
                    FROM gamer.silo s
                    INNER JOIN items i
                    ON i.iditem = s.iditems
                    WHERE s.idjoueursilo = ?
                    AND i.souscategorie = ?");
      $reqsilo ->execute(array($idjoueur, $typecomposant));

      while($repsilo = $reqsilo->fetch())
        { 
        if ($repsilo['quantite']>0)
          {
          ?>
          <option value="<?php echo $repsilo['iditem']; ?>|<?php echo $repsilo['souscategorie']; ?>"><?php echo $repsilo['nombatiment']; ?></option>
          <?php
          $a++;
          } 
        }

      if ($a == 0)
        {
        echo '<option disabled selected>Pas de composant en stock</option>';
        }
      else
        {
        echo '<input name="idvaisseau" type="hidden" value="' . $idvaisseau . '"> ';
        echo '<input name="xobjectif" type="hidden" value="0">';
        echo '<input name="yobjectif" type="hidden" value="0">';
        echo '<input name="typeordre" type="hidden" value="6">';
        echo '<input type="submit" value="Échanger" />';
        } ?>
        </select>
     </p>
  </form><?php
  } // Fin de la fonction pour afficher les items.

// Utiliser avec annulerordrededeplacement($reponseordredeplacementactuel['typeordre'], $_GET['id'], $reponseordredeplacementactuel['xdestination'], $reponseordredeplacementactuel['ydestination'])
function annulerordrededeplacement($typeordre, $idvaisseau, $xdest, $ydest, $bloque)
  {
  switch ($typeordre)
    {
      case 0:
        $messageannulerdeplacement = 'Vous avez ordonné à votre vaisseau de se déplacer en ' . $xdest . '-' . $ydest . ' ';
      break;
      case 1:
        $messageannulerdeplacement = 'Vous avez ordonné à votre vaisseau de miner le champs d\'astéroides. ';
      break;
      case 2:
        $messageannulerdeplacement = 'Vous avez ordonné à votre vaisseau de décharger sa cargainson. ';
      break;
      case 3:
        $messageannulerdeplacement = 'Vous avez ordonné à votre vaisseau de rentrer en orbite de la planète mère. ';
      break;
      case 4:
        $messageannulerdeplacement = 'Vous avez ordonné à votre vaisseau de sortir de l\'orbite de la planète. ';
      break;
      case 5:
        $messageannulerdeplacement = 'Vous allez attaquer un vaisseau. ';
      break;
      case 6:
        include("include/BDDconnection.php");
        $reqcomposant = $bdd->prepare(" SELECT i.nombatiment FROM gamer.conceptionencours c
                                        INNER JOIN items i ON i.iditem = c.idnouvcomposant
                                        WHERE c.idvaisseauconception = ?");
        $reqcomposant ->execute(array($idvaisseau));
        $repcomposant = $reqcomposant->fetch();
        $messageannulerdeplacement = 'Vous êtes en train d\'équiper un "'.$repcomposant['nombatiment'].'". ';
      break;
      case 7:
        $messageannulerdeplacement = 'Votre vaisseau est en réparation. ';
      break;
      case 8:
        $messageannulerdeplacement = 'Votre vaisseau est actuellement occupé et ne réponds pas à vos tentatives de communication. ';
      break;
      case 10:
        $messageannulerdeplacement = 'Votre vaisseau prépare un saut dimensionnel. ';
      break;
      case 11:
        $messageannulerdeplacement = 'Conquête/colonisation en cours. ';
      break;
      default :
        $messageannulerdeplacement = 'ORDRE NON PREVU ! Voir fonction hangars/annuler ';
      break;
    }
    echo '<form method="post" action="script/ordredeplacement.php"><p>';
    echo $messageannulerdeplacement ;
    echo '<input name="idvaisseau" type="hidden" value="' . $idvaisseau . '">';
    if ($bloque == 1)
      {
      echo '<input type="hidden" name="confirmer" value="off"/>'; 
      echo '<input id = "checkbox" type="checkbox" name="confirmer"/> <label for="checkbox"></label>  '; 
      }
    echo '<input name="typeordre" type="hidden" value="-1">';
    echo '<input type="submit" value="Supprimer l\'ordre"/>';
    echo '</p></form>';
  }

function formulaireordredeplacement($typeordre, $idvaisseau, $texteexplication, $valeur1, $valeur2, $valeur3)
  {
  switch ($typeordre)
    {
    case 0:
      $texteexplication = '<input type="number" name="xobjectif" value="' . $valeur1 . '" min="1" max="' . $valeur3 . '"><input type="number" name="yobjectif" value="' . $valeur2 . '" min="1" max="' . $valeur3 . '">';
      $textevalidation = 'déplacer';
    break;
    case 1:
      $texteexplication = 'Votre vaisseau se trouve à proximité champs d\'astéroides. ';
      $textevalidation = 'Récolter';
    break;
    case 2:
      $textevalidation = 'Décharger';
    break;
    case 3:
      $texteexplication = 'Votre vaisseau se trouve à proximité d\'une de vos planètes. ';
      $textevalidation = 'Rentrer en orbite';
    break;
    case 4:
      $texteexplication = 'Votre vaisseau se trouve au hangars de la planète '.$valeur3.'. ';
      $textevalidation = 'Quitter l\'orbite';
    break;
    case 5:
      $textevalidation = 'Attaquer';
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
  echo '<input name="idvaisseau" type="hidden" value="' . $idvaisseau . '">';
  echo '<input type="submit" value="' . $textevalidation . '" />';
  echo '</p></form>';
  }
  ?>