<?php
echo '<div class = \'resume\'>';
echo '<div class = \'titreresume\'>Résumé du tour :</br></div>';
if (empty($_GET['id']))
  {
  $numspemessage = 0;
  }
else
  {
  $numspemessage = $_GET['id'];
  }

$reqres = $bdg->prepare('SELECT message FROM messagetour WHERE idjoumess = ? AND domainemess = ? AND numspemessage = ?');
$reqres->execute(array($_SESSION['id'], $typemessage, $numspemessage));
while ($repres = $reqres->fetch())
  {
  echo '<span class = \'texteresume\'>' . $repres['message'] . '</span></br>';
  $message = 1 ;
  }

if (!isset($message))
  {
  echo '<div class = \'texteresume\'>Rien d\'important ce tour </div></br>';
  }
$reqres->closeCursor();
echo '</div>';