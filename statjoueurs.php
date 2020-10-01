<?php
include($_SERVER['DOCUMENT_ROOT'].'/include/entete.php');

$a = 1;
$interieurtable = '';
$reqinfoutilisateurs = $bd->query('SELECT pseudo, lvl FROM c_utilisateurs WHERE id > 1 ORDER BY lvl DESC');
while ($repinfoutilisateurs = $reqinfoutilisateurs->fetch())
  {
  $interieurtable .= '<tr><td>'.$a.'</td><td>'.$repinfoutilisateurs['pseudo'].'</td><td>'.$repinfoutilisateurs['lvl'].'</td></tr>';
  $a++;
  }

echo '<table id="tablestatjoueurs"><caption>Joueurs</caption><thead><th>Classement</th><th>Nom dirigeant</th><th>Niveau</th></thead><tbody>';
echo $interieurtable;
echo '</tbody></table>';
//<tfoot><th>Classement</th><th>Pseudo</th><th>Niveau</th></tfoot>
echo '</div></body></html>';
?>