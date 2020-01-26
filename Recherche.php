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
    <h1>RECHERCHE</h1>
    <?php
    include("include/message.php") ; 
    $typemessage = 'recherche' ;
    include("include/resume.php");

// Compter nombre de scientifiques
$reponse = $bdg->prepare('SELECT COUNT(*) AS scient FROM population WHERE joueurpop= ? AND typepop = 3');
$reponse->execute(array($_SESSION['id']));                                   
$ouvriers = $reponse->fetch();
$reponse->closeCursor();

  // Afficher le nombre de centre de recherche :
  $reqcountrecherche = $bdg->prepare('SELECT COUNT(*) AS nbdecentrederecherche FROM batiments WHERE idjoueurbat = ? AND typebat = 1');
  $reqcountrecherche->execute(array($_SESSION['id']));
  $repcountrecherche = $reqcountrecherche->fetch();

  $reqlimitechercheur = $bdg->prepare('SELECT scientmax FROM limitesjoueurs WHERE id = ?');
  $reqlimitechercheur->execute(array($_SESSION['id']));
  $replimitechercheur = $reqlimitechercheur->fetch();

  echo '<p> Il y a ' . $repcountrecherche['nbdecentrederecherche'] . ' centre de recherche qui peut acceuillir ' . $replimitechercheur['scientmax'] . ' chercheurs.</br> ';

  if ($ouvriers['scient'] == 0)
  {
    echo 'Tu n\'as aucun scientifique.';
  }
  elseif ($ouvriers['scient'] == 1)
  {
    echo 'Tu n\'as qu\'un scientifique qui y travaille.';
  }
  elseif ($ouvriers['scient'] > 1)
  {
  echo 'Tu as ' . $ouvriers['scient'] . ' scientifiques qui y travaillent.';
  }

// Afficher la recherche en cours !
$reqrecherencours = $bdd->prepare("
      SELECT recherche.nomrecherche 
      FROM recherche
      INNER JOIN gamer.rech_joueur
      ON recherche.idrecherche = rech_joueur.idrech
      AND rech_joueur.rechposs = 0
      AND rech_joueur.idjoueurrecherche = ?
      ORDER BY rech_joueur.idrechprinc DESC
      LIMIT 1 ");
$reqrecherencours->execute(array($_SESSION['id']));
$reprecherencours = $reqrecherencours->fetch() ; 
    
    if (!isset($reprecherencours['nomrecherche']))
      {
      echo '<p>Aucune recherche en cours.</p>'; 
      }
    else
      {
      echo '<p> La recherche en cours est ' . $reprecherencours['nomrecherche'] . '</p>'  ;
      }
    $reqrecherencours->closeCursor();
?>

  <h2>Recherches possibles :</h2>
  <?php

  // Recherche actuelle : 
  $afficherrecherche = $bdg->prepare('SELECT recherche FROM variationstour WHERE idjoueur= ?');
  $afficherrecherche->execute(array($_SESSION['id']));
  $recherche = $afficherrecherche->fetch();

$reqrechercheencours = $bdd->prepare("  SELECT  recherche.nomrecherche , recherche.descriptionrecherche,
                                                rech_joueur.avrech, rech_joueur.rechnesc,
                                                recherche.idrecherche, rech_joueur.avrech
                                        FROM recherche
                                        INNER JOIN gamer.rech_joueur
                                        ON recherche.idrecherche = rech_joueur.idrech
                                        WHERE rech_joueur.idjoueurrecherche = ?
                                          AND rech_joueur.rechposs = 0");
$reqrechercheencours->execute(array($_SESSION['id']));
     while ($reprechercheencours = $reqrechercheencours->fetch())
      {
      ?>
      <form method="post" action="script/enregistrementrecherche.php">
      <?php  echo $reprechercheencours['nomrecherche'] . ' : ' . $reprechercheencours['descriptionrecherche'] ; ?>
      <input type="hidden" value="<?php echo $reprechercheencours['idrecherche'] ; ?>" name="idrecherche" />
          <?php  // Partie affichant la difficulté des recherches.
          if (isset($reprechercheencours['avrech'])) // Si la recherche existe, alors afficher cette partie.
            {?> </br>Difficultée : <?php
            if ($recherche[0] == 0)
              {echo '<span class="impossible">Pas de recherche au dernier tour</span>';}
            elseif ($recherche[0] * 20 < $reprechercheencours['rechnesc'])
              {echo '<span class="impossible">Quasi-impossible</span>';}
            elseif ($recherche[0] * 10 < $reprechercheencours['rechnesc'])
              {echo '<span class="difficile">Dur</span>';}
            elseif ($recherche[0] * 5 < $reprechercheencours['rechnesc'])
              {echo '<span class="normal">Normal</span>';}
            else {echo '<span class="tresfacile">facile    </span>' ;}?>
          &nbsp; ; &nbsp; <?php } ?>


          Avancement actuel :
          <?php // Affichage de l'avancement actuel
          if ($reprechercheencours['avrech'] == 0) {echo '<span class="aucun">aucun</span>';}
          elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] < 0.25)
            {echo '<span class="faible">prémisses</span>';}
          elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] < 0.60)
            {echo '<span class="moyen">avancé</span>';}
          elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] < 1)
            {echo '<span class="fort">presque fini</span>' ;}?>


          <input type="submit" value="Rechercher" />
          </form> </p>  <?php

      }
  $reqrechercheencours->closeCursor(); ?>

<h2>Recherches finies :</h2>
  <?php
$reqrecherchefinie = $bdd->prepare("  SELECT recherche.nomrecherche , recherche.descriptionrecherche
                                      FROM recherche
                                      INNER JOIN gamer.rech_joueur
                                      ON recherche.idrecherche = rech_joueur.idrech
                                      WHERE rech_joueur.idjoueurrecherche = ?
                                        AND rech_joueur.rechposs = 1");

$reqrecherchefinie->execute(array($_SESSION['id']));
     while ($reprecherchefinie = $reqrecherchefinie->fetch())
      {
      echo '<p>' . $reprecherchefinie['nomrecherche'] . ' : ' . $reprecherchefinie['descriptionrecherche'] . '</p>' ;
      }
$reqrecherchefinie->closeCursor();
?>

  </div>
  </body>
</html>