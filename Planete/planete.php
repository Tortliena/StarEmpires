<?php 
include("../include/entete.php");

$reqplanete = $bd->prepare('SELECT * FROM c_planete p LEFT JOIN c_limiteplanete l ON l.idlimiteplanete = p.idplanete WHERE p.idplanete = ?');
$reqplanete->execute(array($_GET['id']));
$repplanete = $reqplanete->fetch();

include("02_debutpage.php");

$reqcompterpop = $bd->prepare('SELECT COUNT(*) AS population,
                                      sum(case when typepop = 1 then 1 else 0 end) AS citoyens,
                                      sum(case when typepop = 2 then 1 else 0 end) AS ouvriers,
                                      sum(case when typepop = 3 then 1 else 0 end) AS scientifiques,
                                      sum(case when typepop = 4 then 1 else 0 end) AS soldats
                                      FROM c_population
                                      WHERE idplanetepop = ?');
$reqcompterpop->execute(array($_GET['id']));                               
$repcompterpop = $reqcompterpop->fetch();

$reqcompterflotte = $bd->prepare('SELECT COUNT(*) AS nb FROM c_flotte WHERE idplaneteflotte = ?');
$reqcompterflotte->execute(array($_GET['id']));                               
$repcompterflotte = $reqcompterflotte->fetch();

include("06_infogeneraleplanete.php");

include("10_gestionpop.php");

if ($replvl['lvl'] > 1)
  {
  include("15_infobatiments.php");
  }

if ($repcompterpop['ouvriers']>0)
  { 
  include("20_chantierconstruction.php");
  include("22_constructionsencours.php");
  }

include("25_vaisseauxenorbite.php");

include("30_silo.php");

echo '</table></div></body>';