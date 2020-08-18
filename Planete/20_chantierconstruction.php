<?php
echo '</br><h2>Chantier de construction :</h2>';

// Début formulaire pour les constructions.
$a = 0; //Variable permettant de gérer le cas avec 0 construction possible.
echo '<form method="post" action="script/ordreconstruction.php"><p><label for="combien">Construire </label>';
echo '<input type="number" name="combien" value="1" min="1">';
echo '<select name="trucaconstruire" id="trucaconstruire">';

// Requête pour la liste de construction et basé sur la présence d'un item.
$reqmenuderoulantitems = $bdg->prepare('
        SELECT  items.iditem, items.nombatiment
        FROM silo
        RIGHT JOIN datawebsite.items
        ON items.itemnecessaire = silo.iditems
        WHERE silo.idplanetesilo = ? AND silo.quantite > 0 AND items.typeitem = "autre"
        ');
$reqmenuderoulantitems->execute(array($_GET['id']));
while ($repmenuderoulantitems = $reqmenuderoulantitems ->fetch())
    { // Gestion des trucs ayant besoin d'un machin dans les stocks.
    $a++;
    echo '<option value="'.$repmenuderoulantitems['iditem'].'">'.$repmenuderoulantitems['nombatiment'].'</option>';
    }

$reqcountbatatiment = $bdg->prepare('SELECT COUNT(*) AS nb FROM batiment WHERE idplanetebat = ? AND typebat = ?');
// Requete pour la liste de construction et basé sur une limite :
$reqmenuderoulantconstruction = $bdd->prepare('
        SELECT  items.iditem, items.nombatiment, items.nomlimite FROM gamer.rech_joueur
        RIGHT JOIN items ON rech_joueur.idrech = items.technescessaire
        WHERE (items.technescessaire = 0 OR (rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1))
        AND (items.typeitem <> "autre" AND items.typeitem <> "artefact")');
$reqmenuderoulantconstruction->execute(array($_SESSION['id']));
while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
    {
    if(isset($repmenuderoulantconstruction['nomlimite']))
        {
        $limite = $repplanete["{$repmenuderoulantconstruction['nomlimite']}"] ;
        $reqcountbatatiment->execute(array($_GET['id'], $repmenuderoulantconstruction['iditem']));
        $repcountbatatiment = $reqcountbatatiment->fetch();
        }

    if (!isset($repmenuderoulantconstruction['nomlimite']) OR $limite > $repcountbatatiment['nb'])
        {
        $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
        echo '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
        }
    }

// Permet de construire des vaisseaux.
$reqmenuderoulantvaisseau = $bdg->prepare('SELECT idvaisseau, nomvaisseau FROM vaisseau WHERE idflottevaisseau = ?');
$reqmenuderoulantvaisseau->execute(array(-$_SESSION['id']));
while ($repmenuderoulantvaisseau = $reqmenuderoulantvaisseau ->fetch())
    { // Gestion des trucs ayant besoin d'un machin dans les stocks.
    $a++;
    echo '<option value="'.-$repmenuderoulantvaisseau['idvaisseau'].'">'.$repmenuderoulantvaisseau['nomvaisseau'].'</option>';
    }

if ($a == 0) 
    { 
    echo '<option disabled selected>Pas de construction possible</option></select>'; 
    } 
else 
    { 
    echo '</select> <input type="submit" value="Valider" />'; 
    } 
echo '<input type="hidden" name="id" value="'.$_GET['id'].'">'; 
echo '</p></form>'; // Fin formulaire pour les constructions. 

// Requete pour gérer les constructions : 
$reqnomitemencoursdeconstruction = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?'); 
$reqnomvaisseau = $bdg->prepare("SELECT nomvaisseau FROM vaisseau WHERE idvaisseau = ?"); 
$reqmess = $bdg->prepare("SELECT message FROM messagetour WHERE domainemess = ? AND numspemessage = ?"); 
 
// Affichage des constructions en cours. 
$reqconstencours = $bdg->prepare('SELECT * FROM construction WHERE idplaneteconst = ? ORDER BY ordredeconstruction'); 
$reqconstencours->execute(array($_GET['id'])); 
while ($repconstencours = $reqconstencours->fetch()) 
  { 
  // Formulaire pour gérer la construction : 
  echo '<form method="post" action="script/gererconstruction.php">'; 
 
  if ($repconstencours['trucaconstruire']>0) 
    { // Cas des constructions d'items. 
    $reqnomitemencoursdeconstruction->execute(array($repconstencours['trucaconstruire'])); 
    $repnom = $reqnomitemencoursdeconstruction->fetch(); 
    echo $repconstencours['nombre'].' '.$repnom['nombatiment'].' en construction.'; 
    } 
  elseif ($repconstencours['trucaconstruire'] < 0) 
    { // Cas des vaisseaux 
    $reqnomvaisseau->execute(array(-$repconstencours['trucaconstruire'])); 
    $repnom = $reqnomvaisseau->fetch(); 
    echo 'Un vaisseau de type \'' . $repnom['nomvaisseau'] . '\' est en cours de construction.'; 
    } 
  echo ' Reste à investir '.$repconstencours['avancementbiens'].' biens'; 
  if($repconstencours['avancementtitane']>0) 
    { 
    echo ' et ' . $repconstencours['avancementtitane'] . ' métaux rares'; 
    } 
  echo ' pour le prochain.';   
  echo '<input type="hidden" name="idplanete" value="'.$_GET['id'].'">'; 
  echo '<input id = "checkbox'.$repconstencours['idconst'].'" type="checkbox" name="perdreressources"/> <label for="checkbox'.$repconstencours['idconst'].'"></label>'; 
  echo '<input type="hidden" name="idconstruction" value="'.$repconstencours['idconst'].'">'; 
  echo '<a class="infobulle"><input type="image" alt="annuler" src="imagecarte/annuler.png" formaction="script/gererconstruction.php?action=annuler"/><span>Annuler<br>Besoin de cocher la case à gauche dans le cas des construction partiellement avancée ou des vaisseaux. Ressources perdues dans ce cas.</span></a>'; 
  if ($repconstencours['ordredeconstruction']>0) 
    { // La construction est en cours.
    echo ' <a class="infobulle"><input type="image" alt="prioriser" src="imagecarte/Flechehaut.png" formaction="script/gererconstruction.php?action=prioriser"/><span>Prioriser</span></a>';
    echo ' <a class="infobulle"><input type="image" alt="deprioriser" src="imagecarte/Flechebas.png" formaction="script/gererconstruction.php?action=deprioriser"/><span>Deprioriser</span></a>';
    echo ' <a class="infobulle"><input type="image" alt="en pause" src="imagecarte/pause.png" formaction="script/gererconstruction.php?action=pause"/><span>Mettre en pause</span></a>'; 
    } 
  elseif ($repconstencours['ordredeconstruction']<1) 
    { // La construction est sur pause. 
    echo ' <a class="infobulle"><input type="image" alt="reprendre" src="imagecarte/reprendre.png" formaction="script/gererconstruction.php?action=reprise"/><span>Reprendre</span></a>';
    }

  echo '</form></br>'; 
  $reqmess->execute(array('Construction', $repconstencours['idconst'])); 
  $message = $reqmess->fetch() ; 
  if (!empty($message['message'])) 
    {echo 'Non finit car : '.$message['message'] . '</br></br>' ; } 
  else 
    {echo '</br>' ; } 
  }
?>