<?php
session_start();
if (!$_SESSION['pseudo'])
	{
    header('Location: Accueil.php');
    exit();
	}
require __DIR__ . '/include/BDDconnection.php';
?>

<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="style.css" /><title>Mon super site</title></head>
<body><?php include("include/menu.php"); ?><div class="corps">
<h1>Design des vaisseau</h1>

<?php
include("include/message.php");
include("function/fonctionconception.php");
include("function/fonctionvaisseau.php");

$reqcomposantsurlevaisseau = $bdd->prepare("	SELECT COUNT(idtable) AS nb, i.nombatiment, c.iditemcomposant, c.typecomposant
                                                FROM gamer.composantvaisseau c 
      											INNER JOIN items i ON i.iditem = c.iditemcomposant 
      											WHERE c.idvaisseaucompo = ? AND c.typecomposant like ?
                                                GROUP BY iditemcomposant");
 
if(!isset($_GET['id']))
	{ // Pour créer un vaisseau
	include("function/caracteristiquesvaisseau.php"); // function présente dans ''descriptioncompletevaisseau'' qui n'est présent que lorsqu'il y a un Get_Id.
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
	echo '<form method="post" action="conception.php"><input type="submit" value="Fin d\'édition du plan"/></form>';

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

	// Début du plan modifié :
	echo '<h3>Modifications en cours :</h3>'; 

	list($structure, $structuremax) = structurevaisseau (-$repvaiss['idvaisseau']);
	echo $structure.'/'.$structuremax.' de structure. </br>';

	list ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $structure2, $HPvaisseau) = caracteristiquesvaisseau (-$repvaiss['idvaisseau']);
 
	$reqcomposantsurlevaisseau->execute(array(-$repvaiss['idvaisseau'], '%'));
	$repmodifplanexiste = $reqcomposantsurlevaisseau->fetch();
	$reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], '%'));
	$repplanorigineaquelquechose = $reqcomposantsurlevaisseau->fetch(); 
	if (!isset($repmodifplanexiste['nombatiment']) AND isset($repplanorigineaquelquechose['nombatiment']))
		{
		$reqrecreerplanoriginal = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 

        $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], '%'));
        while($repcomposantvaisseauoriginal = $reqcomposantsurlevaisseau->fetch())
        	{
        	for ($i = 1; $i <= $repcomposantvaisseauoriginal['nb']; $i++)
        		{
        		$reqrecreerplanoriginal->execute(array(-$repvaiss['idvaisseau'], $repcomposantvaisseauoriginal['iditemcomposant'], $repcomposantvaisseauoriginal['typecomposant']));
        		}
        	}
        header("Location: conception.php?message=".urlencode($_GET['message'])."&id=" . urlencode($_GET['id']));
        exit; 
		} 

 	$reqcomposantsurlevaisseau->execute(array(-$repvaiss['idvaisseau'], "moteur")); 
 	$repmoteursurlevaisseau = $reqcomposantsurlevaisseau->fetch();
	if (isset($repmoteursurlevaisseau['nombatiment']))
		{
        echo $repmoteursurlevaisseau['nombatiment'].'&emsp;&emsp;Vitesse : '.$vitesse. ' parsec/cycle. </br>'; 
		} 
	else 
		{ 
		echo 'Moteur I';
    	echo '&emsp;&emsp;Vitesse : '.$vitesse. ' parsec/cycle. </br>';
		} 
    
    $a = 0;
    $reqcomposantsurlevaisseau->execute(array(-$repvaiss['idvaisseau'], "soute"));
 	while($repsoutesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $a++;
        $texte = $repsoutesurlevaisseau['nb'].' '.$repsoutesurlevaisseau['nombatiment'].'&emsp;';
        Supprimercomposant($repsoutesurlevaisseau['iditemcomposant'], $texte);
        }
    if ($a == 0)
    	{
        echo 'Soute à échantillons : &emsp;' ;
        }
    echo $capacitedesoute . ' places dans les soutes. </br>';

    echo 'Armement : ';
    $a = 0;
    $reqcomposantsurlevaisseau->execute(array(-$repvaiss['idvaisseau'], "arme"));
 	while($reparmesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'] ;
        Supprimercomposant($reparmesurlevaisseau['iditemcomposant'], $texte);
        $a++;
        }
    if ($a == 0)
		{ 
		echo 'Vaisseau non armé.<br>';
		} 
	echo $capaciteminage . ' capacité de minage. <br>';

    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array(-$repvaiss['idvaisseau'], "coque"));
 	while($repcoquesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repcoquesurlevaisseau['nb'].' '.$repcoquessurlevaisseau['nombatiment'];
        Supprimercomposant($repcoquesurlevaisseau['iditemcomposant'], $texte);
        $a++;
        }
    if ($a == 0)
		{
		echo 'Coque civile. ';
		}

	$reqcomposantsurlevaisseau->execute(array(-$repvaiss['idvaisseau'], "autre")); 
 	while($repautresurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        $texte = $repautresurlevaisseau['nb'].' '.$repautresurlevaisseau['nombatiment'] ;
        Supprimercomposant($repautresurlevaisseau['iditemcomposant'], $texte);
        }

	echo 'Total : '.$HPvaisseau . ' PV.</br>';
	echo 'Prix : '.$totalprixbien.' biens';
	if ($totalprixtitane > 0)
		{
		echo ' et ' . $totalprixtitane . ' de titane';
		}
	echo '. </br></br>';
	// Fin du plan modifié :

	// Début modification :
	composantdesign($_SESSION['id'], 'arme', 'Pas d\'arme disponible');
	composantdesign($_SESSION['id'], 'coque', 'Pas de coque disponible');
	composantdesign($_SESSION['id'], 'soute', 'Pas de soute disponible');
	composantdesign($_SESSION['id'], 'autre', 'Pas de module complémentaire disponible');
	
	if ($structure <= $structuremax)
		{
		echo '<form method="post" action="script/validerplan.php"><p>';
		echo '<input type="hidden" name="idvaisseau" value="'.$_GET['id'].'"> ';
		echo '<input type="submit" id="formulaire" value="Valider les modifications" /></p></form>' ;
		}
	else
		{
		echo 'Impossible de valider (structure incorrecte)';
		}
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
    echo '<a class ="lienmenu" href="Conception.php?id='.$repvaiss['idvaisseau'].'">Modifier</a> ';
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