<?php 
/* 
session_start(); 
include("../include/BDDconnection.php"); 
include("../function/consommercreeritemsplanetemultiple.php"); 
*/ 
 
// récupérer le num du tour ($touractuel['id']) 
$reqtouractuel = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1'); 
$touractuel = $reqtouractuel->fetch(); 
 
// Gestion vaisseau 
$applicationdeplacement = $bdg->prepare("UPDATE vaisseau SET x = ? , y = ?, univers = ? where idvaisseau = ? "); 
$reqmettrepva1 = $bdg->prepare("UPDATE vaisseau SET x = ? , y = ?, HPvaisseau = ? where idvaisseau = ? "); 
 
// Divers 
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess , numspemessage) VALUES (?, ?, ?, ?)") ; 
$reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?'); 
$requpdateordre = $bdg->prepare('UPDATE ordredeplacement SET xdestination = ?, ydestination = ?, universdestination = ?, bloque = ? WHERE idvaisseaudeplacement = ?'); 
$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 
 
//planete 
$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? AND idjoueurplanete = ?'); 
$reqplanete2 = $bdg->prepare('SELECT xplanete, yplanete, universplanete FROM planete WHERE idplanete = ?'); 
$reqchangementproprioplanete = $bdg->prepare('UPDATE planete SET idjoueurplanete = ? WHERE idplanete = ?'); 
$reqpop = $bdg->prepare('INSERT INTO population(idplanetepop, typepop) VALUES(?, ?)'); 
 
// Gestion exploration 
$reqexplorationexistante = $bdg->prepare("SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? "); 
$exploration = $bdg->prepare("INSERT INTO explore (x , y, univers , idexplorateur, tourexploration) VALUES (?, ?, ?, ?, ?)") ; 
 
// Gestion cargo 
$reqcreercargo = $bdg->prepare("INSERT INTO cargovaisseau (idvaisseaucargo, typeitems, quantiteitems) VALUES (?, ?, ?)") ; 
$reqverifcargo = $bdd->prepare("SELECT cargovaisseau.typeitems, cargovaisseau.quantiteitems, items.nombatiment FROM gamer.cargovaisseau INNER JOIN items ON items.iditem = cargovaisseau.typeitems WHERE cargovaisseau.idvaisseaucargo = ? AND cargovaisseau.typeitems like ?") ; 
$reqaugmentercargo = $bdg->prepare("UPDATE cargovaisseau SET quantiteitems = ? WHERE idvaisseaucargo = ? AND typeitems = ?") ; 
$reqsupcargaisonvaisseau = $bdg->prepare('DELETE FROM cargovaisseau WHERE idvaisseaucargo = ?'); 
 
// Gestion Silo 
$reqverifsilo = $bdg->prepare("SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?") ; 
$reqcreersilo = $bdg->prepare("INSERT INTO silo (idjoueursilo, iditems, quantite) VALUES (?, ?, ?)") ; 
$reqaugmentersilo = $bdg->prepare("UPDATE silo SET quantite = ? WHERE idjoueursilo = ? AND iditems = ?") ; 
 
// Gestion astéroides. 
$reqmajaste = $bda->prepare('UPDATE champsasteroides SET quantite = ? where idasteroide = ?'); 
$reqsupaste = $bda->prepare('DELETE FROM  champsasteroides WHERE idasteroide = ?'); 
$reqasteroide = $bda->prepare('SELECT idasteroide, quantite, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? ORDER BY RAND () LIMIT 1'); 
 
