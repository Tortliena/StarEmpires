<?php 
/*
session_start();
require __DIR__ . '/../include/BDDconnection.php'; 
require __DIR__ . '/../function/consommercreeritemsplanetemultiple.php';
require __DIR__ . '/../function/flotte.php';
*/

// récupérer le num du tour ($touractuel['id']) 
$reqtouractuel = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1'); 
$touractuel = $reqtouractuel->fetch(); 
 
// Gestion vaisseau 
$applicationdeplacement = $bdg->prepare("UPDATE flotte SET xflotte = ? , yflotte = ?, universflotte = ? WHERE idflotte = ? "); 
$reqmettrePV1flotte = $bdg->prepare("UPDATE flotte SET xflotte = ?, yflotte = ?, typeordre = ?, bloque = ? WHERE idflotte = ? "); 
$reqmettrePV1vaisseau = $bdg->prepare("UPDATE vaisseau SET HPvaisseau = ? WHERE idflottevaisseau = ? "); 

// Divers 
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess , numspemessage) VALUES (?, ?, ?, ?)"); 
$reqsupprimerordreprecedent = $bdg->prepare('UPDATE flotte SET universdestination = 0, xdestination = 0, ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');
$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 
 
//planete 
$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? AND idjoueurplanete = ?'); 
$reqplanete2 = $bdg->prepare('SELECT xplanete, yplanete, universplanete, idjoueurplanete FROM planete WHERE idplanete = ?'); 
$reqchangementproprioplanete = $bdg->prepare('UPDATE planete SET idjoueurplanete = ?, biens = biens + ?, organisation = 100 WHERE idplanete = ?'); 
$reqpop = $bdg->prepare('INSERT INTO population(idplanetepop, typepop) VALUES(?, ?)'); 
 
// Gestion exploration 
$reqexplorationexistante = $bdg->prepare("SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? "); 
$exploration = $bdg->prepare("INSERT INTO explore (x , y, univers , idexplorateur, tourexploration) VALUES (?, ?, ?, ?, ?)"); 

