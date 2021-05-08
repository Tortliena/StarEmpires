<?php
session_start();
if (isset($_COOKIE['id']) AND !isset($_SESSION['id']))
  {
  header('Location: script/connection.php');
  exit();
  }
elseif (!isset($_SESSION['id']) AND $_SERVER['PHP_SELF'] != '/accueil.php')
  {
  header('Location: /accueil.php');
  exit();
  }
require __DIR__ . '/../include/bddconnection.php';

echo '<!DOCTYPE html><html><head><meta charset="utf-8" />';
$regleagedustyle = 1;
if ($regleagedustyle == 1)
  {
  echo '<link rel="stylesheet" href="/css/importcss1.css" />';
  }
else
  {
  echo '<link rel="stylesheet" href="/css/importcss2.css" />';
  }
echo '<title>Starsempire</title></head><body>';
include($_SERVER['DOCUMENT_ROOT'].'/include/menu.php');

if ($_SERVER['PHP_SELF'] != '/accueil.php' AND $touractuel['fintour'] == 0 AND $_SERVER['PHP_SELF'] != '/administration/administration.php' AND $_SERVER['PHP_SELF'] != '/administration/afaire.php')
  {
  header('Location: /accueil.php?message=84');
  exit();
  }

echo '<div class="corps">';
?>