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
?>

</br>

<?php
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
        AND (items.typeitem = "batiments" OR items.typeitem = "vaisseau" OR items.typeitem = "composant")
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
              $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible. ?>
              <option value="<?php echo $repmenuderoulantconstruction['iditem']; ?>"><?php echo $repmenuderoulantconstruction['nombatiment']; ?></option>
              <?php
              } 
          }
          $reqmenuderoulantconstruction->closeCursor();

        // Menu déroulant en fonction de la table des items et basé sur les items possédés.
        $reqmenuderoulantitems = $bdg->prepare('
        SELECT  items.iditem, items.nombatiment
        FROM silo
        RIGHT JOIN datawebsite.items
        ON items.itemnecessaire = silo.iditems
        WHERE silo.idjoueursilo = ? AND silo.quantite > 0
        ');
        $reqmenuderoulantitems->execute(array($_SESSION['id']));
        while ($repmenuderoulantitems = $reqmenuderoulantitems ->fetch())
          {
          $a++;
          ?>
          <option value="<?php echo $repmenuderoulantitems['iditem']; ?>"><?php echo $repmenuderoulantitems['nombatiment']; ?></option>
          <?php
          }
          $reqmenuderoulantconstruction->closeCursor();
          if ($a == 0)
            {
            echo '<option disabled selected>Pas de construction possible</option>';
            }
          else
            {
            echo '</select><input type="submit" value="Valider" />';
            } ?>
   </p>
</form>

<?php
// Affichage des constructions en cours.
$reqconstencours = $bdg->prepare('SELECT trucaconstruire , nombre , avancementbiens, avancementtitane, prixbiens, prixtitane, idconst FROM construction WHERE idjoueurconst= ? ORDER BY idconst');
$reqconstencours->execute(array($_SESSION['id']));
$a = 0 ; // Variable pour creer un formulaire spécifique à chacune des construction en cours.
// Question bête un mois après avoir fait cette page : Pourquoi je n'utilise pas l'idconst pour faire le formulaire de suppression ?!

$reqnomitemencoursdeconstruction = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
$reqmess = $bdg->prepare("SELECT message FROM messagetour WHERE domainemess = ? AND numspemessage = ?");

while ($repconstencours = $reqconstencours->fetch())
  {
    $a = $a +1 ; 
    if ($repconstencours['trucaconstruire'] > 0)
      { // Dans le cas ou le truc à contreuire possède un numéro d'item :
      $reqnomitemencoursdeconstruction->execute(array($repconstencours['trucaconstruire']));
      $repnomitemencoursdeconstruction = $reqnomitemencoursdeconstruction->fetch() ; ?>
      <form method="post" action="script/annulationdesconstructions.php"> 
      <?php echo $repconstencours['nombre'] . ' ' . $repnomitemencoursdeconstruction['nombatiment'] ;?>
      en construction. Reste à investir <?php echo $repconstencours['avancementbiens'] ;?> biens 
      <?php if($repconstencours['avancementtitane']>0){echo 'et ' . $repconstencours['avancementtitane'] . ' métaux rares';}?>
      pour le prochain.
      <input id = "checkbox<?php echo $a ;?>" type="checkbox" name="perdreressources" /> <label for="checkbox<?php echo $a ;?>"></label>
      <input type="hidden" name="idconstruction" value="<?php echo $repconstencours['idconst'] ;?>">
      <input type="hidden" name="avancementbiens" value="<?php echo $repconstencours['avancementbiens'] ;?>">
      <input type="hidden" name="avancementtitane" value="<?php echo $repconstencours['avancementtitane'] ;?>">
      <input type="hidden" name="prixbiens" value="<?php echo $repconstencours['prixbiens'] ;?>">
      <input type="hidden" name="prixtitane" value="<?php echo $repconstencours['prixtitane'] ;?>">
      <input type="submit" value="Annuler" />
      </form></br><?php
      $reqmess->execute(array($typemessage , $repconstencours['idconst']));
      $message = $reqmess->fetch() ;
      if (!empty($message['message']))
        {echo $message['message'] . '</br></br>' ; }
      $reqnomitemencoursdeconstruction->closeCursor();
      }
    elseif ($repconstencours['trucaconstruire'] == -1)
      {
      $reqnomvaisseau = $bdg->prepare("
      SELECT v.nomvaisseau
      FROM vaisseau v INNER JOIN concenptionencours c
      ON c.idvaisseauconception = v.idvaisseau
      WHERE c.idconstruction = ?");
      $reqnomvaisseau->execute(array($repconstencours['idconst']));
      $repnomvaisseau = $reqnomvaisseau->fetch() ;
      echo 'Le vaisseau \'' . $repnomvaisseau['nomvaisseau'] . '\' est en cours de renovation pour un coût restant de ' . $repconstencours['avancementbiens'] . '.</br>' ;
      }
  }
$reqconstencours->closeCursor();
?>
  </div>
  </body>
</html>