// Gestion cargo 
$reqverifcargo = $bdd->prepare("    SELECT  v.idvaisseau, v.capacitedesoute
                                    FROM gamer.vaisseau v
                                    LEFT JOIN gamer.cargovaisseau c ON c.idvaisseaucargo  = v.idvaisseau
                                    WHERE v.idflottevaisseau = ?");
$reqverifcargo2 = $bdg->prepare("SELECT SUM(quantiteitems) AS quantitetransportee, quantiteitems FROM cargovaisseau WHERE idvaisseaucargo = ? AND typeitems like ?");
$reqcreercargo = $bdg->prepare("INSERT INTO cargovaisseau (idvaisseaucargo, typeitems, quantiteitems) VALUES (?, ?, ?)"); 
$reqaugmentercargo = $bdg->prepare("UPDATE cargovaisseau SET quantiteitems = ? WHERE idvaisseaucargo = ? AND typeitems = ?"); 
 
// Gestion Silo 
$reqverifsilo = $bdg->prepare("SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?"); 
$reqcreersilo = $bdg->prepare("INSERT INTO silo (idjoueursilo, iditems, quantite) VALUES (?, ?, ?)"); 
$reqaugmentersilo = $bdg->prepare("UPDATE silo SET quantite = ? WHERE idjoueursilo = ? AND iditems = ?"); 

// Gestion astéroides.
$reqmajaste = $bda->prepare('UPDATE champsasteroides SET quantite = ? where idasteroide = ?');
$reqsupaste = $bda->prepare('DELETE FROM champsasteroides WHERE idasteroide = ?');
$reqasteroide = $bda->prepare('SELECT idasteroide, quantite, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? ORDER BY RAND () LIMIT 1');

// Gestion bataille
$reqsupprimerbataille = $bdg->prepare('DELETE FROM bataille WHERE idflotteoffensive = ?');


// Requetes dans combat, parce qu'on l'utilise là bas.
$reqflotte = $bdg->prepare('    SELECT * FROM flotte f
                                LEFT JOIN planete p ON p.idplanete = f.idplaneteflotte
                                WHERE typeordre = ?');
$requpdateordre = $bdg->prepare('UPDATE flotte SET universdestination = ?, xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ?');


$reqflotte->execute(array(1)); // ordre de récolte des astéroides (= typeordre 1) 
while ($repflotte = $reqflotte->fetch()) 
    {
    $minageflotte = minageflotte($repflotte['idflotte']) ; 

    //requete vaisseau par vaisseau de sa cargaison.  
    $reqverifcargo->execute(array($repflotte['idflotte']));
    while ($repverifcargo = $reqverifcargo->fetch())
        {
        if ($minageflotte < 1)
            {break ; }
      
        $reqverifcargo2->execute(array($repverifcargo['idvaisseau'], '%')); 
        $repquantitetransportee = $reqverifcargo2->fetch();
        $quantiterestantedesoute = $repverifcargo['capacitedesoute'] - $repquantitetransportee['quantitetransportee'];
        for ( ; $quantiterestantedesoute>0 , $minageflotte>0 ; $minageflotte-- , $quantiterestantedesoute--) 
            {
            if ($quantiterestantedesoute<1)
                {break 1 ; }
            // Vérifier si un astéroide existe.
            $reqasteroide->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte'])); 
            $repasteroide = $reqasteroide->fetch();
            if (isset($repasteroide['idasteroide']))
                {
                $reqverifcargo2->execute(array($repverifcargo['idvaisseau'], $repasteroide['typeitemsaste'])); 
                $repverifcargo2 = $reqverifcargo2->fetch();
                if (isset($repverifcargo2['quantiteitems'])) // Si le cargo transporte déjà des débris alors augmenter.  
                    {
                    $reqaugmentercargo->execute(array($repverifcargo2['quantiteitems'] + 1 , $repverifcargo['idvaisseau'], $repasteroide['typeitemsaste']));
                    } 
                else 
                    { // Sinon créer un stock.
                    $reqcreercargo->execute(array($repverifcargo['idvaisseau'], $repasteroide['typeitemsaste'] , 1)); 
                    } 
                // Si les biens de l'asteroide tombent à 0, alors on delete.  
                if ($repasteroide['quantite'] < 2) 
                    { 
                    $reqsupaste->execute(array($repasteroide['idasteroide'])); 
                    } 
                else // Sinon on réduit de 1 sa valeur. 
                    { 
                    $reqmajaste->execute(array($repasteroide['quantite'] - 1 , $repasteroide['idasteroide'])); 
                    } 
                }
            else
                { // Si aucun astéroide présent, supprimer 
                $reqsupprimerordreprecedent->execute(array($repflotte['idflotte'])); 
                }
            } // Fin de la boucle gérant les astéroides multiples.
        } // Fin boucle gérant les vaisseaux multiples dans une flotte.
    // À la fin, on regarde la quantité transportée, et si le max est atteint, on supprime l'ordre.
    $souteflotte = souteflotte($repflotte['idflotte']) ;
    $quantitetransportee = cargaisonflotte($repflotte['idflotte']) ;
    if ($souteflotte <= $quantitetransportee)
        {
        $reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));
        } 
    } // Fin des ordres de minage.

// (2) = saut dimentionnel dirigié, convertit en (10).

$reqflotte->execute(array(3)); // Invasions. Ordre partiellement géré déjà dans les combats.
while ($repflotte = $reqflotte->fetch())
    {
    // Supprimer toutes les batailles en cours (elles seront recrées lors du prochain tour)
    $reqsupprimerbataille->execute(array($repflotte['idflotte']));
    $diminution = 1;

    if ($repflotte['universdestination'] > $diminution)
        {
        // Diminuer le compteur de 1 ou plus.
        $tempsrestant = $repflotte['universdestination'] - $diminution;
        $requpdateordre->execute(array($tempsrestant, $repflotte['xdestination'], 0, 3, 1, $repflotte['idflotte']));
        }
    else
        {
        // Si compteur est à 0, alors changer possesseur de la planète.
        $reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));
        $reqchangementproprioplanete->execute(array($repflotte['idjoueurplanete'], 0, $repflotte['xdestination']));

        $reqmessageinterne->execute(array('Force d\'invasion', $repflotte['idjoueurplanete'], 0, 'Planète envahie', 'Nos forces viennent de prendre le contrôle de la planète.'));

        }
    }

// (5) = Combat : Cet ordre ne fait rien ici, tout est géré avec les batailles.

