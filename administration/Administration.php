<?php
session_start();
require __DIR__ . '/../include/BDDconnection.php';

echo '<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="../style.css" /><title>Mon super site</title></head><body>';

require __DIR__ . '/../include/menu.php';

echo '<div class="corps"><h1>GESTION DU TOUR</h1>';

require __DIR__ . '/../include/message.php';

?>

<!-- Afficher le tour que l'on veut -->
<form method="get" action="Passerletourmanuellement.php">
<p>
    <label for="numero_tour">Voir résumé du tour : </label>
    <input type="text" name="voir" id="numero_tour" placeholder="Tour" size="5" maxlength="4" />
    <input type="submit" value="Résumé du tour" />
</p>
</form>

<?php
//Permet de voir le tour qui passe, soit en entrant un nombre, soit en laissant vide la case.

if (isset($_GET["voir"]) and $_GET["voir"] == 0 )
  {
  $reqtourinfo = $bda->query('SELECT * FROM tour ORDER BY id DESC LIMIT 1') or die(print_r($bdd->errorInfo()));
  $reptourinfo = $reqtourinfo->fetch(); 
  echo 'le dernier tour est le tour ' . $reptourinfo['id'] . ' et s\'est passé le ' . $reptourinfo['datetour']  ;
  echo ' <br />  ' . $reptourinfo['resume'] ; 
  }
elseif (isset($_GET["voir"]))
  {
  $reqtourinfo = $bda->prepare('SELECT * FROM tour WHERE id = ?');
  $reqtourinfo->execute(array($_GET["voir"]));
  $reptourinfo = $reqtourinfo->fetch();
  echo 'le tour ' . $reptourinfo['id'] . ' s\'est passé le ' . $reptourinfo['datetour']  ;
  echo ' <br />  ' . $reptourinfo['resume'] ;  
  }
?>

<!-- Passer le tour manuellement -->
<form action="tour/Gestionglobale.php">
<p>
    <input type="submit" value="Passer le tour" />
</p>
</form>

<!-- Reset l'univers ! -->
<form action="script/resertunivers.php">
<p>
  <input id = "checkbox" type="checkbox" name="confirmer"/> <label for="checkbox"></label>
  <input type="submit" value="RAZ joueurs/univers" />
</p>
</form>

<h3>Gestion de la base de donnees :</h3>
<!-- exporter la base de donnees ! -->
<a class ="lienmenu" href="script/exporterbdd.php?table=autre&amp;backup=non">Exporter la table</a></br></br></br>

<!-- importer la base de donnees ! -->
<a class ="lienmenu" href="script/importerbdd.php?table=autre">Importer la table</a></br>

<br><h3>News du site :</h3>

<form method="post" action="script/news.php">
  <p>
  <input type="text" name="titre" id="titre" placeholder="titre du message" size="25" maxlength="80" />
  <input type="submit" value="Envoyer" /></br>
  <textarea name="textenews" rows="4" cols="50" placeholder="Texte de la news"></textarea>
</form>

<?php
require __DIR__ . '/../include/affichernews.php';
?>

</div></body></html>