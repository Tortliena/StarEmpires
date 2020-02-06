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
      case 6:
        $messageannulerdeplacement = 'Vous venez juste de débuter la rénovation du vaisseau. ';
      break;
      case 7:
        $messageannulerdeplacement = 'Votre vaisseau est en réparation. ';
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

function formulaireordredeplacement($typeordre, $idvaisseau, $texteexplication)
  {
  switch ($typeordre)
    {
    case 1:
      $texteexplication = 'Votre vaisseau se trouve à proximité champs d\'astéroides. ';
      $textevalidation = 'Récolter';
    break;
    case 2:
      $textevalidation = 'Décharger';
    break;
    case 3:
      $texteexplication = 'Votre vaisseau se trouve à proximité de votre planète mère (3 - 3). ';
      $textevalidation = 'Rentrer en orbite';
    break;
    case 4:
      $texteexplication = 'Votre vaisseau se trouve à proximité de votre planète. ';
      $textevalidation = 'Quitter l\'orbite';
    break;
    case 7:
      $textevalidation = 'Réparer';
    break;
    }

  echo '<form method="post" action="script/ordredeplacement.php"><p>';
  echo $texteexplication ;
  echo '<input name="typeordre" type="hidden" value="' . $typeordre . '">';
  echo '<input name="idvaisseau" type="hidden" value="' . $idvaisseau . '">';
  echo '<input name="xobjectif" type="hidden" value="0">';
  echo '<input name="yobjectif" type="hidden" value="0">';
  echo '<input type="submit" value="' . $textevalidation . '" />';
  echo '</p></form>';
  }
  ?>