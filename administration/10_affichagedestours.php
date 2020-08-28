<!-- Afficher le tour que l'on veut -->
<form method="get" action="administration.php">
<p>
    <label for="numero_tour">Voir résumé du tour : </label>
    <input type="text" name="voir" id="numero_tour" placeholder="Tour" size="5" maxlength="4" />
    <input type="submit" value="Résumé du tour" />
</p>
</form>

<?php
//Permet de voir le tour qui passe, soit en entrant un nombre, soit en laissant vide la case.

if (isset($_GET["voir"]) and $_GET["voir"] == 0 )
  {
  $reqtourinfo = $bda->query('SELECT * FROM tour ORDER BY id DESC LIMIT 1') or die(print_r($bdd->errorInfo()));
  $reptourinfo = $reqtourinfo->fetch(); 
  echo 'le dernier tour est le tour ' . $reptourinfo['id'] . ' et s\'est passé le ' . $reptourinfo['datetour']  ;
  echo ' <br />  ' . $reptourinfo['resume'] ; 
  }
elseif (isset($_GET["voir"]))
  {
  $reqtourinfo = $bda->prepare('SELECT * FROM tour WHERE id = ?');
  $reqtourinfo->execute(array($_GET["voir"]));
  $reptourinfo = $reqtourinfo->fetch();
  echo 'le tour ' . $reptourinfo['id'] . ' s\'est passé le ' . $reptourinfo['datetour']  ;
  echo ' <br />  ' . $reptourinfo['resume'] ;  
  }
?>
