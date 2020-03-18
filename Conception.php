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
 
$reqcomposantsurlevaisseau = $bdd->prepare("	SELECT COUNT(idtable) AS nb, i.nombatiment FROM gamer.composantvaisseau c 
      											INNER JOIN items i ON i.iditem = c.iditemcomposant 
      											WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?
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
	$reqvaiss = $bdg->prepare('SELECT * FROM vaisseau WHERE idjoueurvaisseau = ? AND idvaisseau = ?'); 
	$reqvaiss->execute(array(-$_SESSION['id'], $_GET['id'])); 
	$repvaiss = $reqvaiss->fetch(); 
 
	echo '<form method="post" action="script/renommer.php"><h3>' . $repvaiss['nomvaisseau'] . ' : ';
	echo '<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80"/> ';
	echo '<input name="id" type="hidden" value="'.$_GET['id'].'"> ';
	echo '<input name="type" type="hidden" value="vaisseau"> ';
	echo '<input type="submit" value="Renommer"/></h3></form> ';



	 
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
    
    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "soute")); 
 	WHILE($repsoutesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        echo $repsoutesurlevaisseau['nb'].' '.$repsoutesurlevaisseau['nombatiment'].'<br>' ; 
        if ($a == 0)
            {
               
            }
        else
            {
            }
        $a++;
        }
    echo $repvaiss['capacitedesoute'] . ' places dans les soutes. </br></br>'; 

    echo 'Armement : <br>'; 
    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "arme")); 
 	WHILE($reparmesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        echo $reparmesurlevaisseau['nb'].' '.$reparmesurlevaisseau['nombatiment'].'<br>' ; 
        if ($a == 0)
            {
               
            }
        else
            {
            }
        $a++;
        }
    if ($a == 0) 
		{ 
		echo 'Vaisseau non armé.'; 
		} 
	echo $repvaiss['capaciteminage'] . ' capacité de minage. <br></br>'; 
	
    $a = 0; // Voir plus tard pour refaire cette partie.
    $reqcomposantsurlevaisseau->execute(array($repvaiss['idvaisseau'], "coque")); 
 	WHILE($repcoquesurlevaisseau = $reqcomposantsurlevaisseau->fetch())
        {
        echo $repcoquesurlevaisseau['nb'].' '.$repcoquessurlevaisseau['nombatiment'].'<br>' ; 
        if ($a == 0)
            {
               
            }
        else
            {
            }
        $a++;
        }
    if ($a == 0) 
		{ 
		echo 'Coque civile.'; 
		} 
	echo '</br>'.$repvaiss['HPmaxvaisseau'] . ' PV. <br></br>'; 
	echo 'Prix : ';   
	echo $repvaiss['biensvaisseau'] . ' biens'; 
	if ($repvaiss['titanevaisseau'] > 0) 
		{ 
		echo ' et ' . $repvaiss['titanevaisseau'] . ' de titane'; 
		} 
	echo '. </br></br>'; 
 
	$structure = structurevaisseau ($_GET['id']); 
    
    echo '<h3>Ajouter composant :</h3>';
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