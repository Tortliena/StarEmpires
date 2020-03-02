<?php
session_start();
If (!$_SESSION['pseudo'])
  {
  header('Location: Accueil.php');
  exit();
  }
include("include/BDDconnection.php");
?>

<!DOCTYPE html><html><head><meta charset="utf-8" /><link rel="stylesheet" href="style.css" /><title>Mon super site</title></head>
<body><?php include("include/menu.php");
$reqplanete = $bdg->prepare('SELECT * FROM planete WHERE idplanete= ?');
$reqplanete->execute(array($_GET['id']));
$repplanete = $reqplanete->fetch();
?>
<div class="corps">   
<form method="post" action="script/renommervaisseau.php"><h1>Planete : <?php echo $repplanete['nomplanete'] ;?>
<input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />
<input name="id" type="hidden" value="<?php echo $_GET['id'] ;?>">
<input type="submit" value="Renommer"/></h1></form>

<?php
include("include/message.php") ;
$typemessage = 'planete' ; 
include("include/resume.php");

    
// Gerer les planetes une par une.
$reqcompterpop = $bdg->prepare('SELECT  COUNT(*) AS population,
                                        sum(case when typepop = 1 then 1 else 0 end) AS citoyens,
                                        sum(case when typepop = 2 then 1 else 0 end) AS ouvriers,
                                        sum(case when typepop = 3 then 1 else 0 end) AS scientifiques
                                        FROM population
                                        WHERE idplanetepop = ?');
$reqcompterpop->execute(array($_GET['id']));                                   
$repcompterpop = $reqcompterpop->fetch();

echo '<h2>Population et bâtiments :</h2>';
echo $repcompterpop['population']. ' unités de population au totale, composée de '.$repcompterpop['citoyens'].' citoyen(s) ; '.$repcompterpop['ouvriers'].' ouvrier(s) ; '.$repcompterpop['scientifiques'].' scientifique(s)' ;


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
echo '</select><input type="submit" value="Valider"/></p></form>';

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
  echo '<form method="post" action="script/supprimerconversion.php">';
  echo '<input type="hidden" name="idpop" value="'.$reppoptransf['idpop'].'">';
  echo 'Vous êtes en train de transformer un ' . $reppoptransf['depart'] . ' en ' . $reppoptransf['arrivee'] ;
  echo ' <input type="submit" value="Annuler"/></form></br>';
  }

/*
// Afficher le nombre de centre de recherche :
$reqcountrecherche = $bdg->prepare('SELECT COUNT(*) AS nbdecentrederecherche FROM batiments WHERE idjoueurbat = ? AND typebat = 1');
$reqcountrecherche->execute(array($_SESSION['id']));
$repcountrecherche = $reqcountrecherche->fetch();

$reqlimitechercheur = $bdg->prepare('SELECT scientmax FROM limitesjoueurs WHERE id = ?');
$reqlimitechercheur->execute(array($_SESSION['id']));
$replimitechercheur = $reqlimitechercheur->fetch();
*/

/*
$total = $repcompterbaselunaire['nb'] + $repcomptermegalopole['nb'] + 8 ; 
echo '</br></br>Population max : 8 + ' . $repcomptermegalopole['nb'] . '/' . $repinfolimites['maxmegalopole'] . ' mégalopole ';
if ($repinfoutilisateur['lvl']>4)
  {
  echo '+ ' . $repcompterbaselunaire['nb'] . '/' . $repinfolimites['maxbaselunaire'] . ' base lunaire ';
  }
echo '= '. $total . ' max';
*/

/*
// Affichage de la prod des biens.
$reqprod = $bdg->prepare('SELECT prodbiens, consobiens FROM variationstour WHERE idjoueur= ?');
$reqprod->execute(array($_SESSION['id']));
$prodbiens = $reqprod->fetch();
$reqprod->closeCursor();
Au dernier tour, tu en as produit <?php echo $prodbiens['prodbiens'];?> et consommé <?php echo $prodbiens['consobiens'];?> biens divers.
*/

