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
  ?>