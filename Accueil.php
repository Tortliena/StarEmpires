<?php
include($_SERVER['DOCUMENT_ROOT'].'/include/entete.php');
?>
<h1>Bienvenue</h1>
<!-- Soit message de bienvenue, soit un message d'erreur ici -->
<?php include("include/message.php");?>

<h3>Connection :</h3>
<form method="post" action="script/connection.php">
    <p>
        <label for="pseudo">Votre pseudo :</label>
        <input type="text" name="pseudo" id="pseudo" placeholder="Entrez ici votre pseudo" size="25" maxlength="80" /><br />

        <label for="pass">Votre mot de passe :</label>
      	<input type="password" name="pass" placeholder="Entrez ici votre mot de passe" id="pass" size="25" /><br />
      	<input type="checkbox" name="cookie" id="cookie" /> <label for="cookie">Rester connecté</label>
      	<input type="submit" value="Valider" />
  	</p>
</form>

<h3>Inscription :</h3>
<form method="post" action="script/inscription.php">
    <p>
        <label for="pseudo">Votre pseudo :</label>
        <input type="text" name="pseudo" id="pseudo" placeholder="Entrez ici votre pseudo" size="25" maxlength="80" /><br />

        <label for="pass">Votre mot de passe :</label>
      	<input type="password" name="pass" placeholder="Entrez ici votre mot de passe" id="pass" size="25" /><br />

        <label for="pass2">Confirmer votre mot de passe :</label>
      	<input type="password" name="pass2" placeholder="Réentrez votre mot de passe" id="pass2" size="25" /><br />
      	
      	<input type="submit" value="Valider" />
  	</p>
</form>

<?php
require __DIR__ . '/include/affichernews.php';
?>

    </div>
    </body>
</html>