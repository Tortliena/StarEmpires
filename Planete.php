<?php 
include("planete/01_entete.php");

$reqplanete = $bdg->prepare('SELECT * FROM planete p LEFT JOIN limiteplanete l ON l.idlimiteplanete = p.idplanete WHERE p.idplanete = ?');
$reqplanete->execute(array($_GET['id']));
$repplanete = $reqplanete->fetch();

include("planete/02_debutpage.php");

$reqcompterpop = $bdg->prepare('SELECT  COUNT(*) AS population,
                                        sum(case when typepop = 1 then 1 else 0 end) AS citoyens,
                                        sum(case when typepop = 2 then 1 else 0 end) AS ouvriers,
                                        sum(case when typepop = 3 then 1 else 0 end) AS scientifiques
                                        FROM population
                                        WHERE idplanetepop = ?');
$reqcompterpop->execute(array($_GET['id']));                               
$repcompterpop = $reqcompterpop->fetch();

$reqcompterflotte = $bdg->prepare('SELECT COUNT(*) AS nb FROM flotte WHERE idplaneteflotte = ?');
$reqcompterflotte->execute(array($_GET['id']));                               
$repcompterflotte = $reqcompterflotte->fetch();

include("planete/06_infogeneraleplanete.php");

include("planete/10_gestionpop.php");

if ($replvl['lvl'] > 1)
  {
  include("planete/15_infobatiments.php");
  }

if ($repcompterpop['ouvriers']>0)
  { 
  include("planete/20_chantierconstruction.php");
  }

include("planete/25_vaisseauxenorbite.php");

echo '<table class="silo"><caption><h3>Entrepôts</h3></caption><tr><td class="silo1ereligne">Objet</td><td class="silo1ereligne">Quantité</td><td class="silo1ereligne">Utilité</td></tr>'; 
if ($repplanete['biens']>0) 
  { 
  echo '<tr><td class="silonom">Biens divers</td>'; 
  echo '<td class="siloquantite">'.$repplanete['biens'].'</td>'; 
  echo '<td class="silodescription">Sous ce nom, vous retrouvez tout un ensemble de biens divers, allant des outils quotidiens aux grosses machines sans ressources particulières. Ils sont consommé lorsque vous lancez des productions, formez de la population ou régulièrement par toute la population. Ils sont produits par les citoyens. Cela représente le système économique classique de votre monde.</td></tr>'; 
  } 
if ($repplanete['titane']>0) 
  { 
  echo '<tr><td class="silonom">Métaux rares</td>'; 
  echo '<td class="siloquantite">'.$repplanete['titane'].'</td>'; 
  echo '<td class="silodescription">Cela représente les métaux rares raffinés et prêts à être utilisés. Notre monde est extrêmement pauvres et l\'espace semble être un endroit propice pour en récupérer.</td></tr>'; 
  } 
 
$reqSiloItems = $bdd->prepare(' SELECT s.quantite, i.description, i.nombatiment 
                                FROM gamer.silo s 
                                INNER JOIN items i 
                                ON i.iditem = s.iditems 
                                WHERE s.idplanetesilo = ?'); 
$reqSiloItems->execute(array($_GET['id'])); 
 
while($repSiloItems = $reqSiloItems->fetch()) 
  {  
  if ($repSiloItems['quantite']>0) 
        { 
        echo '<tr><td class="silonom">'. ucfirst($repSiloItems['nombatiment']);  
        echo '</td><td class="siloquantite">'.$repSiloItems['quantite']; 
        echo '</td><td class="silodescription">'.$repSiloItems['description']; 
        echo '</td></tr>'; 
        } 
    }
    ?>  
</table></div></body> 
