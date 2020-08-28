<?php
session_start();
require __DIR__ . '/../include/BDDconnection.php';

echo '<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="../style.css" /><title>Mon super site</title></head><body>';

require __DIR__ . '/../include/menu.php';

echo '<div class="corps"><h1>GESTION DU TOUR</h1>';

require __DIR__ . '/../include/message.php';

require __DIR__ . '/10_affichagedestours.php';
?>

<!-- Passer le tour manuellement -->
<form action="../tour/00_gestionglobale.php">
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

<?php
require __DIR__ . '/40_gestiondesnews.php';

require __DIR__ . '/../include/affichernews.php';
?>

</div></body></html>