// récupération des ordres de déplacement. 
$reqvaisseau = $bdg->prepare('SELECT * FROM ordredeplacement o INNER JOIN vaisseau v ON v.idvaisseau = o.idvaisseaudeplacement WHERE o.typeordre = ?'); 
$reqvaisseau->execute(array(0)); // 0 = ordre de déplacement normaux. 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    $arriveadestination = true ; // par défaut, considérer l'ordre comme exécutable en entier; 
 
    // Puis-je arriver à destination selon x ? 
    if ($repvaisseau['x']+$repvaisseau['vitesse'] >= $repvaisseau['xdestination'] AND $repvaisseau['x']-$repvaisseau['vitesse'] <= $repvaisseau['xdestination']) 
        { 
        $xeffectif = $repvaisseau['xdestination']; 
        } // Si oui, alors ordre = destination 
    else 
        { 
        $arriveadestination = false ; 
        if ($repvaisseau['x']>$repvaisseau['xdestination']) 
            {$xeffectif = $repvaisseau['x'] - $repvaisseau['vitesse'];} 
        else 
            {$xeffectif = $repvaisseau['x'] + $repvaisseau['vitesse'];}  
        } // Sinon, ordre = place initiale + vitesse vers la destination. 
 
    // Même chose ici mais avec les y.  
    if ($repvaisseau['y']+$repvaisseau['vitesse'] >= $repvaisseau['ydestination'] AND $repvaisseau['y']-$repvaisseau['vitesse'] <= $repvaisseau['ydestination']) 
        { 
        $yeffectif = $repvaisseau['ydestination']; 
        } 
    else 
        { 
        $arriveadestination = false ; 
        if ($repvaisseau['y']>$repvaisseau['ydestination']) 
            { 
            $yeffectif = $repvaisseau['y'] - $repvaisseau['vitesse']; 
            } 
        else 
            { 
            $yeffectif = $repvaisseau['y'] + $repvaisseau['vitesse']; 
            } 
        } 
 
    //Créer message pour le joueur. 
    $mess = 'Ce vaisseau vient de se déplacer. Il était avant en ' . $repvaisseau['x'] . '-' . $repvaisseau['y'] ;  
    $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
     
    // Applique le déplacement : 
    $applicationdeplacement->execute(array($xeffectif , $yeffectif , $repvaisseau['universdestination'], $repvaisseau['idvaisseaudeplacement'])); 
 
    // Exploration si case inconnue : 
    $reqexplorationexistante->execute(array($xeffectif , $yeffectif , $repvaisseau['universdestination'] , $repvaisseau['idjoueurduvaisseau'])); 
    $repexplorationexistante = $reqexplorationexistante->fetch();  
    if (empty($repexplorationexistante['idexplore'])) 
        { 
        $exploration ->execute(array($xeffectif , $yeffectif , $repvaisseau['universdestination'], $repvaisseau['idjoueurduvaisseau'], $touractuel['id'])) ; 
 
        //Créer message pour le joueur. 
        $messexplo = 'Ce vaisseau vient d\'explorer le parsec (' . $xeffectif  . ' - ' . $yeffectif .').'  ;  
        $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $messexplo , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
        } 
     
    if ($arriveadestination == true) 
        {  
        // Supprimer l'ordre de déplacement si la destination est atteinte 
        $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
        } 
    else 
        { 
        $messagepasassezrapide = 'Ce vaisseau n\'est pas arrivé à destination faute d\'avoir la vitesse suffisante.'  ;  
        $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $messagepasassezrapide , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
        } 
    } 
 
