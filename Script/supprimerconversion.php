<?php
session_start();
include("BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idpop'] . '</br>';


$reqverif = $bdd->prepare('SELECT joueurpop FROM population WHERE idpop = ?');
$reqverif->execute(array($_POST['idpop']));
$repverif = $reqverif->fetch();

if ($repverif['joueurpop']=$_SESSION['id'])
	{
	$req = $bdd->prepare('UPDATE population SET typepoparrivee = 0 WHERE idpop = ?');
	$req->execute(array($_POST['idpop']));
	}

header('Location: ../capitale.php');
?>