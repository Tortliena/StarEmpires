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

<body><?php include("include/menu.php");?><div class="corps"><?php
$reqplanete = $bdg->prepare('SELECT * FROM planete p LEFT JOIN limiteplanete l ON l.idlimiteplanete = p.idplanete WHERE p.idplanete = ?');
$reqplanete->execute(array($_GET['id']));
$repplanete = $reqplanete->fetch();
if ($repplanete['idjoueurplanete'] != $_SESSION['id'])
    {
    header('Location: Accueil.php'); exit();
    } ?>
   
<form method="post" action="script/renommer.php"><h1>Planete : <?php echo $repplanete['nomplanete'] ;?> 
<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80"/>
<input name="id" type="hidden" value="<?php echo $_GET['id'] ;?>">
<input name="type" type="hidden" value="planete">
<input type="submit" value="Renommer"/></h1></form>

<?php
include("include/message.php") ;
$typemessage = 'planete' ; 
include("include/resume.php");

$reqcompterpop = $bdg->prepare('SELECT  COUNT(*) AS population,
                                        sum(case when typepop = 1 then 1 else 0 end) AS citoyens,
                                        sum(case when typepop = 2 then 1 else 0 end) AS ouvriers,
                                        sum(case when typepop = 3 then 1 else 0 end) AS scientifiques
                                        FROM population
                                        WHERE idplanetepop = ?');
$reqcompterpop->execute(array($_GET['id']));                                   
$repcompterpop = $reqcompterpop->fetch();

echo 'Taille : '.$repplanete['taille'].' (population maximale de base de la planète).</br>';
if ($repplanete['lune'] > 0)
  {
  echo 'Lunes : '.$repplanete['lune'].' (permet de construire des bâtiments particuliers).</br>'; 
  }

echo '</br><h2>Population et bâtiments :</h2>';
echo $repcompterpop['population']. '/'.$repplanete['popmax'].' unités de population au total, composée de '.$repcompterpop['citoyens'].' citoyen(s) ; '.$repcompterpop['ouvriers'].'/'.$repplanete['ouvriermax'].' ouvrier(s) ; '.$repcompterpop['scientifiques'].'/'.$repplanete['scientmax'].' scientifique(s).</br>' ;

// Affichage de la prod des biens.
$reqprod = $bdg->prepare('SELECT prodbiens, consobiens FROM variationstour WHERE idplanetevariation = ?');
$reqprod->execute(array($_GET['id']));
$prodbiens = $reqprod->fetch();
echo 'Au dernier tour, tu en as produit '.$prodbiens['prodbiens'].' et consommé '.$prodbiens['consobiens'].' biens divers.</br>';

// Formulaire de conversion des pops
echo '<form method="post" action="script/conversionpop.php"><p>';
echo '<label for="combien">Convertir </label><input type="number" name="combien" min="1" value="1">';
echo '<select name="popdepart" id="popdepart">';
$reqtypepop = $bdd->query('SELECT idtypepop , nompop , technecessaire FROM typepop ORDER BY idtypepop ASC');
while ($reptypepop = $reqtypepop->fetch())
  {
  echo '<option value="'. $reptypepop['idtypepop'] . '">'. $reptypepop['nompop'] .'</option>'; 
  }
echo '</select><label for="poparrivee"> en </label><select name="poparrivee" id="poparrivee">';
$reqtypepop = $bdd->query('SELECT idtypepop, nompop, technecessaire FROM typepop ORDER BY idtypepop DESC');
while ($reptypepop = $reqtypepop->fetch())
  {
  echo '<option value="'. $reptypepop['idtypepop'] . '">'. $reptypepop['nompop'] .'</option>'; 
  }
echo '</select><input type="hidden" name="id" value="'.$_GET['id'].'"><input type="hidden" name="supprimer" value="non"><input type="submit" value="Valider"/></p></form>';

// Permet de visualiser les ordres de conversion de pop en cours. 
$reqpoptransf = $bdd->prepare('SELECT p.typepop, p.typepoparrivee, p.idpop, t.nompop AS depart, y.nompop AS arrivee
  FROM gamer.population p
  INNER JOIN typepop t ON t.idtypepop = p.typepop
  INNER JOIN typepop y ON y.idtypepop = p.typepoparrivee
  WHERE idplanetepop = ? AND typepoparrivee <> 0');
// Ouha putain c'est bon de faire une triple table avec deux fois la même table ! ! ! ! :) Je sens que je m'améliore.
$reqpoptransf->execute(array($_GET['id']));
while ($reppoptransf = $reqpoptransf->fetch())
  {
  echo '<form method="post" action="script/conversionpop.php">';
  echo '<input type="hidden" name="supprimer" value="oui">';
  echo '<input type="hidden" name="id" value="'.$_GET['id'].'">';
  echo '<input type="hidden" name="idpop" value="'.$reppoptransf['idpop'].'">';
  echo 'Vous êtes en train de transformer un ' . $reppoptransf['depart'] . ' en ' . $reppoptransf['arrivee'] ;
  echo ' <input type="submit" value="Annuler"/></form></br>';
  }

$reqcompterbatiment = $bdg->prepare('SELECT sum(case when typebat = 1 then 1 else 0 end) AS centrederecherche,
                                            sum(case when typebat = 2 then 1 else 0 end) AS chantier,
                                            sum(case when typebat = 3 then 1 else 0 end) AS megalopole,
                                            sum(case when typebat = 4 then 1 else 0 end) AS baselunaire
                                            FROM batiment WHERE idplanetebat = ?');
$reqcompterbatiment->execute(array($_GET['id']));
$repcompterbatiment = $reqcompterbatiment->fetch();

if(!isset($repcompterbatiment['centrederecherche'])){$repcompterbatiment['centrederecherche']=0;}
if(!isset($repcompterbatiment['chantier'])){$repcompterbatiment['chantier']=0;}
if(!isset($repcompterbatiment['megalopole'])){$repcompterbatiment['megalopole']=0;}
if(!isset($repcompterbatiment['baselunaire'])){$repcompterbatiment['baselunaire']=0;}
echo 'Chantier : '.$repcompterbatiment['chantier'].'/'.$repplanete['maxchantier'].' (permet d\'avoir 5 ouvriers).</br>';
echo 'Centre de recherche : '.$repcompterbatiment['centrederecherche'].'/'.$repplanete['maxcentrederecherche'].' (permet d\'avoir 5 scientifiques).</br>';
echo 'Mégalopoles : '.$repcompterbatiment['megalopole'].'/'.$repplanete['maxmegalopole'].' (augmente la pop max et une constructible par tranche de 4 pop).</br>';
if ($repplanete['lune'] > 0)
  {
  echo 'Base lunaire : '.$repcompterbatiment['baselunaire'].'/'.$repplanete['maxbaselunaire'].' (augmente la pop max et une constructible par lune).</br>';
  }

if ($repcompterpop['ouvriers']>0)
{
echo '</br><h2>Chantier de construction :</h2>';

// Début formulaire pour les constructions. 
$a = 0; //Variable permettant de gérer le cas avec 0 construction possible.
echo '<form method="post" action="script/ordreconstruction.php"><p><label for="combien">Construire </label>';
echo '<input type="number" name="combien" value="1" min="1">';
echo '<select name="trucaconstruire" id="trucaconstruire">';


// Requête pour la liste de construction et basé sur la présence d'un item.
$reqmenuderoulantitems = $bdg->prepare('
        SELECT  items.iditem, items.nombatiment
        FROM silo
        RIGHT JOIN datawebsite.items
        ON items.itemnecessaire = silo.iditems
        WHERE silo.idplanetesilo = ? AND silo.quantite > 0 AND items.typeitem <> "artefact"
        ');
$reqmenuderoulantitems->execute(array($_GET['id']));
while ($repmenuderoulantitems = $reqmenuderoulantitems ->fetch())
    { // Gestion des trucs ayant besoin d'un machin dans les stocks.
    $a++;
    echo '<option value="'.$repmenuderoulantitems['iditem'].'">'.$repmenuderoulantitems['nombatiment'].'</option>';
    }

$reqcountbatatiment = $bdg->prepare('SELECT COUNT(*) AS nb FROM batiment WHERE idplanetebat = ? AND typebat = ?');
// Requete pour la liste de construction et basé sur une limite :
$reqmenuderoulantconstruction = $bdd->prepare('
        SELECT  items.iditem, items.nombatiment, items.nomlimite FROM gamer.rech_joueur
        RIGHT JOIN items ON rech_joueur.idrech = items.technescessaire
        WHERE (items.technescessaire = 0 OR (rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1))
        AND (items.typeitem <> "autre" AND items.typeitem <> "artefact")');
$reqmenuderoulantconstruction->execute(array($_SESSION['id']));
while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
    {
    if(isset($repmenuderoulantconstruction['nomlimite']))
        {
        $limite = $repplanete["{$repmenuderoulantconstruction['nomlimite']}"] ;
        $reqcountbatatiment->execute(array($_GET['id'], $repmenuderoulantconstruction['iditem']));
        $repcountbatatiment = $reqcountbatatiment->fetch();
        }
    
    if (!isset($repmenuderoulantconstruction['nomlimite']) OR $limite > $repcountbatatiment['nb'])
        {
        $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
        echo '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
        }
    }

// Permet de construire des vaisseaux.
$reqmenuderoulantvaisseau = $bdg->prepare('SELECT idvaisseau, nomvaisseau FROM vaisseau WHERE idjoueurvaisseau = ?');
$reqmenuderoulantvaisseau->execute(array(-$_SESSION['id']));
while ($repmenuderoulantvaisseau = $reqmenuderoulantvaisseau ->fetch())
    { // Gestion des trucs ayant besoin d'un machin dans les stocks.
    $a++;
    echo '<option value="'.-$repmenuderoulantvaisseau['idvaisseau'].'">'.$repmenuderoulantvaisseau['nomvaisseau'].'</option>';
    }

if ($a == 0)
    {
    echo '<option disabled selected>Pas de construction possible</option></select>';
    }
else
    {
    echo '</select> <input type="submit" value="Valider" />';
    }
echo '<input type="hidden" name="id" value="'.$_GET['id'].'">';
echo '</p></form>'; // Fin formulaire pour les constructions.

// Requete pour gérer les constructions :
$reqnomitemencoursdeconstruction = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
$reqnomvaisseau = $bdg->prepare("SELECT nomvaisseau FROM vaisseau WHERE idvaisseau = ?");
$reqmess = $bdg->prepare("SELECT message FROM messagetour WHERE domainemess = ? AND numspemessage = ?");

// Affichage des constructions en cours.
$reqconstencours = $bdg->prepare('SELECT * FROM construction WHERE idplaneteconst = ? ORDER BY ordredeconstruction');
$reqconstencours->execute(array($_GET['id']));
while ($repconstencours = $reqconstencours->fetch())
  {
  // Formulaire pour gérer la construction :
  echo '<form method="post" action="script/gererconstruction.php">';

  if ($repconstencours['trucaconstruire']>0)
    { // Cas des constructions d'items.
    $reqnomitemencoursdeconstruction->execute(array($repconstencours['trucaconstruire']));
    $repnom = $reqnomitemencoursdeconstruction->fetch();
    echo $repconstencours['nombre'].' '.$repnom['nombatiment'].' en construction.';
    }
  elseif ($repconstencours['trucaconstruire'] < 0)
    { // Cas des vaisseaux
    $reqnomvaisseau->execute(array(-$repconstencours['trucaconstruire']));
    $repnom = $reqnomvaisseau->fetch();
    echo 'Un vaisseau de type \'' . $repnom['nomvaisseau'] . '\' est en cours de construction.';
    }
  echo ' Reste à investir '.$repconstencours['avancementbiens'].' biens';
  if($repconstencours['avancementtitane']>0)
    {
    echo ' et ' . $repconstencours['avancementtitane'] . ' métaux rares';
    }
  echo ' pour le prochain.';  
  echo '<input type="hidden" name="id" value="'.$_GET['id'].'">';
  echo '<input id = "checkbox'.$repconstencours['idconst'].'" type="checkbox" name="perdreressources"/> <label for="checkbox'.$repconstencours['idconst'].'"></label>';
  echo '<input type="hidden" name="idconstruction" value="'.$repconstencours['idconst'].'">';
  echo '<input type="submit" formaction="script/gererconstruction.php?action=annuler" value="Annuler"/>';
  if ($repconstencours['ordredeconstruction']>0)
    { // La construction est en cours.
    echo ' <input type="submit" formaction="script/gererconstruction.php?action=deprioriser" value="Déprioriser"/>';
    echo ' <input type="submit" formaction="script/gererconstruction.php?action=pause" value="En pause"/>';
    }
  elseif ($repconstencours['ordredeconstruction']<1)
    { // La construction est sur pause.
    echo ' CONTRUCTION ARRÊTÉE <input type="submit" formaction="script/gererconstruction.php?action=reprise" value="Reprendre"/>';
    } 
  echo '</form></br>';
  $reqmess->execute(array('Construction', $repconstencours['idconst']));
  $message = $reqmess->fetch() ;
  if (!empty($message['message']))
    {echo 'Non finit car : '.$message['message'] . '</br></br>' ; }
  else
    {echo '</br>' ; }
  } // Fin de la partie sur les constructions en cours.
} // Fin de la partie si la planète possède au moins 1 ouvrier.

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
    } ?> 
</table>

  </div>
  </body>
</html>