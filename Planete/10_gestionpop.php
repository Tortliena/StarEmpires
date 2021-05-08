<?php
// Gestion tranformation des pop :
echo '<br><form method="post" action="script/conversionpop.php"><p>'; 
echo '<label for="combien">Convertir </label><input type="number" name="combien" min="1" value="1">'; 
echo '<select name="popdepart" id="popdepart">'; 
$reqtypepop = $bd->query('SELECT idtypepop , nompop FROM a_typepop ORDER BY idtypepop ASC'); 
while ($reptypepop = $reqtypepop->fetch()) 
  { 
  echo '<option value="'. $reptypepop['idtypepop'] . '">'. $reptypepop['nompop'] .'</option>';  
  } 
echo '</select><label for="poparrivee"> en </label><select name="poparrivee" id="poparrivee">'; 
$reqtypepop = $bd->query('SELECT idtypepop, nompop FROM a_typepop ORDER BY idtypepop DESC'); 
while ($reptypepop = $reqtypepop->fetch()) 
  { 
  echo '<option value="'. $reptypepop['idtypepop'] . '">'. $reptypepop['nompop'] .'</option>';  
  } 
echo '</select><input type="hidden" name="idplanete" value="'.$_GET['id'].'">&nbsp;<input type="hidden" name="supprimer" value="non"><input type="submit" value="Valider"/></p></form>'; 
 
// Permet de visualiser les ordres de conversion de pop en cours.  
$reqpoptransf = $bd->prepare('SELECT p.typepop, p.typepoparrivee, p.idpop, t.nompop AS depart, y.nompop AS arrivee 
                              FROM c_population p 
                              INNER JOIN a_typepop t ON t.idtypepop = p.typepop 
                              INNER JOIN a_typepop y ON y.idtypepop = p.typepoparrivee 
                              WHERE idplanetepop = ? AND typepoparrivee <> 0'); 
// Ouha putain c'est bon de faire une triple table avec deux fois la même table ! ! ! ! :) Je sens que je m'améliore. 
$reqpoptransf->execute(array($_GET['id'])); 
while ($reppoptransf = $reqpoptransf->fetch()) 
  { 
  echo '<form method="post" action="script/conversionpop.php">'; 
  echo '<input type="hidden" name="supprimer" value="oui">'; 
  echo '<input type="hidden" name="idplanete" value="'.$_GET['id'].'">'; 
  echo '<input type="hidden" name="idpop" value="'.$reppoptransf['idpop'].'">'; 
  echo 'Vous êtes en train de transformer un ' . $reppoptransf['depart'] . ' en ' . $reppoptransf['arrivee'] ; 
  echo ' <input type="submit" value="Annuler"/></form></br>'; 
  }
?>