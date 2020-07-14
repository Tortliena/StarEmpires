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
$reqmettrepva1 = $bdg->prepare("UPDATE vaisseau SET x = ? , y = ?, HPvaisseau = ? WHERE idflotte = ? "); 


// Divers 
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess , numspemessage) VALUES (?, ?, ?, ?)"); 
$reqsupprimerordreprecedent = $bdg->prepare('UPDATE flotte SET universdestination = 0, xdestination = 0, ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');
$requpdateordre = $bdg->prepare('UPDATE flotte SET universdestination = ?, xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ?');
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
$reqsupcargaisonvaisseau = $bdg->prepare('DELETE FROM cargovaisseau WHERE idvaisseaucargo = ?'); 
 
// Gestion Silo 
$reqverifsilo = $bdg->prepare("SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?"); 
$reqcreersilo = $bdg->prepare("INSERT INTO silo (idjoueursilo, iditems, quantite) VALUES (?, ?, ?)"); 
$reqaugmentersilo = $bdg->prepare("UPDATE silo SET quantite = ? WHERE idjoueursilo = ? AND iditems = ?"); 

// Gestion astéroides.
$reqmajaste = $bda->prepare('UPDATE champsasteroides SET quantite = ? where idasteroide = ?');
$reqsupaste = $bda->prepare('DELETE FROM  champsasteroides WHERE idasteroide = ?');
$reqasteroide = $bda->prepare('SELECT idasteroide, quantite, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? ORDER BY RAND () LIMIT 1');

// récupération des ordres de déplacement.
$reqflotte = $bdg->prepare('    SELECT * FROM flotte f
                                INNER JOIN planete p ON p.idplanete = f.idplaneteflotte
                                WHERE typeordre = ?');

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
    } // Fin des ordres de minage. 
$reqflotte->execute(array(1)); // ordre de récolte des astéroides (= typeordre 1) et vérification s'il y a besoin de supprimer l'ordre ou non. 
while ($repflotte = $reqflotte->fetch()) 
    {
    $souteflotte = souteflotte($repflotte['idflotte']) ;
    $quantitetransportee = cargaisonflotte($repflotte['idflotte']) ;
    if ($souteflotte <= $quantitetransportee)
    	{
    	$reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));
    	} 
    }

// $reqvaisseau->execute(array(5)); = attaquer (page bataille) 

$reqflotte->execute(array(6)); // 6 = ordre de déplacement normaux. 
while ($repflotte = $reqflotte->fetch()) 
    {
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

    //Créer message pour le joueur. 
    $mess = 'Cette flotte vient de se déplacer. Elle était avant en ' . $repflotte['xflotte'] . '-' . $repflotte['yflotte'] ;  
    $message ->execute(array($repflotte['idjoueurplanete'] , $mess , 'flotte' , $repflotte['idflotte'])) ; 
     
    // Applique le déplacement : 
    $applicationdeplacement->execute(array($xeffectif , $yeffectif , $repflotte['universdestination'], $repflotte['idflotte'])); 
 
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
     
    if ($arriveadestination == true) 
        {  
        // Supprimer l'ordre de déplacement si la destination est atteinte 
        $reqsupprimerordreprecedent->execute(array($repflotte['idflotte'])); 
        } 
    else 
        { 
        $messagepasassezrapide = 'Cette flotte n\'est pas arrivée à destination faute d\'avoir la vitesse suffisante.'  ;  
        $message ->execute(array($repflotte['idjoueurplanete'] , $messagepasassezrapide , 'flotte' , $repflotte['idflotte'])) ; 
        } 
    } 

// $reqvaisseau->execute(array(7)); = Réparation de vaisseau (page construction) 
 
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
 
    $reqmettrepva1->execute(array($xdestination, $ydestination, 1, $repvaisseau['idvaisseaudeplacement'])); 
 
    $reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));  
    } 
 
// $reqvaisseau->execute(array(9)); = design avec un ordre totalement bloqué. 
 
$reqflotte->execute(array(10)); // = Saut dimentionnel 
while ($repflotte = $reqflotte->fetch()) 
    { 
    if ($repflotte['bloque'] == 0) 
        { // Cas d'un ordre qui vient d'être donné. Le gérer pour en faire un 'vrai' ordre et le bloquer. 
        if ($repflotte['universdestination']>0) 
            { // Dans ce cas, la flotte va vers l'univers d'origine du joueur. 
            $universdestination = $repflotte['idjoueurduvaisseau']; 
            } 
        else 
          { // Dans ce cas, la flotte va vers un autre univers : 
            $universdestination = $repflotte['universdestination']; 
            } 
        $temps = 2; 
        $requpdateordre->execute(array($temps, 0, $universdestination, 2, $repflotte['idflotte'])); 
        $applicationdeplacement->execute(array(0, 0, 0, $repflotte['idflotte'])); 
        } 
    else 
        { // Dans ce cas, l'ordre est bloqué, donc la flotte est en voyage. 
        if ($repflotte['xdestination'] > 0) 
            { // Dans ce cas, la flotte est en train de voyager. 
            $universdestination = $repflotte['universdestination']; 
            $temps = $repflotte['xdestination']-1; 
            $requpdateordre->execute(array($temps, 0, $universdestination, 2, $repflotte['idflotte'])); 
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