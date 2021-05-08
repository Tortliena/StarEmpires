<?php
function descriptioncompletevaisseau($idvaisseau, $idjoueur, $lvljoueur)
  {
  require __DIR__ . '/../../include/bddconnection.php';
  list($structure, $structuremax) = structurevaisseau($idvaisseau);

  echo $structure.'/'.$structuremax.' de structure. </br>';
  
  $reqvaiss = $bd->prepare('SELECT * FROM c_vaisseau WHERE idvaisseau = ?');
  $reqvaiss->execute(array($idvaisseau));
  $repvaiss = $reqvaiss->fetch();

  $reqcomposantsurlevaisseau = $bd->prepare("   SELECT COUNT(idtable) AS nb, i.nombatiment, c.iditemcomposant
                                                FROM c_composantvaisseau c 
                                                INNER JOIN a_items i ON i.iditem = c.iditemcomposant 
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

  $reqcomposantsurlevaisseau->execute(array($idvaisseau, "noyau"));
  $repnoyausurlevaisseau = $reqcomposantsurlevaisseau->fetch();
  if (isset($repnoyausurlevaisseau['nombatiment']))
    {
    echo $repnoyausurlevaisseau['nombatiment'].'<br>';
    }
  else
    {
    echo 'Pas de noyau<br>';
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
        if ($a==0)
          {
          $texte = $reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'] ; 
          }
        else
          {
          $texte .= ', '.$reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'] ; 
          }
        $a++;
        }
  if ($a == 0)
    { 
    echo 'Vaisseau non armé.<br>'; 
    }
  else
    { 
    echo $texte.'<br>'; 
    }
  echo $repvaiss['capaciteminage'] . ' capacité de minage. <br>'; 

  $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "autre")); 
  while($repmodules = $reqcomposantsurlevaisseau->fetch())
    {
    echo $repmodules['nombatiment'] .'<br>' ; 
    }
  
  $a = 0; // Voir plus tard pour refaire cette partie.
  $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "coque")); 
  while($repcoquesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repcoquesurlevaisseau['nb'].' '.$repcoquesurlevaisseau['nombatiment'] ; 
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

function modificationvaisseau($idvaisseau, $idjoueur, $lvljoueur, $typedepage)
  { //$typedepage : Si 1, alors page vaisseau, si 2, alors page conception.
  require __DIR__ . '/../../include/bddconnection.php';
  // Début du plan modifié :
  echo '<h3>Modifications en cours :</h3>'; 

  list($structure, $structuremax) = structurevaisseau (-$idvaisseau);
  echo $structure.'/'.$structuremax.' de structure. </br>';

  list ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $HPvaisseau) = caracteristiquesvaisseau (-$idvaisseau);

  $reqcomposantsurlevaisseau = $bd->prepare("   SELECT COUNT(idtable) AS nb, i.nombatiment, c.iditemcomposant, c.typecomposant
                                                FROM c_composantvaisseau c 
                                                LEFT JOIN a_items i ON i.iditem = c.iditemcomposant 
                                                WHERE c.idvaisseaucompo = ? AND c.typecomposant like ?
                                                GROUP BY iditemcomposant");
  
  // Partie qui gère le cas ou il n'y a acutellement pas de plan en cours de modification : Permet de créer un plan identique à celui actuel.
  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, '%'));
  $repmodifplanexiste = $reqcomposantsurlevaisseau->fetch();
  $reqcomposantsurlevaisseau->execute(array($idvaisseau, '%'));
  $repplanorigineaquelquechose = $reqcomposantsurlevaisseau->fetch();

  if (!isset($repmodifplanexiste['iditemcomposant']) AND isset($repplanorigineaquelquechose['nombatiment']))
    {
    $reqrecreerplanoriginal = $bd->prepare('INSERT INTO c_composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 
    $reqcomposantsurlevaisseau->execute(array($idvaisseau, '%'));
    while($repcomposantvaisseauoriginal = $reqcomposantsurlevaisseau->fetch())
      {
      for ($i = 1; $i <= $repcomposantvaisseauoriginal['nb']; $i++)
        {
        $reqrecreerplanoriginal->execute(array(-$idvaisseau, $repcomposantvaisseauoriginal['iditemcomposant'], $repcomposantvaisseauoriginal['typecomposant']));
        }
      }
    $reqrecreerplanoriginal->execute(array(-$idvaisseau, 0, 'rien'));
    if($typedepage == 1)
      {
      header("Location: vaisseau.php?message=".urlencode($_GET['message'])."&id=" . urlencode($_GET['id']));
      }
    elseif($typedepage == 2)
      {
      header("Location: conception.php?message=".urlencode($_GET['message'])."&id=" . urlencode($_GET['id']));
      }
    exit; 
    }

  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, "moteur")); 
  $repmoteursurlevaisseau = $reqcomposantsurlevaisseau->fetch();
  if (isset($repmoteursurlevaisseau['nombatiment']))
    {
    echo $repmoteursurlevaisseau['nombatiment'].'&emsp;&emsp;Vitesse : '.$vitesse. ' parsec/cycle.';
    } 
  else 
    { 
    echo 'Moteur I';
    echo '&emsp;&emsp;Vitesse : '.$vitesse. ' parsec/cycle.';
    }
  remplacercomposant($_SESSION['id'], 'moteur', 'Moteur I', $repmoteursurlevaisseau['iditemcomposant']);
  
  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, "noyau")); 
  $repnoyausurlevaisseau = $reqcomposantsurlevaisseau->fetch();
  if (isset($repnoyausurlevaisseau['nombatiment']))
    {
    echo $repnoyausurlevaisseau['nombatiment']; 
    } 
  else 
    { 
    echo 'Pas de noyau ';
    }
  remplacercomposant($_SESSION['id'], 'noyau', 'Pas de noyau', $repnoyausurlevaisseau['iditemcomposant']);
  
  $a = 0;
  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, "soute"));
  while($repsoutesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $a++;
        $texte = $repsoutesurlevaisseau['nb'].' '.$repsoutesurlevaisseau['nombatiment'].'&emsp;';
        Supprimercomposant($repsoutesurlevaisseau['iditemcomposant'], $texte);
        }
    if ($a == 0)
      {
        echo 'Soute à échantillons : &emsp;' ;
        }
  echo $capacitedesoute . ' places dans les soutes. </br>';

  echo 'Armement : ';
  $a = 0;
  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, "arme"));
  while($reparmesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'].'&emsp;';
        Supprimercomposant($reparmesurlevaisseau['iditemcomposant'], $texte);
        $a++;
        }
    if ($a == 0)
    { 
    echo 'Vaisseau non armé.<br>';
    } 
  echo $capaciteminage . ' capacité de minage. <br>';

  $a = 0;
  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, "coque"));
  while($repcoquesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repcoquesurlevaisseau['nb'].' '.$repcoquesurlevaisseau['nombatiment'].'&emsp;';
        Supprimercomposant($repcoquesurlevaisseau['iditemcomposant'], $texte);
        $a++;
        }
    if ($a == 0)
    {
    echo 'Coque civile. ';
    }

  $reqcomposantsurlevaisseau->execute(array(-$idvaisseau, "autre")); 
  while($repautresurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repautresurlevaisseau['nb'].' '.$repautresurlevaisseau['nombatiment'].'&emsp;';
        Supprimercomposant($repautresurlevaisseau['iditemcomposant'], $texte);
        }

  echo 'Total : '.$HPvaisseau . ' PV.</br>';
  echo 'Prix : '.$totalprixbien.' biens';
  if ($totalprixtitane > 0)
    {
    echo ' et ' . $totalprixtitane . ' de titane';
    }
  echo '. </br></br>';
  // Fin du plan modifié
  
  // Début modification :
  composantdesign($_SESSION['id'], 'arme', 'Pas d\'arme disponible');
  composantdesign($_SESSION['id'], 'coque', 'Pas de coque disponible');
  composantdesign($_SESSION['id'], 'soute', 'Pas de soute disponible');
  composantdesign($_SESSION['id'], 'autre', 'Pas de module complémentaire disponible');
  
  if ($structure <= $structuremax)
    {
    echo '<form method="post" action="script/validerplan.php"><p>';
    echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
    echo '<input type="submit" id="formulaire" value="Valider les modifications" /></p></form>' ;
    }
  else
    {
    echo 'Impossible de valider (structure incorrecte)';
    }
  
  return array ($structure, $structuremax);
  }
  ?>