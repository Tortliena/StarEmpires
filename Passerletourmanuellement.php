<?php
session_start();
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
    <h1>GESTION DU TOUR</h1>

<!-- Afficher le tour que l'on veut -->
<form method="get" action="Passerletourmanuellement.php">
<p>
    <label for="numero_tour">Tour : </label>
    <input type="text" name="voir" id="numero_tour" placeholder="Tour" size="5" maxlength="4" /><br />
    <input type="submit" value="Résumé du tour" />
</p>
</form>

<!-- Passer le tour manuellement -->
<form action="tour/Gestionglobale.php">
<p>
    <input type="submit" value="Passer le tour" />
</p>
</form>

<br />

<?php
//Permet de voir le tour qui passe, soit en entrant un nombre, soit en laissant vide la case.



if (isset($_GET["voir"]) and $_GET["voir"] == 0 )
  {
$reponse = $bdd->query('SELECT * FROM tour ORDER BY id DESC LIMIT 1') or die(print_r($bdd->errorInfo()));
$donnees = $reponse->fetch(); 
echo 'le dernier tour est le tour ' . $donnees['id'] . ' et s\'est passé le ' . $donnees['datetour']  ;
echo ' <br />  ' . $donnees['resume'] ; 
  }
elseif (isset($_GET["voir"]))
  {
  $req = $bdd->prepare('SELECT * FROM tour WHERE id = ?');
  $req->execute(array($_GET["voir"]));
  $donnees = $req->fetch(); 
    echo 'le tour ' . $donnees['id'] . ' s\'est passé le ' . $donnees['datetour']  ;
    echo ' <br />  ' . $donnees['resume'] ;  
  }
?>

</div>
  </body>
</html>