$reqvaisseau->execute(array(1)); // ordre de récolte des astéroides (= typeordre 1) 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    $quantitetransportee = 0; // Permet de définir combien on transporte actuellement. 
    $reqverifcargo->execute(array($repvaisseau['idvaisseaudeplacement'], '%')); 
    while ($repverifcargo = $reqverifcargo->fetch()) 
        { 
        $quantitetransportee = $quantitetransportee + $repverifcargo['quantiteitems']; 
        } 
     
    $quantiterestantedesoute = $repvaisseau['capacitedesoute'] - $quantitetransportee; 
    $capaciteminage = $repvaisseau['capaciteminage']; 
     
    for ( ; $quantiterestantedesoute>0 , $capaciteminage>0 ; $capaciteminage-- , $quantiterestantedesoute--) 
        { 
        if ($quantiterestantedesoute <= 0) 
            { // si on n'a plus de soute, alors on supprime l'ordre et on passe au vaisseau suivant. 
            $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
            break ; 
            } 
             
        $reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers'])); 
        $repasteroide = $reqasteroide->fetch(); 
        // Vérifier si un astéroide existe. 
        if (isset($repasteroide['idasteroide'])) 
            { 
            $reqverifcargo->execute(array($repvaisseau['idvaisseaudeplacement'], $repasteroide['typeitemsaste'])); 
            $repverifcargo = $reqverifcargo->fetch(); 
            if (isset($repverifcargo['quantiteitems'])) // Si le cargo transporte déjà des débris alors augmenter.  
                { 
                $reqaugmentercargo->execute(array($repverifcargo['quantiteitems'] + 1 , $repvaisseau['idvaisseaudeplacement'], $repasteroide['typeitemsaste'])); 
                } 
            else 
                { // Sinon créer un stock.  
                $reqcreercargo->execute(array($repvaisseau['idvaisseaudeplacement'], $repasteroide['typeitemsaste'] , 1)); 
                } 
             
            // Si les biens de l'asteroide tombent à 0, alors on delete.  
            if ($repasteroide['quantite'] < 2) 
                { 
                $reqsupaste->execute(array($repasteroide['idasteroide'])); 
                $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
                } 
            else // Sinon on réduit de 1 sa valeur. 
                { 
                $reqmajaste->execute(array($repasteroide['quantite'] - 1 , $repasteroide['idasteroide'])); 
                } 
            if ($quantiterestantedesoute <= 1) 
                { // Permet de supprimer l'ordre si la soute tombe à 0.  
                $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
                } 
            } 
        else 
            { // si l'astéroide n'existe pas ou plus, alors on supprime l'ordre. 
            $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
            } 
        } // Fin boucle while pour le cas avec de multiples minages. 
    } // Fin des ordres de minage. 
 
$reqvaisseau->execute(array(2)); // ordre de déchargement (= typeordre 2) 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    // Trouver si une planète du joueur est à proximité : 
    $reqplanete->execute(array($repvaisseau['x'], $repvaisseau['y'], $repvaisseau['univers'], $repvaisseau['idjoueurvaisseau'])); 
    $repplanete = $reqplanete->fetch(); 
 
    if (isset($repplanete['idplanete'])) 
        { 
        // récupérer les infos du cargo 
        $reqverifcargo->execute(array($repvaisseau['idvaisseaudeplacement'], '%')); 
        while ($repverifcargo = $reqverifcargo->fetch()) 
            { 
            consommercreeritemsplanetemultiple(0, $repverifcargo['typeitems'], $repplanete['idplanete'], $repverifcargo['quantiteitems']); 
 
            $mess = 'Un vaisseau vient de livrer ' . $repverifcargo['quantiteitems'] . ' ' . $repverifcargo['nombatiment']; 
            $message->execute(array($repvaisseau['idjoueurvaisseau'], $mess, 'planete', $repplanete['idplanete'])); 
            
            $mess2 = 'Ce vaisseau vient de livre ' . $repverifcargo['quantiteitems'] . ' ' . $repverifcargo['nombatiment'] ; 
            $message->execute(array($repvaisseau['idjoueurvaisseau'], $mess2, 'vaisseau', $repvaisseau['idvaisseau'])); 
            } 
        // Supprimer toute la cargaison 
        $reqsupcargaisonvaisseau->execute(array($repvaisseau['idvaisseaudeplacement'])); 
        } 
    $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
    } 
 
