<?php 
session_start(); 
if (!$_SESSION['pseudo']) 
  { 
  header('Location: Accueil.php'); 
  exit(); 
  } 
include("include/BDDconnection.php"); 
echo '<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="style.css" /><title>Mon super site</title></head><body>';
include("include/menu.php");
echo '<div class="corps">';
?>