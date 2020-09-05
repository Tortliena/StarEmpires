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

echo '<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="/css/importcss.css" /><title>Starsempire</title></head><body>';
$path = $_SERVER['DOCUMENT_ROOT'];
$pathmenu = $path.'/include/menu.php';
include($pathmenu);
echo '<div class="corps">';
?>