$reqvaisseau->execute(array(3)); // ordre de rentrée vers la planète (= typeordre 3)  
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    // Trouver si une planète du joueur est à proximité : 
    $reqplanete->execute(array($repvaisseau['x'], $repvaisseau['y'], $repvaisseau['univers'], $repvaisseau['idjoueurvaisseau'])); 
    $repplanete = $reqplanete->fetch(); 
 
    if (isset($repplanete['idplanete'])) 
        { // Vérifier les coordonnées et appliquer l'ordre. 
        $applicationdeplacement->execute(array($repplanete['idplanete'], 0 , 0, $repvaisseau['idvaisseaudeplacement'])); 
        }  
    $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement']));  
    } 
 
$reqvaisseau->execute(array(4)); // ordre de sortie vers la carte (= typeordre 4) 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    // x du vaisseau = id planete. Je vais sortir le vaisseau aux coordonnées de la planète après. 
    $reqplanete2->execute(array($repvaisseau['x'])); 
    $repplanete = $reqplanete2->fetch(); 
 
    if (isset($repplanete['xplanete'])) 
        { 
        //Créer message pour le joueur. 
        $mess = 'Ce vient de sortir du hangars et se trouve maintenant en orbite de notre monde.';  
        $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])); 
        // Et appliquer l'ordre. 
        $applicationdeplacement->execute(array($repplanete['xplanete'] , $repplanete['yplanete'], $repplanete['universplanete'], $repvaisseau['idvaisseaudeplacement'])); 
 
        // Exploration si case inconnue : 
        $reqexplorationexistante->execute(array($repplanete['xplanete'] , $repplanete['yplanete'], $repplanete['universplanete'], $repvaisseau['idjoueurduvaisseau'])); 
        $repexplorationexistante = $reqexplorationexistante->fetch();  
        if (empty($repexplorationexistante['idexplore'])) 
            { 
            $exploration ->execute(array($repplanete['xplanete'] , $repplanete['yplanete'], $repplanete['universplanete'], $repvaisseau['idjoueurduvaisseau'], $touractuel['id'])) ; 
 
            //Créer message pour le joueur. 
            $messexplo = 'Première sortie du système. Notre vaisseau explore les environs immédiats.'  ;  
            $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $messexplo , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
            } 
        } 
    $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement']));  
    } 
 
// $reqvaisseau->execute(array(5)); = attaquer (page bataille) 
// $reqvaisseau->execute(array(6)); = conception de vaisseau (page construction) 
// $reqvaisseau->execute(array(7)); = Réparation de vaisseau (page construction) 
 
$reqvaisseau->execute(array(8)); //  = Ordre spécial premier vaisseau trouvé. 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    if ($repvaisseau['xdestination'] == 5) 
        {$xdestination = 4;} 
    else {$xdestination = $repvaisseau['xdestination']+1;} 
 
    if ($repvaisseau['ydestination'] == 1) 
        {$ydestination = 2;} 
    else {$ydestination = $repvaisseau['ydestination']-1;} 
 
    $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repvaisseau['idjoueurduvaisseau'], 0, 'Échec de la mission', 'Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer.')); 
 
    $reqmettrepva1->execute(array($xdestination, $ydestination, 1, $repvaisseau['idvaisseaudeplacement'])); 
 
    $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement']));  
    } 
 
// $reqvaisseau->execute(array(9)); = design avec un ordre totalement bloqué. 
 
