<?php
include("../include/entete.php");
echo '<h1>GESTION DU TOUR</h1>';

require __DIR__ . '/../include/message.php';

require __DIR__ . '/10_affichagedestours.php';
?>

<!-- Passer le tour manuellement -->
<form action="../tour/gestionglobale.php" method="get">
  <p>
  <input type="hidden" name="mdp" value="yguhirtsef">
  <input type="submit" value="Passer tour : Admin lvl!" />
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
<a class ="lienmenu" href="script/exporterbdd.php?table=univers&amp;backup=non">Exporter univers</a></br>
<a class ="lienmenu" href="script/exporterbdd.php?table=news&amp;backup=non">Exporter afaire et news</a></br>
<a class ="lienmenu" href="script/exporterbdd.php?table=datasite&amp;backup=non">Exporter les constantes</a></br>
<a class ="lienmenu" href="script/exporterbdd.php?table=tout&amp;backup=non">Exporter tout</a></br></br></br>

<!-- importer la base de donnees ! -->
<a class ="lienmenu" href="script/importerbdd.php">Importer la table</a></br>

<?php
require __DIR__ . '/40_gestiondesnews.php';

require __DIR__ . '/60_connexionjoueur.php';

require __DIR__ . '/../include/affichernews.php';
?>

</div></body></html>