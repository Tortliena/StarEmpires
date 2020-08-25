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

$reqvaisseau = $bdg->prepare('SELECT * FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseau->execute(array($_GET['id']));
$repvaisseau = $reqvaisseau->fetch();

// chercher info sur la flotte du vaisseau :
$reqinfoflotte = $bdg->prepare('SELECT idplaneteflotte FROM flotte WHERE idflotte = ?');
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
include("function/fonctionconception.php");
include("function/fonctionvaisseau.php");   
include("function/caracteristiquesvaisseau.php");
include("function/structurevaisseau.php");
descriptioncompletevaisseau($_GET['id'], $_SESSION['id'], $replvl['lvl']); 

$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.   
echo '<p>';
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
    $texteexplication = 'Ce vaisseau transporte ';   
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
    echo $texteexplication.'. ' ;   
    }

if ($replvl['lvl']>=3)   
    {   
    echo ' Total soute : ' . $a . '/' . $repvaisseau['capacitedesoute'];   
    }
echo '.</p>'; 

if ($replvl['lvl']>=5)   
  {   
  $PourcentHP = $repvaisseau['HPvaisseau'] / $repvaisseau['HPmaxvaisseau'] * 100 ;   
  echo '<p>PV : ' . number_format($PourcentHP, 0) . '%';    
  }   

if ($repinfoflotte['idplaneteflotte']<0) // Pouvoir faire une modification d'un vaisseau uniquement s'il est dans une flotte de défense.
  {
  // Fonction et valeur en retour lié au plan modifié.
  list ($structure, $structuremax) = modificationvaisseau($_GET['id'], $_SESSION['id'], $replvl['lvl'], 1);
  }
?>   
  </div>   
  </body>   
</html>