$reqvaisseau->execute(array(10)); // = Saut dimentionnel 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { 
    if ($repvaisseau['bloque'] == 0) 
        { // Cas d'un ordre qui vient d'être donné. Le gérer pour en faire un 'vrai' ordre et le bloquer. 
        if ($repvaisseau['universdestination']>0) 
            { // Dans ce cas, le vaisseau va vers l'univers d'origine du joueur. 
            $universdestination = $repvaisseau['idjoueurduvaisseau']; 
            } 
        else 
          { // Dans ce cas, le vaisseau va vers un autre univers : 
            $universdestination = $repvaisseau['universdestination']; 
            } 
        $temps = 2; 
        $requpdateordre->execute(array($temps, 0, $universdestination, 2, $repvaisseau['idvaisseaudeplacement'])); 
        $applicationdeplacement->execute(array(0, 0, 0, $repvaisseau['idvaisseaudeplacement'])); 
        } 
    else 
        { // Dans ce cas, l'ordre est bloqué, donc le vaisseau est en voyage. 
        if ($repvaisseau['xdestination'] > 0) 
            { // Dans ce cas, le vaisseau est en train de voyager. 
            $universdestination = $repvaisseau['universdestination']; 
            $temps = $repvaisseau['xdestination']-1; 
            $requpdateordre->execute(array($temps, 0, $universdestination, 2, $repvaisseau['idvaisseaudeplacement'])); 
            } 
        elseif ($repvaisseau['xdestination'] == 0) 
            { // Dans ce cas, le vaisseau est arrivé 
            if ($repvaisseau['universdestination'] > 0) 
              { // Dans ce cas, le vaisseau va vers l'univers d'origine du joueur. 
              $xeffectif = rand(1,5); 
              $yeffectif = rand(1,5); 
              } 
            else 
              { // Dans ce cas, le vaisseau va vers un autre univers : 
              $xeffectif = rand(1,20); 
              $yeffectif = rand(1,20); 
              } 
            $universdestination = $repvaisseau['universdestination']; 
                         
            //Créer message pour le joueur. 
            $mess = 'Ce vaisseau vient de se univorter.' ;  
            $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
                     
            // Applique le déplacement : 
            $applicationdeplacement->execute(array($xeffectif , $yeffectif , $universdestination, $repvaisseau['idvaisseaudeplacement'])); 
            $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
            // Exploration si case inconnue : 
            $reqexplorationexistante->execute(array($xeffectif , $yeffectif , $universdestination, $repvaisseau['idjoueurduvaisseau'])); 
            $repexplorationexistante = $reqexplorationexistante->fetch();  
            if (empty($repexplorationexistante['idexplore'])) 
                { 
                $exploration ->execute(array($xeffectif , $yeffectif , $universdestination, $repvaisseau['idjoueurduvaisseau'], $touractuel['id'])) ; 
                //Créer message pour le joueur. 
                $messexplo = 'Ce vaisseau vient d\'explorer le parsec (' . $xeffectif  . ' - ' . $yeffectif .').'  ;  
                $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $messexplo , 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
                } 
            } 
        } 
    } 
 
$reqvaisseau->execute(array(11)); // = colonisation 
while ($repvaisseau = $reqvaisseau->fetch()) 
    { //$repvaisseau['xdestination'] = id de la planete 
    $reqplanete2->execute(array($repvaisseau['xdestination'])); 
    $repplanete = $reqplanete2->fetch(); 
 
    if ($repvaisseau['univers'] == $repplanete['universplanete'] AND $repvaisseau['x'] == $repplanete['xplanete'] AND $repvaisseau['y'] == $repplanete['yplanete'] AND $repplanete['idjoueurplanete'] == 0) 
        { 
        $reqchangementproprioplanete->execute(array($repvaisseau['idjoueurvaisseau'], $repvaisseau['xdestination'])); 
        $reqpop->execute(array($repvaisseau['xdestination'], 1)); 
         
        $messcolonisation = 'Ce vaisseau vient de coloniser une planete.'  ;  
        $message ->execute(array($repvaisseau['idjoueurduvaisseau'] , $messcolonisation, 'Vaisseau' , $repvaisseau['idvaisseaudeplacement'])) ; 
         
        $reqmessageinterne->execute(array('Conseil civil', $repvaisseau['idjoueurvaisseau'], 0, 'planete colonisee', 'Nous venons de coloniser une nouvelle planete.')); 
         
        } 
    $reqsupprimerordreprecedent->execute(array($repvaisseau['idvaisseaudeplacement'])); 
    } 
?>