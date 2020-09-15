<?php
echo '</br><h2>Chantier de construction :</h2>';

$a = 0; //Variable permettant de gérer le cas avec 0 construction possible.
$optionautre = '';
// Requête pour la liste de construction et basé sur la présence d'un item.
$reqmenuderoulantitems = $bd->prepare(' SELECT i.iditem, i.nombatiment
                                        FROM c_silo s
                                        RIGHT JOIN a_items i ON i.itemnecessaire = s.iditems
                                        WHERE s.idplanetesilo = ? AND s.quantite > 0 AND i.typeitem = "autre"');
$reqmenuderoulantitems->execute(array($_GET['id']));
while ($repmenuderoulantitems = $reqmenuderoulantitems ->fetch())
    { // Gestion des trucs ayant besoin d'un machin dans les stocks.
    $a++;
    $optionautre .= '<option value="'.$repmenuderoulantitems['iditem'].'">'.$repmenuderoulantitems['nombatiment'].'</option>';
    }

$nbbatiment = 0;
$optionbatiment = '';
$reqcountbatatiment = $bd->prepare('SELECT COUNT(*) AS nb FROM c_batiment WHERE idplanetebat = ? AND typebat = ?');
// Requete pour la liste de construction et basé sur une limite :
$reqmenuderoulantconstruction = $bd->prepare('  SELECT  i.iditem, i.nombatiment, i.nomlimite
                                                FROM c_rech_joueur rj
                                                RIGHT JOIN a_items i ON rj.idrech = i.technescessaire
                                                WHERE (i.technescessaire = 0 OR (rj.idjoueurrecherche = ? AND rj.rechposs = 1))
                                                AND i.typeitem = "batiment"');
$reqmenuderoulantconstruction->execute(array($_SESSION['id']));
while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
    {
    if(isset($repmenuderoulantconstruction['nomlimite']))
        {
        if (is_numeric($repmenuderoulantconstruction['nomlimite']))
          {
          $limite = $repmenuderoulantconstruction['nomlimite'];          
          }
        else
          {
          $limite = $repplanete["{$repmenuderoulantconstruction['nomlimite']}"];          
          }
        $reqcountbatatiment->execute(array($_GET['id'], $repmenuderoulantconstruction['iditem']));
        $repcountbatatiment = $reqcountbatatiment->fetch();
        }

    if (!isset($repmenuderoulantconstruction['nomlimite']) OR $limite > $repcountbatatiment['nb'])
        {
        $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
        $nbbatiment++;
        $optionbatiment .= '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
        }
    }

$nbcomposant = 0;
$optioncomposant = '';
$reqmenuderoulantconstruction = $bd->prepare('  SELECT  i.iditem, i.nombatiment
                                                FROM c_rech_joueur rj
                                                RIGHT JOIN a_items i ON rj.idrech = i.technescessaire
                                                WHERE (i.technescessaire = 0 OR (rj.idjoueurrecherche = ? AND rj.rechposs = 1))
                                                AND i.typeitem = "composant"');
$reqmenuderoulantconstruction->execute(array($_SESSION['id']));
while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
    {
    $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
    $nbcomposant++;
    $optioncomposant .= '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
    }

$nbproduit = 0;
$optionproduit = '';
$reqmenuderoulantconstruction = $bd->prepare('  SELECT  i.iditem, i.nombatiment
                                                FROM c_rech_joueur rj
                                                RIGHT JOIN a_items i ON rj.idrech = i.technescessaire
                                                WHERE (i.technescessaire = 0 OR (rj.idjoueurrecherche = ? AND rj.rechposs = 1))
                                                AND i.typeitem = "produit"');
$reqmenuderoulantconstruction->execute(array($_SESSION['id']));
while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
    {
    $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
    $nbproduit++;
    $optionproduit .= '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
    }
    
$optionvaisseau = '';
$nbvaisseau = 0;
// Permet de construire des vaisseaux.
$reqmenuderoulantvaisseau = $bd->prepare('SELECT idvaisseau, nomvaisseau FROM c_vaisseau WHERE idflottevaisseau = ?');
$reqmenuderoulantvaisseau->execute(array(-$_SESSION['id']));
while ($repmenuderoulantvaisseau = $reqmenuderoulantvaisseau ->fetch())
    { // Gestion des trucs ayant besoin d'un machin dans les stocks.
    $a++;
    $nbvaisseau++;
    $optionvaisseau .= '<option value="'.-$repmenuderoulantvaisseau['idvaisseau'].'">'.$repmenuderoulantvaisseau['nomvaisseau'].'</option>';
    }

if ($a > 5)
  { 
  $optionbatiment = '<optgroup label="Bâtiments">'.$optionbatiment;
  $optionvaisseau = '<optgroup label="Vaisseaux">'.$optionvaisseau;
  $optioncomposant = '<optgroup label="Composants">'.$optioncomposant;
  $optionproduit = '<optgroup label="Produits manufacturés">'.$optionproduit;
  } 
if ($a == 0) 
  { 
  $optionsdeconstruction = '<option disabled selected>Pas de construction possible</option></select>'; 
  } 
else
  { 
  $optionsdeconstruction = $optionautre;
  if ($nbproduit > 0)
    {
    $optionsdeconstruction .= $optionproduit;
    }
  if ($nbbatiment > 0)
    {
    $optionsdeconstruction .= $optionbatiment;
    }
  if ($nbvaisseau > 0)
    {
    $optionsdeconstruction .= $optionvaisseau;
    }
  if ($nbcomposant > 0)
    {
    $optionsdeconstruction .= $optioncomposant;
    }
  } 

echo '<form method="post" action="script/ordreconstruction.php"><p><label for="combien">Construire </label>';
echo '<input type="number" name="combien" value="1" min="1">';
echo '<select name="trucaconstruire" id="trucaconstruire">';
echo $optionsdeconstruction;
echo '<input type="hidden" name="idplanete" value="'.$_GET['id'].'">';
echo '</select> <input type="submit" value="Valider" />';
echo '</p></form>'; // Fin formulaire pour les constructions. 
?>