$reqflotte->execute(array(6)); // 6 = ordre de déplacement normaux.
while ($repflotte = $reqflotte->fetch())
    {
    echo 'id de la flotte qui va bouger : '.$repflotte['idflotte'].' <br>';
    $vitesse = vitesseflotte($repflotte['idflotte']);
    $arriveadestination = true ; // par défaut, considérer l'ordre comme exécutable en entier;

    // Puis-je arriver à destination selon x ?
    if ($repflotte['xflotte']+$vitesse >= $repflotte['xdestination'] AND $repflotte['xflotte']-$vitesse <= $repflotte['xdestination'])
        {
        $xeffectif = $repflotte['xdestination'];
        } // Si oui, alors ordre = destination
    else
        {
        $arriveadestination = false ;
        if ($repflotte['xflotte']>$repflotte['xdestination'])
            {$xeffectif = $repflotte['xflotte'] - $vitesse;}
        else
            {$xeffectif = $repflotte['xflotte'] + $vitesse;}
        } // Sinon, ordre = place initiale + vitesse vers la destination.

    // Même chose ici mais avec les y.
    if ($repflotte['yflotte']+$vitesse >= $repflotte['ydestination'] AND $repflotte['yflotte']-$vitesse <= $repflotte['ydestination'])
        {
        $yeffectif = $repflotte['ydestination'];
        }
    else
        {
        $arriveadestination = false ;
        if ($repflotte['yflotte']>$repflotte['ydestination'])
            {
            $yeffectif = $repflotte['yflotte'] - $vitesse;
            }
        else
            {
            $yeffectif = $repflotte['yflotte'] + $vitesse;
            }
        } 
 
    // Applique le déplacement : 
    $applicationdeplacement->execute(array($xeffectif , $yeffectif , $repflotte['universdestination'], $repflotte['idflotte'])); 

    if (isset($repflotte['idjoueurplanete']))
        { // Permet de gérer le cas des flottes neutres.
        $mess = 'Cette flotte vient de se déplacer. Elle était avant en ' . $repflotte['xflotte'] . '-' . $repflotte['yflotte'] ;  
        $message ->execute(array($repflotte['idjoueurplanete'] , $mess , 'flotte' , $repflotte['idflotte'])) ; 
        
        // Exploration si case inconnue : 
        $reqexplorationexistante->execute(array($xeffectif , $yeffectif , $repflotte['universdestination'] , $repflotte['idjoueurplanete'])); 
        $repexplorationexistante = $reqexplorationexistante->fetch();  
        if (empty($repexplorationexistante['idexplore'])) 
            { 
            $exploration ->execute(array($xeffectif , $yeffectif , $repflotte['universdestination'], $repflotte['idjoueurplanete'], $touractuel['id'])) ; 

            //Créer message pour le joueur. 
            $messexplo = 'Cette flotte vient d\'explorer le parsec (' . $xeffectif  . ' - ' . $yeffectif .').'  ;  
            $message ->execute(array($repflotte['idjoueurplanete'] , $messexplo , 'flotte' , $repflotte['idflotte'])) ; 
            } 
        }

    if ($arriveadestination == true) 
        {  
        // Supprimer l'ordre de déplacement si la destination est atteinte 
        $reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));
        } 
    elseif (isset($repflotte['idjoueurplanete']))
        { 
        $messagepasassezrapide = 'Cette flotte n\'est pas arrivée à destination faute d\'avoir la vitesse suffisante.'  ;  
        $message ->execute(array($repflotte['idjoueurplanete'] , $messagepasassezrapide , 'flotte' , $repflotte['idflotte'])) ; 
        } 
    } 

$reqflotte->execute(array(8)); //  = Ordre spécial premier vaisseau trouvé. 
while ($repflotte = $reqflotte->fetch()) 
    {  // Permet au vaisseau de fuir à +1 / -1, cas prévu lorsqu'on est au bord de la map.
    if ($repflotte['xdestination'] == 5)
        {$xdestination = 4;}
    else {$xdestination = $repflotte['xdestination']+1;}

    if ($repflotte['ydestination'] == 1)
        {$ydestination = 2;}
    else {$ydestination = $repflotte['ydestination']-1;}

    $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repflotte['idjoueurplanete'], 0, 'Échec de la mission', 'Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer.'));

    $reqmettrePV1flotte->execute(array($xdestination, $ydestination, 0, 0, $repflotte['idflotte']));
    $reqmettrePV1vaisseau->execute(array(1, $repflotte['idflotte']));

    // Exploration si case inconnue : 
    $reqexplorationexistante->execute(array($xdestination, $ydestination, $repflotte['universdestination'], $repflotte['idjoueurplanete'])); 
    $repexplorationexistante = $reqexplorationexistante->fetch();  
    if (empty($repexplorationexistante['idexplore'])) 
        { 
        $exploration ->execute(array($xdestination, $ydestination, $repflotte['universdestination'], $repflotte['idjoueurplanete'], $touractuel['id'])) ; 
 
        //Créer message pour le joueur. 
        $messexplo = 'Cette flotte vient d\'explorer le parsec (' . $xeffectif  . ' - ' . $yeffectif .').'  ;  
        $message ->execute(array($repflotte['idjoueurplanete'] , $messexplo , 'flotte' , $repflotte['idflotte'])) ; 
        }
    } 

