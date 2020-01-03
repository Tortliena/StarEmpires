<?php
try
{
    // On se connecte à MySQL
$bdd = new PDO('mysql:host=localhost;dbname=test;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
}
catch(Exception $e)
{
    // En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}

// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table jeux_video
// $reponse = $bdd->query('SELECT * FROM jeux_video');

// Récupération partielle :
$reponse = $bdd->query('SELECT * FROM jeux_video WHERE possesseur=\'Patrick\' AND prix < 20') or die(print_r($bdd->errorInfo()));
//Ce code va causer des erreurs car je ne récupère pas tout et plus tard je demande d'écrire la console ou le commentaire.
// Possibilité d'utiliser OR 

Afficher par prix décroissant :
// SELECT * FROM jeux_video ORDER BY prix DESC

Prendre certaines entrées :
// $reponse = $bdd->query('SELECT nom FROM jeux_video LIMIT 0, 10');

Gros mélange :
// SELECT nom, possesseur, console, prix FROM jeux_video WHERE console='Xbox' OR console='PS2' ORDER BY prix DESC LIMIT 0,10


// On affiche chaque entrée une à une
while ($donnees = $reponse->fetch())
{
?>
    <p>
    <strong>Jeu</strong> : <?php echo $donnees['nom']; ?><br />
    Le possesseur de ce jeu est : <?php echo $donnees['possesseur']; ?>, et il le vend à <?php echo $donnees['prix']; ?> euros !<br />
    Ce jeu fonctionne sur <?php echo $donnees['console']; ?> et on peut y jouer à <?php echo $donnees['nbre_joueurs_max']; ?> au maximum<br />
    <?php echo $donnees['possesseur']; ?> a laissé ces commentaires sur <?php echo $donnees['nom']; ?> : <em><?php echo $donnees['commentaires']; ?></em>
   </p>
<?php
}
$reponse->closeCursor(); // Termine le traitement de la requête
?>



Requêtes préparées (protection) :
Autre sécurité à ajouter : Vérifier que Get_possesseur est un nom et prix est un nombre.
<?php
$req = $bdd->prepare('SELECT nom, prix FROM jeux_video WHERE possesseur = ?  AND prix <= ? ORDER BY prix');
// Alternative : 
//$req = $bdd->prepare('SELECT nom, prix FROM jeux_video WHERE possesseur = :possesseur AND prix <= :prixmax');
//$req->execute(array('possesseur' => $_GET['possesseur'], 'prixmax' => $_GET['prix_max']));

$req->execute(array($_GET['possesseur'], $_GET['prix_max']));

echo '<ul>';
while ($donnees = $req->fetch())
{
    echo '<li>' . $donnees['nom'] . ' (' . $donnees['prix'] . ' EUR)</li>';
}
echo '</ul>';


$req->closeCursor();

?>