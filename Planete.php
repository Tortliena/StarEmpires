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

include("planete/06_infogeneraleplanete.php");

include("planete/10_gestionpop.php");

include("planete/15_infobatiments.php");

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
        WHERE silo.idplanetesilo = ? AND silo.quantite > 0 AND items.typeitem = "autre" 
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
$reqmenuderoulantvaisseau = $bdg->prepare('SELECT idvaisseau, nomvaisseau FROM vaisseau WHERE idflottevaisseau = ?'); 
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

$a = 0;
$reqflotteenorbite = $bdg->prepare("SELECT idflotte, nomflotte FROM flotte WHERE idplaneteflotte = ? AND universflotte = ? AND xflotte = ? AND yflotte = ?") ;   
$reqvaisseauenorbite = $bdg->prepare("SELECT v.idvaisseau, v.nomvaisseau, v.HPmaxvaisseau, v.HPvaisseau   
                FROM vaisseau v
                INNER JOIN flotte f
                ON f.idflotte = v.idflottevaisseau
                WHERE idplaneteflotte = ?") ;   
$reqvaisseauenorbite ->execute(array(-$_GET['id']));   
while ($repvaisseauenorbite = $reqvaisseauenorbite ->fetch())   
	{
	if ($a == 0)
		{
		echo '<h2>Vaisseaux en orbite :</h2>';
		}
	$a++;

	$PourcentHP = $repvaisseauenorbite['HPvaisseau'] / $repvaisseauenorbite['HPmaxvaisseau'] * 100 ;   


	echo '<a href="vaisseau.php?id=' . $repvaisseauenorbite['idvaisseau'] . '">' . $repvaisseauenorbite['nomvaisseau'] . '</a> (' . number_format($PourcentHP, 0) . '%) ';
	
  if ($PourcentHP < 100)
    {
    //Requête pour réparer le vaisseau
    echo '&nbsp<form method="post" action="script/ordrevaisseau.php">'; 
    echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
    echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseauenorbite['idvaisseau'].'">';
    echo '<input name="idflotte" type="hidden" value="0">';
    echo '<input name="mouvement" type="hidden" value="4">';
    echo '<input type="submit" value="Réparer"/></form> '; 
    }
  
  $reqflotteenorbite ->execute(array($_GET['id'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete']));  
  while ($repflotteenorbite = $reqflotteenorbite ->fetch())   
    {
    //requete pour trouver toutes les flottes en orbite du joueur et y envoyer le vaisseau.
    echo '&nbsp<form method="post" action="script/ordrevaisseau.php">'; 
    echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
    echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseauenorbite['idvaisseau'].'">';
    echo '<input name="idflotte" type="hidden" value="'.$repflotteenorbite['idflotte'].'">';
    echo '<input name="mouvement" type="hidden" value="1">';
    echo '<input type="submit" value="'.$repflotteenorbite['nomflotte'].'"/></form>'; 
    }
	
  echo '&nbsp<form method="post" action="script/ordrevaisseau.php">'; 
	echo '<input name="idplanete" type="hidden" value="'.$_GET['id'].'">';
	echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseauenorbite['idvaisseau'].'">';
  echo '<input name="idflotte" type="hidden" value="0">';
  echo '<input name="mouvement" type="hidden" value="2">';
  echo '<input type="submit" value="Créer flotte"/></form></br>';
	} 

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
