<?php
function composantdesign($idjoueur, $typecomposant, $textepourrien)
  {
  include("include/BDDconnection.php");

  echo '<select name="' . $typecomposant . '" id="' . $typecomposant. '">'; 
  echo '<option value="0">' . $textepourrien . '</option>';

  $reqmenuderoulantdesign = $bdd->prepare('
      SELECT  items.iditem, items.nombatiment
      FROM gamer.rech_joueur
      RIGHT JOIN items
      ON rech_joueur.idrech = items.technescessaire
      WHERE rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1
      AND souscategorie = ? ');
  $reqmenuderoulantdesign->execute(array($idjoueur, $typecomposant));
  while ($repmenuderoulantdesign = $reqmenuderoulantdesign->fetch())
    {
    echo '<option value="' . $repmenuderoulantdesign['iditem'] . '">' . $repmenuderoulantdesign['nombatiment'] . '</option>' ;
    }

/*  $reqmenuderoulantartefact = $bdd->prepare('SELECT  items.iditem, items.nombatiment
      FROM gamer.silo
      RIGHT JOIN items
      ON silo.iditems = items.iditem
      WHERE silo.idjoueursilo = ? AND items.itemnecessaire > 0
      AND souscategorie = ?');

  $reqmenuderoulantartefact->execute(array($idjoueur, $typecomposant));
  while ($repmenuderoulantartefact = $reqmenuderoulantartefact->fetch())
    {
    echo '<option value="' . $repmenuderoulantartefact['iditem'] . '">' . $repmenuderoulantartefact['nombatiment'] . '</option>' ;
    }
  */
  echo '</select></br>'; 
  }
  ?>