$reqflotte->execute(array(10)); // = Saut dimentionnel 
while ($repflotte = $reqflotte->fetch()) 
    { 
    if ($repflotte['bloque'] == 0) 
        { // Cas d'un ordre qui vient d'être donné. Le gérer pour en faire un 'vrai' ordre et le bloquer. 
        $universdestination = $repflotte['universdestination']; 
        $temps = variable(6); // Temps de voyage entre les univers
        $requpdateordre->execute(array($universdestination, $temps[0], 0, 10, 2, $repflotte['idflotte']));
        $applicationdeplacement->execute(array(0, 0, 0, $repflotte['idflotte']));
        }
    else 
        { // Dans ce cas, l'ordre est bloqué, donc la flotte est en voyage. 
        if ($repflotte['xdestination'] > 0) 
            { // Dans ce cas, la flotte est en train de voyager. 
            $universdestination = $repflotte['universdestination']; 
            $temps = $repflotte['xdestination']-1;
            $requpdateordre->execute(array($universdestination, $temps, 0, 10, 2, $repflotte['idflotte'])); 
            } 
        elseif ($repflotte['xdestination'] == 0) 
            { // Dans ce cas, la flotte est arrivée 
            if ($repflotte['universdestination'] > 0) 
              { // Dans ce cas, la flotte va vers l'univers d'origine du joueur. 
              $xeffectif = rand(1,5); 
              $yeffectif = rand(1,5); 
              } 
            else 
              { // Dans ce cas, la flotte va vers un autre univers : 
              $xeffectif = rand(1,20); 
              $yeffectif = rand(1,20); 
              } 
            $universdestination = $repflotte['universdestination']; 
                         
            //Créer message pour le joueur. 
            $mess = 'Cette flotte vient de s\'univorter.' ;  
            $message ->execute(array($repflotte['idjoueurplanete'] , $mess , 'flotte' , $repflotte['idflotte'])) ; 
                     
            // Applique le déplacement : 
            $applicationdeplacement->execute(array($xeffectif , $yeffectif , $universdestination, $repflotte['idflotte'])); 
            $reqsupprimerordreprecedent->execute(array($repflotte['idflotte'])); 
            // Exploration si case inconnue : 
            $reqexplorationexistante->execute(array($xeffectif , $yeffectif , $universdestination, $repflotte['idjoueurplanete'])); 
            $repexplorationexistante = $reqexplorationexistante->fetch();  
            if (empty($repexplorationexistante['idexplore'])) 
                { 
                $exploration ->execute(array($xeffectif , $yeffectif , $universdestination, $repflotte['idjoueurplanete'], $touractuel['id'])) ; 
                //Créer message pour le joueur. 
                $messexplo = 'Cette flotte vient d\'explorer le parsec (' . $xeffectif  . ' - ' . $yeffectif .').'  ;  
                $message ->execute(array($repflotte['idjoueurplanete'] , $messexplo , 'flotte' , $repflotte['idflotte'])) ; 
                } 
            } 
        } 
    } 
 
$reqflotte->execute(array(11)); // = colonisation 
while ($repflotte = $reqflotte->fetch()) 
    { //$repflotte['xdestination'] = id de la planete
    $reqplanete2->execute(array($repflotte['xdestination'])); 
    $repplanete = $reqplanete2->fetch(); 
    $peutcoloniser = colonisateur($repflotte['idflotte']) ;

    if ($repflotte['universflotte'] == $repplanete['universplanete'] AND $repflotte['xflotte'] == $repplanete['xplanete'] AND $repflotte['yflotte'] == $repplanete['yplanete'] AND $repplanete['idjoueurplanete'] == 0 AND $peutcoloniser == true) 
        { 
        $bonusbiens = variable(2);
        $reqchangementproprioplanete->execute(array($repflotte['idjoueurplanete'], $bonusbiens[0], $repflotte['xdestination'])); 
        $reqpop->execute(array($repflotte['xdestination'], 1)); 
         
        $messcolonisation = 'Cette flotte vient de coloniser une planete.'  ;  
        $message ->execute(array($repflotte['idjoueurplanete'] , $messcolonisation, 'flotte' , $repflotte['idflotte'])) ; 
         
        $reqmessageinterne->execute(array('Conseil civil', $repflotte['idjoueurplanete'], 0, 'planète colonisée', 'Nous venons de coloniser une nouvelle planète. Le vaisseau colonisateur a été perdu dans le processus'));

        disparitionvaisseau($peutcoloniser[1]); 
        } 
    $reqsupprimerordreprecedent->execute(array($repflotte['idflotte'])); 
    } 
?>