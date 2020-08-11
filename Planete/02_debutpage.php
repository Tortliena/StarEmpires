<?php
if ($repplanete['idjoueurplanete'] != $_SESSION['id']) 
    { 
    header('Location: Accueil.php'); exit(); 
    }
   
echo '<form method="post" action="script/renommer.php"><h1>Planete :'.$repplanete['nomplanete'] ;  
echo ' <input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80"/> ';
echo '<input name="id" type="hidden" value="'.$_GET['id'].'">';
echo '<input name="type" type="hidden" value="planete">';
echo '<input type="submit" value="Renommer"/></h1></form>';

include("include/message.php") ; 
$typemessage = 'planete' ;  
include("include/resume.php"); 
include("Function/infobulle.php");
?>