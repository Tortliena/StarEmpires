<?php
function descriptioncompletevaisseau($idvaisseau, $idjoueur, $lvljoueur)
  {
  include("function/caracteristiquesvaisseau.php"); 
  require __DIR__ . '/../include/BDDconnection.php';
  list($structure, $structuremax) = structurevaisseau ($idvaisseau); 
  
  echo $structure.'/'.$structuremax.' de structure. </br>'; 
  
  $reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idvaisseau = ?'); 
  $reqvaiss->execute(array($idvaisseau)); 
  $repvaiss = $reqvaiss->fetch(); 

  $reqcomposantsurlevaisseau = $bdd->prepare("  SELECT COUNT(idtable) AS nb, i.nombatiment, c.iditemcomposant
                                                FROM gamer.composantvaisseau c 
                                                INNER JOIN items i ON i.iditem = c.iditemcomposant 
                                                WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?
                                                GROUP BY iditemcomposant"); 
  $reqcomposantsurlevaisseau->execute(array($idvaisseau, "moteur")); 
  $repmoteursurlevaisseau = $reqcomposantsurlevaisseau->fetch(); 
  if (isset($repmoteursurlevaisseau['nombatiment'])) 
    {
    echo $repmoteursurlevaisseau['nombatiment'].'&emsp;&emsp;Vitesse : '.$repvaiss['vitesse'] . ' parsec/cycle. </br>'; 
    } 
  else 
    { 
    echo 'Moteur I';
    echo '&emsp;&emsp;Vitesse : '.$repvaiss['vitesse'] . ' parsec/cycle. </br>';
    } 
    
    $a = 0;
    $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "soute")); 
  while($repsoutesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $a++;
        echo $repsoutesurlevaisseau['nb'].' '.$repsoutesurlevaisseau['nombatiment'] .'&emsp;' ; 
        }
    if ($a == 0)
      {
        echo 'Soute à échantillons : &emsp;' ; 
        }
    echo $repvaiss['capacitedesoute'] . ' places dans les soutes. </br>'; 

    echo 'Armement : '; 
    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "arme")); 
  while($reparmesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'] ; 
        $a++;
        }
    if ($a == 0) 
    { 
    echo 'Vaisseau non armé.<br>'; 
    } 
  echo $repvaiss['capaciteminage'] . ' capacité de minage. <br>'; 
  
    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "coque")); 
  while($repcoquesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repcoquesurlevaisseau['nb'].' '.$repcoquessurlevaisseau['nombatiment'] ; 
        $a++;
        }
    if ($a == 0)
    {
    echo 'Coque civile. ';
    }
  echo 'Total : '.$repvaiss['HPmaxvaisseau'] . ' PV.</br>';
  echo 'Prix : ';
  echo $repvaiss['biensvaisseau'] . ' biens';
  if ($repvaiss['titanevaisseau'] > 0)
    {
    echo ' et ' . $repvaiss['titanevaisseau'] . ' de titane';
    }
  echo '. </br></br>';
  // Fin du plan actuel :
  }


// Utiliser avec composanthangars(NOMTYPECOMPOSANT, $_SESSION['id'], $_GET['id'])
// Permet de proposer d'ajouter un composant.
function composantvaisseau($typecomposant, $idjoueur, $idvaisseau)
  {
  include("include/BDDconnection.php");
  $reqcomposantsurlevaisseau = $bdd->prepare("
    SELECT i.nombatiment FROM gamer.composantvaisseau c
    INNER JOIN items i ON i.iditem = c.iditemcomposant
    WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?");

  echo '<h3>' . ucfirst($typecomposant) . ' :</h3>';

  $a = 0; // Variable permettant de gérer le cas avec 0 choix -->
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