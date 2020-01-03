<form method="post" action="cible.php">
 <p>
    On insèrera ici les éléments de notre formulaire.
</p>
 </form>

 Methode :
 	Post = variables avec le changement de page
 	Get = variables dans URL


Petit texte :
<form action="cible.php" method="post">
<p>
    <input type="text" name="prenom" />
    <input type="submit" value="Valider" />
</p>
</form>
Réception :
 <?php echo $_POST['prenom']; ?>



ZONE DE TEXTE
 <textarea name="message" rows="8" cols="45">
Votre message ici.
</textarea>
 <?php echo $_POST['message']; ?>


Données chachées :
<input type="hidden" name="pseudo" value="Mateo21" />


Autres variables superglobales :
$_SESSION
$_COOKIE


<pre>
<?php
print_r($_GET);
?>
</pre>
Permet d'afficher toutes les infos.