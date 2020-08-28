<?php
session_start();
if (!$_SESSION['pseudo'])
	{
    header('Location: Accueil.php');
    exit();
	}
require __DIR__ . '/../include/BDDconnection.php';
?>

<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="../style.css" /><title>Mon super site</title></head>
<body><?php include("../include/menu.php"); ?><div class="corps">
<h1>Design des vaisseau</h1>

<?php
include("../include/message.php");
include("fonction/fonctionconception.php");
include("fonction/fonctionvaisseau.php");
include("fonction/caracteristiquesvaisseau.php");
include("fonction/structurevaisseau.php");

$reqcomposantsurlevaisseau = $bdd->prepare("	SELECT COUNT(idtable) AS nb, i.nombatiment, c.iditemcomposant, c.typecomposant
                                                FROM gamer.composantvaisseau c 
      											INNER JOIN items i ON i.iditem = c.iditemcomposant 
      											WHERE c.idvaisseaucompo = ? AND c.typecomposant like ?
                                                GROUP BY iditemcomposant");
 
if(!isset($_GET['id']))
	{ // Pour créer un vaisseau
	echo '<h2>Création d\'un nouveau design :</h2>';
	// Formulaire pour créer un design.
	echo '<form method="post" action="script/creerdesign.php"><p>' ;
	echo '<input type="text" name="nom" id="nom" placeholder="NOMMER VOTRE DESIGN" size="25" maxlength="64" /></br>';

	echo 'Moteur : ';
	composantdesign($_SESSION['id'], 'moteur', 'Moteur I');
	if ($replvl['lvl']>=10)
		{
		echo 'Noyau : ';
		composantdesign($_SESSION['id'], 'noyau', 'Aucun noyau');
		}
	echo '&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Commencer" /></p></form>' ; 
	}
else
	{ // Section gérant les modifications de plan.

	// Permet de sortir de la phase de modification d'un plan.
	echo '<form method="post" action="00_conception.php"><input type="submit" value="Fin d\'édition du plan"/></form>';

	echo '&emsp;<form method="post" action="script/supprimerconception.php?id='.-$_GET['id'].'"><input type="submit" value="Réinitialisation du plan"/></form>';

	// Permet d'avoir le plan actuel :
	$reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idflottevaisseau = ? AND idvaisseau = ?');
	$reqvaiss->execute(array(-$_SESSION['id'], $_GET['id'])); 
	$repvaiss = $reqvaiss->fetch(); 
 
	echo '<form method="post" action="script/renommer.php"><h3>' . $repvaiss['nomvaisseau'] . ' : ';
	echo '<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80"/> ';
	echo '<input name="id" type="hidden" value="'.$_GET['id'].'"> ';
	echo '<input name="type" type="hidden" value="vaisseau"> ';
	echo '<input type="submit" value="Renommer"/></h3></form> ';

	echo '<h3>Actuellement :</h3>'; 
	
	descriptioncompletevaisseau($_GET['id'], $_SESSION['id'], $replvl['lvl']);

	// Fonction et valeur en retour lié au plan modifié.
	list ($structure, $structuremax) = modificationvaisseau($_GET['id'], $_SESSION['id'], $replvl['lvl'], 2);
	}

$ecrirehangars = 1;
$reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idflottevaisseau = ? ORDER BY idvaisseau');
$reqvaiss->execute(array(-$_SESSION['id']));
while ($repvaiss = $reqvaiss->fetch())
    {
    if ($ecrirehangars == 1) {echo '<h2>Design existants :</h2>' ; }
        $ecrirehangars = 2 ;

 	$reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "arme"));
 	$repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();

    echo '<h3>' . $repvaiss['nomvaisseau'] . ' : '; 
    echo '<a class ="lienmenu" href="00_Conception.php?id='.$repvaiss['idvaisseau'].'">Modifier</a> ';
    echo '<a class ="lienmenu" href="script/supprimerconception.php?id='.$repvaiss['idvaisseau'].'">Supprimer</a></h3>';

	list($structure, $structuremax) = structurevaisseau ($repvaiss['idvaisseau']);
	echo $structure.'/'.$structuremax.' de structure. </br>';

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
	echo '</br>'.$repvaiss['HPmaxvaisseau'] . ' PV. </br>';
	echo 'Prix : ';
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