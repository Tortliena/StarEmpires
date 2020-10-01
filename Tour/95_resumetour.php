<?php
// Dans chacun des autres includes, nous avons des commentaires ajoutés dans $Commentairestour. Ici, nous introduisons le tour dans la bdd.
$reqderniertour = $bd->query('SELECT MAX(id) FROM c_tour WHERE fintour = 0');
$repderniertour = $reqderniertour->fetch();

$Commentairestour .= '<br>Fin du tour.';

$reqmiseajourtour = $bd->prepare('UPDATE c_tour SET resume = ?, fintour = ? WHERE id = ?');
$reqmiseajourtour->execute(array($Commentairestour, 1, $repderniertour[0]));
?>