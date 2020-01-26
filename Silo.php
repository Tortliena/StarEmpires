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
    <h1>SILO</h1>
    
    <?php
    include("include/message.php") ; 
    $typemessage = 'silo' ;
    include("include/resume.php");

$reqbiens = $bdg->prepare('SELECT biens, titane FROM utilisateurs WHERE id= ?');
$reqbiens->execute(array($_SESSION['id']));
$quantbiens = $reqbiens->fetch();

?><table class="silo"><caption>Inventaire</caption><tr><td class="silo1ereligne">Objet</td><td class="silo1ereligne">Quantité</td><td class="silo1ereligne">Utilité</td></tr>
  <?php
  if ($quantbiens['biens']>0)
    {?>
    <tr>
    <td class="silonom">Biens divers</td>
    <td class="siloquantite"><?php echo $quantbiens['biens']; ?></td>
    <td class="silodescription">Sous ce nom, vous retrouvez tout un ensemble de biens divers, allant des outils quotidiens aux grosses machines sans ressources particulières. Ils sont consommé lorsque vous lancez des productions, formez de la population ou régulièrement par toute la population. Ils sont produits par les citoyens. Cela représente le système économique classique de votre monde.</td>
    </tr>
  <?php }
  if ($quantbiens['titane']>0)
    { ?>  
    <tr>
    <td class="silonom">Métaux rares</td>
    <td class="siloquantite"><?php echo $quantbiens['titane']; ?></td>
    <td class="silodescription">Cela représente les métaux rares raffinés et prêts à être utilisés. Notre monde est extrêmement pauvres et l'espace semble être un endroit propice pour en récupérer.</td>
    </tr>

<?php }

$reqSiloItems = $bdd->prepare('
									SELECT s.quantite, i.description, i.nombatiment
									FROM gamer.silo s
									INNER JOIN items i
									ON i.iditem = s.iditems
									WHERE s.idjoueursilo = ?');
$reqSiloItems->execute(array($_SESSION['id']));

while($repSiloItems = $reqSiloItems->fetch())
	{ 
	if ($repSiloItems['quantite']>0)
    { ?>
    <tr>
  	<td class="silonom"><?php echo $repSiloItems['nombatiment']; ?></td>
  	<td class="siloquantite"><?php echo $repSiloItems['quantite']; ?></td>
  	<td class="silodescription"><?php echo $repSiloItems['description']; ?></td>
  	</tr>
	<?php
	} } ?>

</table>

  </div>
  </body>
</html>