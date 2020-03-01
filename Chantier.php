<?php
session_start();
If (!$_SESSION['pseudo'])
{
    header('Location: Accueil.php');
    exit(); 
}
include("include/BDDconnection.php");
?>

<!DOCTYPE html>
<html>
    <head>
           <meta charset="utf-8" />
           <link rel="stylesheet" href="style.css" />
           <title>Mon super site</title>
  </head>
  <body>

    <?php include("include/menu.php"); ?>

  <div class="corps">
    <h1>CHANTIERS</h1>
    
    <?php
    include("include/message.php") ; 
    $typemessage = 'construction' ;
    include("include/resume.php");
    ?>

<?php
// Compter nombre d'ouvrier
$reqcompterouvrier = $bdg->prepare('SELECT COUNT(*) AS ouvriers FROM population WHERE joueurpop= ? AND typepop = 2');
$reqcompterouvrier->execute(array($_SESSION['id']));                                   
$ouvriers = $reqcompterouvrier->fetch();
$reqcompterouvrier->closeCursor();
?>

<?php 
  if ($ouvriers['ouvriers'] == 0)
    {
    echo 'Tu n\'as aucun ouvrier dans tes usines.';
    }
  if ($ouvriers['ouvriers'] == 1)
    {
    echo 'Tu n\'as qu\'un ouvrier dans tes usines.';
    }
  if ($ouvriers['ouvriers'] > 1)
    {
    echo 'Tu as ' . $ouvriers['ouvriers'] . ' ouvriers prêts à travailler pour la nation.';
    }
echo '</br>';

$reqcompterchantier = $bdg->prepare('SELECT COUNT(*) AS nbdechantier FROM batiments WHERE idjoueurbat = ? AND typebat = 2');
$reqcompterchantier->execute(array($_SESSION['id']));
$repcompterchantier = $reqcompterchantier->fetch();
$reqcompterchantier->closeCursor();

if ($repcompterchantier['nbdechantier'] == 0)
  {
  echo 'Tu n\'as aucun chantier (une place d\'ouvrier offerte).';
  }
if ($repcompterchantier['nbdechantier'] == 1)
  {
  echo 'Tu as un chantier, ce qui donne 5 places d\'ouvriers.';
  }
if ($repcompterchantier['nbdechantier'] > 1)
  {
  $placeouvrier = $repcompterchantier['nbdechantier']*5 ;
  echo 'Tu as ' . $repcompterchantier['nbdechantier'] . ' chantiers (= '. $placeouvrier .' places pour les ouvriers).';
  }

