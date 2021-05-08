<?php
include($_SERVER['DOCUMENT_ROOT'].'/include/entete.php');

echo '<h1>Bienvenue</h1>';

include("include/message.php");
?>

<div class="box">
<form class="formulaireacceuil" method="post" action="script/connection.php">
<h3>Connection :</h3>
  <input type="text" autocomplete="off" id="pseudo" name="pseudo" class="inputpseudo" required/>  
  <label for="pseudo" class="titreinput"><span class="contenuinput">Votre pseudo</span></label></input>
  <br>
  <input type="password" autocomplete="current-password" name="pass" id="pass" class="inputmdp" required/>
  <label for="pass" class="titreinput2"><span class="contenuinput2">Mot de passe</span></label></input>
  <br>
  <input type="submit" value="Valider" />
</form>

<form class="formulaireacceuil" method="post" action="script/inscription.php">
<h3>Inscription :</h3>
  <input type="text" autocomplete="off" id="pseudo2" name="pseudo" class="inputpseudo" required/>
  <label for="pseudo2" class="titreinput"><span class="contenuinput">Votre pseudo</span></label></input>
  <br>
  <input type="password" autocomplete="off" name="pass3" id="pass3" class="inputmdp" required/>
  <label for="pass3" class="titreinput2"><span class="contenuinput2">Mot de passe</span></label></input>
  <br>
  <input type="password" autocomplete="off" name="pass2" id="pass2" class="inputmdp" required/>
  <label for="pass2" class="titreinput3"><span class="contenuinput3">Confirmer mdp</span></label></input>
  <br>
  <input type="submit" value="Valider" />
</form>
</div>
<?php
require __DIR__ . '/include/affichernews.php';

echo '</div></body></html>';
?>