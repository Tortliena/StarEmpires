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

    <form method="post" action="script/ajouterafaire.php">
    <p>
        <input type="text" name="nouveauprojet" id="nouveauprojet" placeholder="nouveau projet" size="40" maxlength="127" />
        <select name="niveaudeprojet" id="niveaudeprojet">
            <option value="encours">En cours</option>
            <option value="petittrucrapide">Petit truc rapide</option>
            <option value="grosetapesouspeu">Grosse étape à faire sous peu</option>
            <option value="petittrucplustard">Petit truc plus tard</option>
            <option value="grosseetapeplustard">Grosse étape plus tard</option>
            <option value="lancementsite">Pour le lancement du site</option>
        </select>
        <input type="submit" value="Ajouter" />
    </p>
    </form>


    <h1>En cours :</h1>

<?php
$reponse = $bdd->prepare('SELECT texteafaire, idafaire FROM afaire WHERE priorite = ? ORDER BY idafaire');
$reponse->execute(array('encours'));
while ($donnees = $reponse->fetch())
  {
    echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
  }
$reponse->closeCursor();
?>

    <h1>Petit truc rapide :</h1>

<?php
$reponse->execute(array('petittrucrapide'));
while ($donnees = $reponse->fetch())
  {
    echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
  }
$reponse->closeCursor();
?>

    <h1>Grosse étape à faire sous peu :</h1>

    <?php
        $reponse->execute(array("grosetapesouspeu"));
        while ($donnees = $reponse->fetch())
          {
            echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
          }
        $reponse->closeCursor();
    ?>

    <h1>Petit truc plus tard</h1>

<?php
$reponse->execute(array("petittrucplustard"));
while ($donnees = $reponse->fetch())
  {
    echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
  }
$reponse->closeCursor();
?>


    <h1>Grosse étape plus tard</h1>

    <?php
        $reponse->execute(array("grosseetapeplustard"));
        while ($donnees = $reponse->fetch())
          {
            echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
          }
        $reponse->closeCursor();
    ?>

    </br><h1>Pour le lancement du site</h1>
    <?php
        $reponse->execute(array("lancementsite"));
        while ($donnees = $reponse->fetch())
          {
            echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
          }
        $reponse->closeCursor();
    ?>    
  </div>
  </body>
</html>