$a = 0; ?> <!-- Variable permettant de gérer le cas avec 0 construction possible -->
<!-- Menu de construction  -->
<form method="post" action="script/ordreconstruction.php">
   <p>
      <label for="combien">Construire </label>
      <input type="number" name="combien" value="1" min="1">
      <select name="trucaconstruire" id="trucaconstruire">
        <?php
        // Menu déroulant en fonction de la table des items et basé sur les technologies.
        $reqmenuderoulantconstruction = $bdd->prepare('
        SELECT  items.iditem, items.nombatiment, items.nomlimite
        FROM gamer.rech_joueur
        RIGHT JOIN items
        ON rech_joueur.idrech = items.technescessaire
        WHERE (items.technescessaire = 0 OR (rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1))
        AND (items.typeitem <> "autre" AND items.typeitem <> "artefact")
        ');
        $reqmenuderoulantconstruction->execute(array($_SESSION['id']));
        while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
          {
            if (isset($repmenuderoulantconstruction['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
              {
              // On récupère la limite.
              $reqlimite = $bdg->prepare('SELECT '.$repmenuderoulantconstruction['nomlimite'].' FROM limitesjoueurs WHERE id = ?');
              $reqlimite->execute(array($_SESSION['id']));
              $replimite = $reqlimite->fetch(); // $replimite['0']

              // On récupère le nombre de batiments actuels.
              $reqcomptechantier = $bdg->prepare('SELECT COUNT(idbat) as nb FROM batiments WHERE typebat = ? AND idjoueurbat = ?');
              $reqcomptechantier->execute(array($repmenuderoulantconstruction['iditem'], $_SESSION['id']));
              $repcomptechantier = $reqcomptechantier->fetch();  // $repcomptechantier['nb']
              }

            if (!isset($repmenuderoulantconstruction['nomlimite']) OR $replimite['0']>$repcomptechantier['nb'])
              {
              $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
              echo '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
              } 
          }
          $reqmenuderoulantconstruction->closeCursor();

        // Menu déroulant en fonction de la table des items et basé sur les items possédés.
        $reqmenuderoulantitems = $bdg->prepare('
        SELECT  items.iditem, items.nombatiment
        FROM silo
        RIGHT JOIN datawebsite.items
        ON items.itemnecessaire = silo.iditems
        WHERE silo.idjoueursilo = ? AND silo.quantite > 0 AND items.typeitem <> "artefact"
        ');
        $reqmenuderoulantitems->execute(array($_SESSION['id']));
        while ($repmenuderoulantitems = $reqmenuderoulantitems ->fetch())
          {
          $a++;
          echo '<option value="'.$repmenuderoulantitems['iditem'].'">'.$repmenuderoulantitems['nombatiment'].'</option>';
          }
          $reqmenuderoulantconstruction->closeCursor();
          if ($a == 0)
            {
            echo '<option disabled selected>Pas de construction possible</option>';
            }
          else
            {
            echo '</select> <input type="submit" value="Valider" />';
            } ?>
   </p>
</form>

<?php
// Affichage des constructions en cours.
$reqconstencours = $bdg->prepare('SELECT * FROM construction WHERE idjoueurconst= ? ORDER BY ordredeconstruction');
$reqconstencours->execute(array($_SESSION['id']));

$reqnomitemencoursdeconstruction = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
$reqmess = $bdg->prepare("SELECT message FROM messagetour WHERE domainemess = ? AND numspemessage = ?");

while ($repconstencours = $reqconstencours->fetch())
  {
  if ($repconstencours['trucaconstruire']>0)
    { // Dans le cas ou le truc à contreuire possède un numéro d'item (-1 = conception par exemple) :
    $reqnomitemencoursdeconstruction->execute(array($repconstencours['trucaconstruire']));
    $repnomitemencoursdeconstruction = $reqnomitemencoursdeconstruction->fetch() ;
    
    // Formulaire pour gérer la construction :
    echo '<form method="post" action="script/gererconstruction.php">';
    echo $repconstencours['nombre'].' '.$repnomitemencoursdeconstruction['nombatiment'].' en construction. Reste à investir '.$repconstencours['avancementbiens'].' biens';
    if($repconstencours['avancementtitane']>0)
      {
      echo 'et ' . $repconstencours['avancementtitane'] . ' métaux rares';
      }
    echo ' pour le prochain.';
    echo '<input id = "checkbox'.$repconstencours['idconst'].'" type="checkbox" name="perdreressources"/> <label for="checkbox'.$repconstencours['idconst'].'"></label>';
    echo '<input type="hidden" name="idconstruction" value="'.$repconstencours['idconst'].'">';
    echo '<input type="submit" formaction="script/gererconstruction.php?action=annuler" value="Annuler"/>';
    if ($repconstencours['ordredeconstruction']>0)
      { // La construction est en cours.
      echo ' <input type="submit" formaction="script/gererconstruction.php?action=deprioriser" value="Déprioriser"/>';
      echo ' <input type="submit" formaction="script/gererconstruction.php?action=pause" value="En pause"/>';
      }
    elseif ($repconstencours['ordredeconstruction']<1)
      { // La construction est sur pause.
      echo ' CONTRUCTION ARRÊTÉE <input type="submit" formaction="script/gererconstruction.php?action=reprise" value="Reprendre"/>';
      }
    
    echo '</form></br>';
    
    $reqmess->execute(array($typemessage , $repconstencours['idconst']));
    $message = $reqmess->fetch() ;
    if (!empty($message['message']))
      {echo $message['message'] . '</br></br>' ; }
    else
      {echo '</br>' ; }
    }
  elseif ($repconstencours['trucaconstruire'] == -1 OR $repconstencours['trucaconstruire'] == -2)
    { // cas d'une conception
    $reqnomvaisseau = $bdg->prepare("
    SELECT v.nomvaisseau, v.idvaisseau
    FROM vaisseau v INNER JOIN conceptionencours c
    ON c.idvaisseauconception = v.idvaisseau
    WHERE c.idconstruction = ?");
    $reqnomvaisseau->execute(array($repconstencours['idconst']));
    $repnomvaisseau = $reqnomvaisseau->fetch() ;
    
    // Formulaire pour gérer la construction :
    echo '<form method="post" action="script/gererconstruction.php">';
    echo 'Le vaisseau \'' . $repnomvaisseau['nomvaisseau'] . '\' est en cours de rénovation pour un coût restant de ' . $repconstencours['avancementbiens'] . ' biens';
    if ($repconstencours['avancementtitane']>0)
      {
      echo ' et de ' . $repconstencours['avancementtitane'] . ' titane';
      }
    echo '<input name="idvaisseau" type="hidden" value="' . $repnomvaisseau['idvaisseau'] . '">';
    echo '<input type="hidden" name="idconstruction" value="'.$repconstencours['idconst'].'">';
    echo '<input type="hidden" name="confirmer" value="off"/>'; 
    echo '<input id = "checkbox" type="checkbox" name="confirmer"/> <label for="checkbox"></label>  ';  
    echo '<input name="typeordre" type="hidden" value="-1">';
    echo '<input type="submit" formaction="script/ordredeplacement.php" value="Supprimer l\'ordre"/>'; 
    if ($repconstencours['ordredeconstruction']>0)
      { // La construction est en cours.
      echo ' <input type="submit" formaction="script/gererconstruction.php?action=deprioriser" value="Déprioriser"/>';
      echo ' <input type="submit" formaction="script/gererconstruction.php?action=pause" value="En pause"/>';
      }
    elseif ($repconstencours['ordredeconstruction']<1)
      { // La construction est sur pause.
      echo ' CONTRUCTION ARRÊTÉE <input type="submit" formaction="script/gererconstruction.php?action=reprise" value="Reprendre"/>';
      }
    echo '</form></br></br>';
    }
  }
$reqconstencours->closeCursor();
?>
  </div>
  </body>
</html>