echo '</br><h2>Chantier de construction :</h2>';
// Requête pour la liste de construction et basé sur la présence d'un item.
$reqmenuderoulantitems = $bdg->prepare('
        SELECT  items.iditem, items.nombatiment
        FROM silo
        RIGHT JOIN datawebsite.items
        ON items.itemnecessaire = silo.iditems
        WHERE silo.idplanetesilo = ? AND silo.quantite > 0 AND items.typeitem <> "artefact"
        ');

// Requete pour la liste de construction et basé sur une limite :
/* NE MARCHE PLUS AVEC LES MODIFS SUR LA GESTION PAR PLANÈTE ! ! ! 
$reqmenuderoulantconstruction = $bdd->prepare('
        SELECT  items.iditem, items.nombatiment, items.nomlimite
        FROM gamer.rech_joueur
        RIGHT JOIN items
        ON rech_joueur.idrech = items.technescessaire
        WHERE (items.technescessaire = 0 OR (rech_joueur.idjoueurrecherche = ? AND rech_joueur.rechposs = 1))
        AND (items.typeitem <> "autre" AND items.typeitem <> "artefact")
        ');
$reqmenuderoulantconstruction->execute(array($_SESSION['id']));
while ($repmenuderoulantconstruction = $reqmenuderoulantconstruction->fetch())
  {
    if (isset($repmenuderoulantconstruction['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
      {
      // On récupère la limite.
      $reqlimite = $bdg->prepare('SELECT '.$repmenuderoulantconstruction['nomlimite'].' FROM limitesjoueurs WHERE id = ?');
      $reqlimite->execute(array($_SESSION['id']));
      $replimite = $reqlimite->fetch(); // $replimite['0']

      // On récupère le nombre de batiments actuels.
      $reqcomptechantier = $bdg->prepare('SELECT COUNT(idbat) as nb FROM batiments WHERE typebat = ? AND idjoueurbat = ?');
      $reqcomptechantier->execute(array($repmenuderoulantconstruction['iditem'], $_SESSION['id']));
      $repcomptechantier = $reqcomptechantier->fetch();  // $repcomptechantier['nb']
      }

    if (!isset($repmenuderoulantconstruction['nomlimite']) OR $replimite['0']>$repcomptechantier['nb'])
      {
      $a++;  // Variable permettant de gérer le cas ou on a aucune construction possible.
      echo '<option value="'.$repmenuderoulantconstruction['iditem'].'">'.$repmenuderoulantconstruction['nombatiment'].'</option>';
      } 
  }
  $reqmenuderoulantconstruction->closeCursor();
*/

$a = 0; //Variable permettant de gérer le cas avec 0 construction possible

// Début formulaire pour les constructions. 
echo '<form method="post" action="script/ordreconstruction.php"><p><label for="combien">Construire </label>';
echo '<input type="number" name="combien" value="1" min="1"><select name="trucaconstruire" id="trucaconstruire">';
$reqmenuderoulantitems->execute(array($_GET['id']));
  while ($repmenuderoulantitems = $reqmenuderoulantitems ->fetch())
    {
    $a++;
    echo '<option value="'.$repmenuderoulantitems['iditem'].'">'.$repmenuderoulantitems['nombatiment'].'</option>';
    }
    if ($a == 0)
      {
      echo '<option disabled selected>Pas de construction possible</option></select>';
      }
    else
      {
      echo '</select> <input type="submit" value="Valider" />';
      } 
echo '</p></form>'; // Fin formulaire pour les constructions.
 

// Affichage des constructions en cours.
$reqconstencours = $bdg->prepare('SELECT * FROM construction WHERE idplaneteconst = ? ORDER BY ordredeconstruction');
$reqconstencours->execute(array($_GET['id']));

$reqnomitemencoursdeconstruction = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
$reqmess = $bdg->prepare("SELECT message FROM messagetour WHERE domainemess = ? AND numspemessage = ?");

while ($repconstencours = $reqconstencours->fetch())
  {
  if ($repconstencours['trucaconstruire']>0)
    { // Dans le cas ou le truc à contreuire possède un numéro d'item (-1 = conception par exemple) :
    $reqnomitemencoursdeconstruction->execute(array($repconstencours['trucaconstruire']));
    $repnomitemencoursdeconstruction = $reqnomitemencoursdeconstruction->fetch() ;
    
    // Formulaire pour gérer la construction :
    echo '<form method="post" action="script/gererconstruction.php">';
    echo $repconstencours['nombre'].' '.$repnomitemencoursdeconstruction['nombatiment'].' en construction. Reste à investir '.$repconstencours['avancementbiens'].' biens';
    if($repconstencours['avancementtitane']>0)
      {
      echo 'et ' . $repconstencours['avancementtitane'] . ' métaux rares';
      }
    echo ' pour le prochain.';
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
    
    $reqmess->execute(array($typemessage , $repconstencours['idconst']));
    $message = $reqmess->fetch() ;
    if (!empty($message['message']))
      {echo $message['message'] . '</br></br>' ; }
    else
      {echo '</br>' ; }
    }
  elseif ($repconstencours['trucaconstruire'] == -1 OR $repconstencours['trucaconstruire'] == -2)
    { // cas d'une conception
    $reqnomvaisseau = $bdg->prepare("
    SELECT v.nomvaisseau, v.idvaisseau
    FROM vaisseau v INNER JOIN conceptionencours c
    ON c.idvaisseauconception = v.idvaisseau
    WHERE c.idconstruction = ?");
    $reqnomvaisseau->execute(array($repconstencours['idconst']));
    $repnomvaisseau = $reqnomvaisseau->fetch() ;
    
    // Formulaire pour gérer la construction :
    echo '<form method="post" action="script/gererconstruction.php">';
    echo 'Le vaisseau \'' . $repnomvaisseau['nomvaisseau'] . '\' est en cours de rénovation pour un coût restant de ' . $repconstencours['avancementbiens'] . ' biens';
    if ($repconstencours['avancementtitane']>0)
      {
      echo ' et de ' . $repconstencours['avancementtitane'] . ' titane';
      }
    echo '.<input name="idvaisseau" type="hidden" value="' . $repnomvaisseau['idvaisseau'] . '">';
    echo '<input type="hidden" name="idconstruction" value="'.$repconstencours['idconst'].'">';
    echo '<input type="hidden" name="confirmer" value="off"/>'; 
    echo '<input id = "checkbox" type="checkbox" name="confirmer"/> <label for="checkbox"></label>  ';  
    echo '<input name="typeordre" type="hidden" value="-1">';
    echo '<input type="submit" formaction="script/ordredeplacement.php" value="Supprimer l\'ordre"/>'; 
    if ($repconstencours['ordredeconstruction']>0)
      { // La construction est en cours.
      echo ' <input type="submit" formaction="script/gererconstruction.php?action=deprioriser" value="Déprioriser"/>';
      echo ' <input type="submit" formaction="script/gererconstruction.php?action=pause" value="En pause"/>';
      }
    elseif ($repconstencours['ordredeconstruction']<1)
      { // La construction est sur pause.
      echo ' CONTRUCTION ARRÊTÉE <input type="submit" formaction="script/gererconstruction.php?action=reprise" value="Reprendre"/>';
      }
    echo '</form></br></br>';
    }
  }
$reqconstencours->closeCursor();

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