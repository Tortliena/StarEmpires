<?php
session_start();
If (!$_SESSION['pseudo'])
{
    header('Location: Accueil.php');
    exit(); 
}
include("script/BDDconnection.php");
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
$reqcompterouvrier = $bdd->prepare('SELECT COUNT(*) AS ouvriers FROM population WHERE joueurpop= ? AND typepop = 2');
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
$req = $bdd->prepare('SELECT COUNT(*) AS nbdechantier FROM batiments WHERE idjoueurbat = ? AND typebat = 2');
$req->execute(array($_SESSION['id']));
$donnees = $req->fetch();
$req->closeCursor();

  if ($donnees['nbdechantier'] == 0)
  {
    echo 'Tu n\'as aucun chantier (deux places d\'ouvriers offertes).';
  }
  if ($donnees['nbdechantier'] == 1)
  {
    echo 'Tu as un chantier, ce qui donne 5 places d\'ouvriers.';
  }
  if ($donnees['nbdechantier'] > 1)
  {
  $placeouvrier = $donnees['nbdechantier']*5 ;
  echo 'Tu as ' . $donnees['nbdechantier'] . ' chantiers (= '. $placeouvrier .' places pour les ouvriers).';
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
        FROM rech_joueur
        RIGHT JOIN items
        ON rech_joueur.idrech = items.technescessaire
        WHERE (items.technescessaire = 0 OR (rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1))
        AND (items.typeitem = "batiments" OR items.typeitem = "vaisseau")
        ');
        $reqmenuderoulantconstruction->execute(array($_SESSION['id']));
        while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
          {
            if (isset($repmenuderoulantconstruction['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
              {
              
              // On récupère la limite.
              $reqlimite = $bdd->prepare('SELECT '.$repmenuderoulantconstruction['nomlimite'].' FROM limitesjoueurs WHERE id = ?');
              $reqlimite->execute(array($_SESSION['id']));
              $replimite = $reqlimite->fetch(); // $replimite['0']

              // On récupère le nombre de batiments actuels.
              $reqcomptechantier = $bdd->prepare('SELECT COUNT(idbat) as nb FROM batiments WHERE typebat = ? AND idjoueurbat = ?');
              $reqcomptechantier->execute(array($repmenuderoulantconstruction['iditem'], $_SESSION['id']));
              $repcomptechantier = $reqcomptechantier->fetch();  // $repcomptechantier['nb']
              }
            if (!isset($repmenuderoulantconstruction['nomlimite']) OR $replimite['0']>$repcomptechantier['nb'])
              {
              $a++;  ?>
              <option value="<?php echo $repmenuderoulantconstruction['iditem']; ?>"><?php echo $repmenuderoulantconstruction['nombatiment']; ?></option>
              <?php
              } 
          }
          $reqmenuderoulantconstruction->closeCursor();


        // Menu déroulant en fonction de la table des items et basé sur les items possédés.
        $reqmenuderoulantitems = $bdd->prepare('
        SELECT  items.iditem, items.nombatiment
        FROM silo
        RIGHT JOIN items
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
$reqconstencours = $bdd->prepare('SELECT trucaconstruire , nombre , avancementbiens, avancementtitane, prixbiens, prixtitane, idconst FROM construction WHERE idjoueurconst= ? ORDER BY idconst');
$reqconstencours->execute(array($_SESSION['id']));
$a = 0 ; // Variable pour creer un formulaire spécifique à chacune des construction en cours.
// Question bête un mois après avoir fait cette page : Pourquoi je n'utilise pas l'idconst pour faire le formulaire de suppression ?!

$req = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
$reqmess = $bdd->prepare("SELECT message FROM messagetour WHERE domainemess = ? AND numspemessage = ?");

while ($donnees = $reqconstencours->fetch())
  {
    $a = $a +1 ; 
    $req->execute(array($donnees['trucaconstruire']));
    $info = $req->fetch() ; ?>
    <form method="post" action="script/annulationdesconstructions.php"> 
    <?php echo $donnees['nombre'] . ' ' . $info['nombatiment'] ;?>
    en construction. Reste à investir <?php echo $donnees['avancementbiens'] ;?> biens 
    <?php if($donnees['avancementtitane']>0){echo 'et ' . $donnees['avancementtitane'] . ' métaux rares';}?>
    pour le prochain.
    <input id = "checkbox<?php echo $a ;?>" type="checkbox" name="perdreressources" /> <label for="checkbox<?php echo $a ;?>"></label>
    <input type="hidden" name="idconstruction" value="<?php echo $donnees['idconst'] ;?>">
    <input type="hidden" name="avancementbiens" value="<?php echo $donnees['avancementbiens'] ;?>">
    <input type="hidden" name="avancementtitane" value="<?php echo $donnees['avancementtitane'] ;?>">
    <input type="hidden" name="prixbiens" value="<?php echo $donnees['prixbiens'] ;?>">
    <input type="hidden" name="prixtitane" value="<?php echo $donnees['prixtitane'] ;?>">
    <input type="submit" value="Annuler" />
    </form></br><?php
    $reqmess->execute(array($typemessage , $donnees['idconst']));
    $message = $reqmess->fetch() ; 
    
    if (!empty($message['message']))
      {echo $message['message'] . '</br></br>' ; }

  $req->closeCursor();
  }
$reqconstencours->closeCursor();
?>
  </div>
  </body>
</html>