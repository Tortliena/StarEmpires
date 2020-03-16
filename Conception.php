<?php 
session_start(); 
if (!$_SESSION['pseudo']) 
	{ 
    header('Location: Accueil.php'); 
    exit();  
	} 
include("include/BDDconnection.php"); 
?> 
 
<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="style.css" /><title>Mon super site</title></head> 
<body><?php include("include/menu.php"); ?><div class="corps"> 
 <h1>Design des vaisseau</h1> 
 
<?php 
include("include/message.php"); 
include("function/fonctionconception.php"); 
include("function/structurevaisseau.php"); 
 
$reqcomposantsurlevaisseau = $bdd->prepare("	SELECT i.nombatiment FROM gamer.composantvaisseau c 
      											INNER JOIN items i ON i.iditem = c.iditemcomposant 
      											WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?"); 
 
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
	{ 
	$reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idjoueurvaisseau = ? AND idvaisseau = ?'); 
	$reqvaiss->execute(array(-$_SESSION['id'], $_GET['id'])); 
	$repvaiss = $reqvaiss->fetch(); 
 
	echo '<h3>' . $repvaiss['nomvaisseau'] . ' : </h3>'; 
	 
	list($structure, $structuremax) = structurevaisseau ($repvaiss['idvaisseau']); 
	echo $structure.'/'.$structuremax.' de structure. </br>'; 
 
 	$reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "moteur")); 
 	$repmoteursurlevaisseau = $reqcomposantsurlevaisseau->fetch(); 
	if (isset($repmoteursurlevaisseau['nombatiment'])) 
		{ 
		echo $repmoteursurlevaisseau['nombatiment']; 
		} 
	else 
		{ 
		echo 'Moteur I'; 
		} 
	echo '&emsp;&emsp;Vitesse : '.$repvaiss['vitesse'] . ' parsec/cycle. </br></br>'; 
 
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
 
	$structure = structurevaisseau ($_GET['id']); 
 
	echo 'Armement : '; 
	composantdesign($_SESSION['id'], 'arme', 'Sans armement'); 
 
	echo 'Coque : '; 
	composantdesign($_SESSION['id'], 'coque', 'Coque civile'); 
 
	echo 'Soute : '; 
	composantdesign($_SESSION['id'], 'soute', 'Soute à échantillons'); 
	} 
 
$ecrirehangars = 1 ; 
$reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idjoueurvaisseau = ? ORDER BY idvaisseau'); 
 
$reqvaiss->execute(array(-$_SESSION['id'])); 
while ($repvaiss = $reqvaiss->fetch()) 
    { 
    if ($ecrirehangars == 1) {echo '<h2>Design existants :</h2>' ; } 
        $ecrirehangars = 2 ; 
 	 
 	$reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "arme")); 
 	$repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch(); 
 
 
    echo '<h3>' . $repvaiss['nomvaisseau'] . ' : '; 
    echo '<a class ="lienmenu" href="Conception.php?id='.$repvaiss['idvaisseau'].'">modifier</a></h3>'; 
	 
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