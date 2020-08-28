<?php
session_start();
if (!$_SESSION['pseudo'])
  {
  header('Location: Accueil.php');
  exit();
  }
require __DIR__ . '/../include/BDDconnection.php';

echo '<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="../style.css" /><title>Mon super site</title></head><body>';
include("../include/menu.php");
echo '<div class="corps">';

include("fonction/fonctionhangars.php");
include("../function/variable.php");
include("../function/infobulle.php");
?>