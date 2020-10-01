<?php
if (isset($_GET["idnews"]))
  {
  $reqnewsencours = $bd->prepare('SELECT * FROM b_news WHERE idnews = ?');
  $reqnewsencours->execute(array($_GET["idnews"]));
  $repnewsencours = $reqnewsencours->fetch();
  }

echo '<br><h3>Modifier news du site :</h3>';
echo '<form method="post" action="script/news.php"><p>';
echo '<input type="text" name="titre" id="titre" placeholder="titre du message" size="25" maxlength="80"';
if (isset($_GET["idnews"]))
  {
  echo 'value="'.$repnewsencours['titrenews'].'"';
  }
echo ' />';
echo '&ensp;<input type="submit" value="Envoyer" /></br>';
if (isset($_GET["idnews"]))
  {
  echo '<input type="hidden" name="modifnews" value="'.$_GET["idnews"].'">';
  }
echo '<textarea name="textenews" rows="4" cols="50" placeholder="Texte de la news">';
if (isset($_GET["idnews"]))
  {
  echo $repnewsencours['textenews'];
  }
echo '</textarea></form>';
?>