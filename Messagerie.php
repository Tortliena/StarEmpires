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
    <h1>MESSAGERIE</h1>
    <?php include("include/message.php") ; ?>

    <form method="post" action="script/envoyermessage.php">
    <p>
      <input type="text" name="titre" id="titre" placeholder="titre du message" <?php if (isset($_SESSION['titre'])) {echo 'value="'.$_SESSION['titre'].'"' ; }?>size="25" maxlength="80" />
      <select name="destinataire" id="destinataire">
        <option value="0" selected disabled> Destinataire</option>
        <?php
        // Menu déroulant en fonction des autres joueurs :    
        $reponse = $bdg->prepare('SELECT  id, pseudo FROM utilisateurs WHERE NOT id = ?');
        $reponse->execute(array($_SESSION['id']));
        while ($donnees = $reponse->fetch())
          {
          ?>
          <option value="<?php echo $donnees['id']; ?>"><?php echo $donnees['pseudo']; ?></option>
          <?php
          }
          $reponse->closeCursor();
        ?>
      </select>
      <input type="submit" value="Envoyer" /></br>
      <textarea rows="4" cols="50" name="textemessage" placeholder="Composer votre message ici."><?php if (isset($_SESSION['message'])) {echo $_SESSION['message'] ; }?></textarea>
    </p>
    </form>

    <?php
    $reqmessagerecusinterne = $bdg->prepare('SELECT idmessagerieinterne , expediteur , lu , titre , texte FROM messagerieinterne WHERE destinataire = ?');
    $a = 0; // Permet de faire apparaitre une seule fois <h2>Messages internes :</h2>
    $reqmessagerecusinterne ->execute(array($_SESSION['id']));
    while ($repmessagerecusinterne  = $reqmessagerecusinterne ->fetch())
      {
      if ($a == 0) {echo '<h2>Messages internes :</h2>';}
      $a++
      ?><form method="post" action="script/supprimermessageinterne.php">
      <?php if ($repmessagerecusinterne['lu']==0)
        {echo '<span class = "nvmessage">Nouveau</span>' ; }?>
      <span class="messagerie">Expéditeur</span> :<?php
      echo $repmessagerecusinterne['expediteur'].' <span class="messagerie">Titre</span> : '.$repmessagerecusinterne['titre']; ?>
      <input type="hidden" name="idmessage" value="<?php echo $repmessagerecusinterne['idmessagerieinterne'] ;?>">
      <input type="submit" value="Supprimer" /></form></br><?php
      }
    ?>

    <h2>Messages recus :</h2>
    <?php
    $reqmessagerecus = $bdg->prepare('SELECT idmessagerie, idjoueuremetteur, lu, titremessage, datemessage  FROM messagerie WHERE idjoueurrecepteur = ? AND supprimerecepteur = 0');
    $reqpseudo = $bdg->prepare('SELECT pseudo FROM utilisateurs WHERE id = ?'); 
    $reqmessagerecus ->execute(array($_SESSION['id']));
    while ($repmessagerecus  = $reqmessagerecus ->fetch())
      {
      $reqpseudo ->execute(array($repmessagerecus['idjoueuremetteur']));
      $reppseudo  = $reqpseudo ->fetch();
      ?><form method="post" action="script/supprimermessage.php">
      <?php if ($repmessagerecus['lu']==0)
        {echo '<span class = "nvmessage">Nouveau</span>' ; }?>
      <span class="messagerie">Expéditeur</span> :<?php
      echo $reppseudo['pseudo'].' <span class="messagerie">Titre</span> : '.$repmessagerecus['titremessage'].' <span class="messagerie">Date</span> : '.$repmessagerecus['datemessage']; ?>
      <input type="hidden" name="idmessage" value="<?php echo $repmessagerecus['idmessagerie'] ;?>">
      <input type="submit" value="Supprimer" /></form><?php
      }
    ?>
   
    </br><h2>Messages envoyés :</h2>

    <?php
    $reqmessageenvoye = $bdg->prepare('SELECT idmessagerie, idjoueurrecepteur, lu, titremessage, datemessage  FROM messagerie WHERE idjoueuremetteur = ? AND supprimeemetteur = 0'); 
    $reqmessageenvoye ->execute(array($_SESSION['id']));
    while ($repmessageenvoye  = $reqmessageenvoye ->fetch())
      {
      $reqpseudo ->execute(array($repmessageenvoye['idjoueurrecepteur']));
      $reppseudo  = $reqpseudo ->fetch();
      ?><form method="post" action="script/supprimermessage.php">
      <span class="nonlu"><?php if ($repmessageenvoye['lu']==0)
        {echo 'non ' ; }?> lu</span>
      <span class="messagerie">Destinataire</span> :<?php
      echo $reppseudo['pseudo'].' <span class="messagerie">Titre</span> : '.$repmessageenvoye['titremessage'].' <span class="messagerie">Date</span> : '.$repmessageenvoye['datemessage']; ?>
      <input type="hidden" name="idmessage" value="<?php echo $repmessageenvoye['idmessagerie'] ;?>">
      <input type="submit" value="Supprimer" /></form><?php
      }
    ?>

  </div>
  </body>
</html>