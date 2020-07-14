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
   
<body><?php include("include/menu.php");    

$reqvaisseau = $bdg->prepare('	SELECT idflottevaisseau, nomvaisseau, vitesse, capacitedesoute, capaciteminage, HPvaisseau, HPmaxvaisseau
								FROM vaisseau
								WHERE idvaisseau = ?');

$reqvaisseau->execute(array($_GET['id']));
$repvaisseau = $reqvaisseau->fetch();

// chercher info sur la flotte du vaisseau :
$reqinfoflotte = $bdg->prepare('	SELECT idplaneteflotte FROM flotte WHERE idflotte = ?');
$reqinfoflotte->execute(array($repvaisseau['idflottevaisseau']));   
$repinfoflotte = $reqinfoflotte->fetch();

// On prend la valeur absolue car si valeur négative, cela veut dire que la flotte est défensive/en orbite.
$idplanete = abs($repinfoflotte['idplaneteflotte']) ; 

$reqinfoplanete = $bdg->prepare('SELECT idjoueurplanete FROM planete WHERE idplanete = ?');
$reqinfoplanete->execute(array($idplanete));   
$repinfoplanete = $reqinfoplanete->fetch();

if ($repinfoplanete['idjoueurplanete'] != $_SESSION['id'])
	{ header('Location: Accueil.php'); exit(); }   
  
?>   
<div class="corps">   
<form method="post" action="script/renommer.php"><h1>Vaisseau : <?php echo $repvaisseau['nomvaisseau'] ;?>    
<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />   
<input name="id" type="hidden" value="<?php echo $_GET['id'] ;?>">   
<input name="type" type="hidden" value="vaisseau">   
<input type="submit" value="Renommer"/></h1></form>   
   
<?php   
include("include/message.php");   
$typemessage = 'vaisseau' ;   
include("include/resume.php");   
   
include("function/fonctionvaisseau.php");   
   
$reqcomposantsurlevaisseau = $bdd->prepare("SELECT i.nombatiment FROM gamer.composantvaisseau c   
          INNER JOIN items i ON i.iditem = c.iditemcomposant   
          WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?");   
         
if ($replvl['lvl']>=3)   
    {   
    echo '<p>Vitesse du vaisseau : ' . $repvaisseau['vitesse'] . ' parsec/cycle</p>';    
    }   

$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.   
$reqverifcargo = $bdg->prepare("SELECT c.quantiteitems , i.nombatiment   
                FROM cargovaisseau c   
                INNER JOIN datawebsite.items i   
                ON i.iditem = c.typeitems   
                WHERE idvaisseaucargo = ?") ;   
$reqverifcargo ->execute(array($_GET['id']));   
while ($repverifcargo  = $reqverifcargo ->fetch())   
	{   
	if ($a == 0)   
		{   
		$texteexplication = '<p>Ce vaisseau transporte ';   
		}   
	else   
		{ // Permet de gérer les cas avec de multiples items dans les soutes.   
		$texteexplication .= ', ';   
		}   
	// Affiche ce qui est dans le cargo.   
	$texteexplication .= $repverifcargo['quantiteitems'].' '.$repverifcargo['nombatiment'] ;   

	$a = $a + $repverifcargo['quantiteitems'];   
	} 
if ($a != 0)   
    {   
    echo $texteexplication ;   
    echo '.</p>';    
    }   

if ($replvl['lvl']>=3)   
    {   
    echo '<p>Capacité des soutes : ' . $a . '/' . $repvaisseau['capacitedesoute'] . '. Capacité de minage : ' . $repvaisseau['capaciteminage'] . '</p>';   
    }   

if ($replvl['lvl']>=5)   
    {   
    $PourcentHP = $repvaisseau['HPvaisseau'] / $repvaisseau['HPmaxvaisseau'] * 100 ;   
    echo '<p>PV : ' . number_format($PourcentHP, 0) . '%';    
       
    $reqcomposantsurlevaisseau->execute(array($_GET['id'], 'arme'));   
    $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();   
    echo '&emsp; Armement : ';   
	if (isset($repcomposantsurlevaisseau['nombatiment']))   
		{   
		echo ucfirst($repcomposantsurlevaisseau['nombatiment']);   
		}   
	else   
		{   
		echo 'Vaisseau non armé.';   
		}   
    echo '</p>';   
    }   

// Permet d'afficher cette partie avec le niveau suffisant.   
if ($replvl['lvl']>=6)   
	{   
	// Afficher ce qui est actuellement sur votre vaisseau.    
	echo '<h2>Composants dans votre vaisseau :</h2>';   
	   
	composanthangars('moteur', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

	composanthangars('soute', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

	composanthangars('arme', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   

	if ($replvl['lvl']>=8)   
		{   
		// Donner accès à cette partie plus tard dans les niveaux.   
		composanthangars('coque', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   
		}   

	if ($replvl['lvl']>=10)   
		{   
		// Donner accès à cette partie plus tard dans les niveaux.   
		composanthangars('noyau', $_SESSION['id'], $_GET['id'], $repplanete['idplanete']);   
		}   

	echo '<h2>Composants dans les stocks :</h2>';   
	$reqsiloitems = $bdd->prepare("   
	                SELECT s.quantite, i.description, i.nombatiment   
	                FROM gamer.silo s   
	                INNER JOIN items i   
	                ON i.iditem = s.iditems   
	                WHERE s.idplanetesilo = ?   
	                AND i.typeitem = 'composant'");   
	$reqsiloitems->execute(array($repplanete['idplanete']));   

	$b = 0; // Permet de gérer le cas avec 0 composant en stock   
	while($repsiloitems = $reqsiloitems->fetch())   
		{   

		if ($repsiloitems['quantite']>0)   
		    {   
		    $b++;   
		    echo $repsiloitems['quantite'] . ' ' . $repsiloitems['nombatiment'] . '</br>';   
		    }    
	 	}   
	if ($b == 0)   
		{   
		echo 'Rien en stock' ;    
		}   
	} // Fin de la partie sur les modules.    
?>   
  </div>   
  </body>   
</html>