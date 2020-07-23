<?php
function composantdesign($idjoueur, $typecomposant, $textepourrien)
  {
  require __DIR__ . '/../include/BDDconnection.php';

  $a = 0;

  if ($typecomposant != 'moteur' AND $typecomposant != 'noyau')
    {
    echo '<form method="post" action="script/creerdesign.php"><p>';
    echo '<input type="number" name="nombre" min="1" value="1"> ';
    echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
    echo '<select name="iditem">';
    }

  else
    { // Cas des moteurs et des noyaux.
    echo '<select name="' . $typecomposant . '" id="' . $typecomposant. '">';
    echo '<option value="0">' . $textepourrien . '</option>';
    }

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
    $a++;
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
    $a++; 
    } 
  */ 

  if ($typecomposant != 'moteur' AND $typecomposant != 'noyau')
    {
    if ($a == 0)
      {
      echo '<option value="0" disabled selected>' . $textepourrien . '</option>';
      echo '</select></p></form>' ;
      }
    else
      {
      echo '</select>&ensp;<input type="submit" value="Ajouter" /></p></form>' ;
      }
    }

  else
    { // Cas des moteurs et des noyaux.
    echo '</select></br>';
    }
  }

function Supprimercomposant($typecomposant, $texte)
    {
    include("include/BDDconnection.php");
    echo '<form method="post" action="script/creerdesign.php"><p>';
    echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
    echo '<input type="hidden" name="iditem" value="'.$typecomposant.'"> ';
    echo '<input type="hidden" name="nombre" value="-1"> ';
    echo '<label for="formulaire">'.$texte.'</label>';
    echo '<input type="submit" id="formulaire" value="Supprimer" /></p></form>' ;
    }
?>