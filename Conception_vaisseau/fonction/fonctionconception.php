<?php
function composantdesign($idjoueur, $typecomposant, $textepourrien)
  {
  require __DIR__ . '/../../include/bddconnection.php';

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

  $reqmenuderoulantdesign = $bd->prepare('SELECT i.iditem, i.nombatiment
                                          FROM c_rech_joueur rj
                                          RIGHT JOIN a_items i ON rj.idrech = i.technescessaire
                                          WHERE rj.idjoueurrecherche = ? AND rj.rechposs = 1
                                          AND i.souscategorie = ? ');
  $reqmenuderoulantdesign->execute(array($idjoueur, $typecomposant));
  while ($repmenuderoulantdesign = $reqmenuderoulantdesign->fetch())
    {
    echo '<option value="' . $repmenuderoulantdesign['iditem'] . '">' . $repmenuderoulantdesign['nombatiment'] . '</option>' ;
    $a++;
    }

  $reqmenuderoulantartefact = $bd->prepare('SELECT i.iditem, i.nombatiment FROM c_silo s 
                                            LEFT JOIN a_items i ON s.iditems = i.iditem
                                            INNER JOIN c_planete p ON p.idplanete = s.idplanetesilo
                                            WHERE p.idjoueurplanete = ? AND i.itemnecessaire != 0 AND i.souscategorie = ?');
                                            // i.itemnecessaire != 0 = évite les répétition avec les items dont on a la tech. Par contre, si on a l'item, et que l'item est associée à une tech, on va pas pouvoir le voir si on a pas la tech.
  $reqmenuderoulantartefact->execute(array($idjoueur, $typecomposant));
  while ($repmenuderoulantartefact = $reqmenuderoulantartefact->fetch())
    {
    echo '<option value="' . $repmenuderoulantartefact['iditem'] . '">' . $repmenuderoulantartefact['nombatiment'] . '</option>' ;
    $a++; 
    }

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

function remplacercomposant($idjoueur, $typecomposant, $textepourrien, $idcomposantactuel)
  {
  require __DIR__ . '/../../include/bddconnection.php';
  $a = 0; 
  echo '<form method="post" action="script/creerdesign.php"><p>';
  echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
  echo '<select name="remplacementcomposant">';
  echo '<option value="'.$idcomposantactuel.'_-1">'.$textepourrien.'</option>';

$reqmenuderoulantdesign = $bd->prepare('SELECT i.iditem, i.nombatiment
                                        FROM c_rech_joueur rj
                                        RIGHT JOIN a_items i ON rj.idrech = i.technescessaire
                                        WHERE rj.idjoueurrecherche = ? AND rj.rechposs = 1
                                        AND i.souscategorie = ? ');
  $reqmenuderoulantdesign->execute(array($idjoueur, $typecomposant));
  while ($repmenuderoulantdesign = $reqmenuderoulantdesign->fetch())
    {
    echo '<option value="'.$repmenuderoulantdesign['iditem'].'_0">' . $repmenuderoulantdesign['nombatiment'] . '</option>' ;
    $a++;
    }

  $reqmenuderoulantartefact = $bd->prepare('SELECT i.iditem, i.nombatiment 
                                            FROM c_silo s
                                            LEFT JOIN a_items i ON s.iditems = i.iditem
                                            INNER JOIN c_planete p ON p.idplanete = s.idplanetesilo
                                            WHERE p.idjoueurplanete = ? AND i.itemnecessaire != 0 AND i.souscategorie = ?');
                                            // i.itemnecessaire != 0 = évite les répétition avec les items dont on a la tech. Par contre, si on a l'item, et que l'item est associée à une tech, on va pas pouvoir le voir si on a pas la tech.
  $reqmenuderoulantartefact->execute(array($idjoueur, $typecomposant));
  while ($repmenuderoulantartefact = $reqmenuderoulantartefact->fetch())
    {
    echo '<option value="'.$repmenuderoulantartefact['iditem'].'_0">' . $repmenuderoulantartefact['nombatiment'] . '</option>' ;
    $a++; 
    }
  echo '</select>&ensp;<input type="submit" value="Remplacer" /></p></form>' ;
  }

function Supprimercomposant($typecomposant, $texte)
    {
    include("../include/bddconnection.php");
    echo '<form method="post" action="script/creerdesign.php"><p>';
    echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
    echo '<input type="hidden" name="iditem" value="'.$typecomposant.'"> ';
    echo '<input type="hidden" name="nombre" value="-1"> ';
    echo '<label for="formulaire">'.$texte.'</label>';
    echo '<input type="submit" id="formulaire" value="Supprimer" /></p></form>' ;
    }
?>