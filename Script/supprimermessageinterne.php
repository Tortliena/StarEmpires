<?php
session_start();
include("../include/BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idmessage'] . '</br>';

$reqsupmessage = $bdg->prepare('DELETE FROM messagerieinterne WHERE destinataire = ? AND idmessagerieinterne = ?');
$reqsupmessage ->execute(array($_SESSION['id'] , $_POST['idmessage']));

header('Location: ../messagerie.php?message=25');
?>