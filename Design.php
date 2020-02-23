<?php
session_start();
If (!$_SESSION['pseudo'])
{
    header('Location: Accueil.php');
    exit(); 
}
include("include/BDDconnection.php");
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="style.css" />
    <title>Mon super site</title>
  </head>
<body>
  <?php include("include/menu.php"); ?>

  <div class="corps">
    <h1>Design des vaisseau</h1>

<?php
include("include/message.php");


function composantdesign($idjoueur, $typecomposant, $textepourrien)
	{
	include("include/BDDconnection.php");

	echo '<select name="' . $typecomposant . '" id="' . $typecomposant. '">'; 
	echo '<option value="0">' . $textepourrien . '</option>';

	$reqmenuderoulantdesign = $bdd->prepare('
	    SELECT  items.iditem, items.nombatiment
	    FROM gamer.rech_joueur
	    RIGHT JOIN items
	    ON rech_joueur.idrech = items.technescessaire
	    WHERE rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1
	    AND souscategorie = ? ');
	$reqmenuderoulantdesign->execute(array($idjoueur, $typecomposant));
	while ($repmenuderoulantdesign = $reqmenuderoulantdesign->fetch())
		{
		echo '<option value="' . $repmenuderoulantdesign['iditem'] . '">' . $repmenuderoulantdesign['nombatiment'] . '</option>' ;
		}


	$reqmenuderoulantartefact = $bdd->prepare('SELECT  items.iditem, items.nombatiment
	    FROM gamer.silo
	    RIGHT JOIN items
	    ON silo.iditems = items.iditem
	    WHERE silo.idjoueursilo = ? AND items.itemnecessaire > 0
	    AND souscategorie = ?');

	$reqmenuderoulantartefact->execute(array($idjoueur, $typecomposant));
	while ($repmenuderoulantartefact = $reqmenuderoulantartefact->fetch())
		{
		echo '<option value="' . $repmenuderoulantartefact['iditem'] . '">' . $repmenuderoulantartefact['nombatiment'] . '</option>' ;
		}
	
	echo '</select></br>'; 
	}


echo '<h2>Création d\'un nouveau design :</h2>';
// Formulaire pour créer un design.
echo '<form method="post" action="script/creerdesign.php"><p>' ;
echo '<input type="text" name="nom" id="nom" placeholder="NOMMER VOTRE DESIGN" size="25" maxlength="64" /></br>'; 

echo 'Armement : ';
composantdesign($_SESSION['id'], 'arme', 'Sans armement');

echo 'Coque : ';
composantdesign($_SESSION['id'], 'coque', 'Coque civile');

echo 'Moteur : ';
composantdesign($_SESSION['id'], 'moteur', 'Moteur I');

echo 'Soute : ';
composantdesign($_SESSION['id'], 'soute', 'Soute à échantillons');

if ($replvl['lvl']>=10)
	{
	echo 'Noyau : ';
	composantdesign($_SESSION['id'], 'noyau', 'Aucun noyau');
	}

echo '&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Créer" /></p></form>' ;
// Voir modèle + liste ici avec un lien vers l'affichage.

$ecrirehangars = 1 ;
$reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idjoueurbat = ? AND typevaisseau = 1 ORDER BY idvaisseau');
$reqcomposantsurlevaisseau
      = $bdd->prepare("
      SELECT i.nombatiment
      FROM gamer.composantvaisseau c
      INNER JOIN items i
      ON i.iditem = c.iditemcomposant
      WHERE c.idvaisseaucompo = ?
      AND c.typecomposant = 'arme'
      ");


$reqvaiss->execute(array($_SESSION['id']));
while ($repvaiss = $reqvaiss->fetch())
    {
    if ($ecrirehangars == 1) {echo '<h2>Design existants :</h2>' ; }
        $ecrirehangars = 2 ;
 	
 	$reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau']));
 	$repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();

    echo '<h3>' . $repvaiss['nomvaisseau'] . ' : </h3>';
    echo $repvaiss['vitesse'] . ' parsec/cycle. </br>';
    echo $repvaiss['capacitedesoute'] . ' places dans les soutes. </br>';
	echo $repvaiss['capaciteminage'] . ' capacité de minage. </br>';
	echo 'Armement : ';
	if (isset($repcomposantsurlevaisseau['nombatiment']))
		{
		echo ucfirst($repcomposantsurlevaisseau['nombatiment']);
		}
	else
		{
		echo 'Vaisseau non armé.';
		}
	echo '</br>Prix : ' . $repvaiss['HPmaxvaisseau'] . ' PV. </br>';
	echo $repvaiss['biensvaisseau'] . ' biens';
	if ($repvaiss['titanevaisseau'] > 0)
		{
		echo ' et ' . $repvaiss['titanevaisseau'] . ' de titane';
		}
	echo '. </br></br>';
    }

?>
  </div>
  </body>
</html>