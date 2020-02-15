<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

// récupérer le num du tour ($touractuel['id'])
$reqtouractuel = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1');
$touractuel = $reqtouractuel->fetch();

// Gestion vaisseau
$reqvaisseau = $bdg->prepare('SELECT idjoueurbat, nomvaisseau, x, y, univers, vitesse, capacitedesoute, capaciteminage FROM vaisseau WHERE idvaisseau = ?');
$applicationdeplacement = $bdg->prepare("UPDATE vaisseau SET x = ? , y = ?, univers = ? where idvaisseau = ? ");
$reqmettrepva1 = $bdg->prepare("UPDATE vaisseau SET x = ? , y = ?, HPvaisseau = ? where idvaisseau = ? ");

// Divers
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess , numspemessage) VALUES (?, ?, ?, ?)") ;
$reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');

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
$reqordredep = $bdg->prepare('SELECT idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau FROM ordredeplacement WHERE typeordre = ?');

$reqordredep->execute(array(0)); // 0 = ordre de déplacement normaux.
while ($repordredep = $reqordredep->fetch())
    {
    $arriveadestination = true ; // par défaut, considérer l'ordre comme exécutable en entier;

    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();

    // Puis-je arriver à destination selon x ?
    if ($repvaisseau['x']+$repvaisseau['vitesse'] >= $repordredep['xdestination'] AND $repvaisseau['x']-$repvaisseau['vitesse'] <= $repordredep['xdestination'])
        {
        $xeffectif = $repordredep['xdestination'];
        } // Si oui, alors ordre = destination
    else
        {
        $arriveadestination = false ;
        if ($repvaisseau['x']>$repordredep['xdestination'])
            {$xeffectif = $repvaisseau['x'] - $repvaisseau['vitesse'];}
        else
            {$xeffectif = $repvaisseau['x'] + $repvaisseau['vitesse'];} 
        } // Sinon, ordre = place initiale + vitesse vers la destination.

    // Même chose ici mais avec les y. 
    if ($repvaisseau['y']+$repvaisseau['vitesse'] >= $repordredep['ydestination'] AND $repvaisseau['y']-$repvaisseau['vitesse'] <= $repordredep['ydestination'])
        {
        $yeffectif = $repordredep['ydestination'];
        }
    else
        {
        $arriveadestination = false ;
        if ($repvaisseau['y']>$repordredep['ydestination'])
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
    $message ->execute(array($repordredep['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repordredep['idvaisseaudeplacement'])) ;
    
    // Applique le déplacement :
    $applicationdeplacement->execute(array($xeffectif , $yeffectif , $repordredep['universdestination'], $repordredep['idvaisseaudeplacement']));

    // Exploration si case inconnue :
    $reqexplorationexistante->execute(array($xeffectif , $yeffectif , $repordredep['universdestination'] , $repordredep['idjoueurduvaisseau']));
    $repexplorationexistante = $reqexplorationexistante->fetch(); 
    if (empty($repexplorationexistante['idexplore']))
        {
        $exploration ->execute(array($xeffectif , $yeffectif , $repordredep['universdestination'], $repordredep['idjoueurduvaisseau'], $touractuel['id'])) ;

        //Créer message pour le joueur.
        $messexplo = 'Ce vaisseau vient d\'explorer le parsec (' . $xeffectif  . ' - ' . $yeffectif .').'  ; 
        $message ->execute(array($repordredep['idjoueurduvaisseau'] , $messexplo , 'Vaisseau' , $repordredep['idvaisseaudeplacement'])) ;
        }
    
    if ($arriveadestination == true)
        { 
        // Supprimer l'ordre de déplacement si la destination est atteinte
        $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
        }
    else
        {
        $messagepasassezrapide = 'Ce vaisseau n\'est pas arrivé à destination faute d\'avoir la vitesse suffisante.'  ; 
        $message ->execute(array($repordredep['idjoueurduvaisseau'] , $messagepasassezrapide , 'Vaisseau' , $repordredep['idvaisseaudeplacement'])) ;
        }
    }
$reqordredep->closeCursor();

$reqordredep->execute(array(1)); // ordre de récolte des astéroides (= typeordre 1)
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();
    // emplacement du vaisseau : $repvaisseau['x'] $repvaisseau['y'] $repvaisseau['univers'] 

    $quantitetransportee = 0; // Permet de définir combien on transporte actuellement.
    $reqverifcargo->execute(array($repordredep['idvaisseaudeplacement'], '%'));
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
            $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
            break ;
            }
            
        $reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
        $repasteroide = $reqasteroide->fetch();
        // Vérifier si un astéroide existe.
        if (isset($repasteroide['idasteroide']))
            {
            $reqverifcargo->execute(array($repordredep['idvaisseaudeplacement'], $repasteroide['typeitemsaste']));
            $repverifcargo = $reqverifcargo->fetch();
            if (isset($repverifcargo['quantiteitems'])) // Si le cargo transporte déjà des débris alors augmenter. 
                {
                $reqaugmentercargo->execute(array($repverifcargo['quantiteitems'] + 1 , $repordredep['idvaisseaudeplacement'], $repasteroide['typeitemsaste']));
                }
            else
                { // Sinon créer un stock. 
                $reqcreercargo->execute(array($repordredep['idvaisseaudeplacement'], $repasteroide['typeitemsaste'] , 1));
                }
            
            // Si les biens de l'asteroide tombent à 0, alors on delete. 
            if ($repasteroide['quantite'] < 2)
                {
                $reqsupaste->execute(array($repasteroide['idasteroide']));
                $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
                }
            else // Sinon on réduit de 1 sa valeur.
                {
                $reqmajaste->execute(array($repasteroide['quantite'] - 1 , $repasteroide['idasteroide']));
                }
            if ($quantiterestantedesoute <= 1)
                { // Permet de supprimer l'ordre si la soute tombe à 0. 
                $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
                }
            }
        else
            { // si l'astéroide n'existe pas ou plus, alors on supprime l'ordre.
            $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
            }
        } // Fin boucle while pour le cas avec de multiples minages.
    } // Fin des ordres de minage.
$reqordredep->closeCursor();

$reqordredep->execute(array(2)); // ordre de déchargement (= typeordre 2)
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();
    // emplacement du vaisseau : $repvaisseau['x'] $repvaisseau['y'] $repvaisseau['univers'] 

    // Vérifier le vaisseau se trouve sur la planète mère ou au hangars:
    if ($repvaisseau['univers'] == $repvaisseau['idjoueurbat']
      AND
        (($repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3) // Proche de la planète
        OR
        ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0))) // Au hangars
        {
        // récupérer les infos du cargo
        $reqverifcargo->execute(array($repordredep['idvaisseaudeplacement'], '%'));
        while ($repverifcargo = $reqverifcargo->fetch())
            {
            // Vérifier si l'item est déjà stocké sur la planète :
            $reqverifsilo->execute(array($repvaisseau['idjoueurbat'], $repverifcargo['typeitems']));
            $repverifsilo = $reqverifsilo->fetch();
            if (isset($repverifsilo['quantite'])) // Si on a déjà un objet stocké, augmenter la quantité sur la planète
                {
                $reqaugmentersilo->execute(array($repverifsilo['quantite'] + $repverifcargo['quantiteitems'], $repvaisseau['idjoueurbat'], $repverifcargo['typeitems']));
                }
            else  // Sinon créer le stock.
                {
                $reqcreersilo->execute(array($repvaisseau['idjoueurbat'], $repverifcargo['typeitems'], $repverifcargo['quantiteitems']));
                }
            $mess = 'Un vaisseau vient de livrer ' . $repverifcargo['quantiteitems'] . ' ' . $repverifcargo['nombatiment'] ;
            $message ->execute(array($repordredep['idjoueurduvaisseau'] , $mess , 'silo' , 0));
            }
        // Supprimer toute la cargaison
        $reqsupcargaisonvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
        }
    $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
    }
$reqordredep->closeCursor();

$reqordredep->execute(array(3)); // ordre de rentrée vers la planète (= typeordre 3) 
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['univers'] == $repordredep['idjoueurduvaisseau'] AND $repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3)
        { // Vérifier les coordonnées et appliquer l'ordre.
        $applicationdeplacement->execute(array(0 , 0 , $repordredep['idjoueurduvaisseau'], $repordredep['idvaisseaudeplacement']));
        } 
    $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement'])); 
    }
$reqordredep->closeCursor();

$reqordredep->execute(array(4)); // ordre de sortie vers la carte (= typeordre 4)
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();

    // Si le vaisseau se trouve au hangars :
    if ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0 AND $repvaisseau['univers'] == $repordredep['idjoueurduvaisseau'])
        {
        //Créer message pour le joueur.
        $mess = 'Ce vient de sortir du hangars et se trouve maintenant en orbite de notre monde.'; 
        $message ->execute(array($repordredep['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repordredep['idvaisseaudeplacement']));
        // Et appliquer l'ordre.
        $applicationdeplacement->execute(array(3 , 3, $repordredep['idjoueurduvaisseau'], $repordredep['idvaisseaudeplacement']));         
        }
    $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement'])); 
    }
$reqordredep->closeCursor();

// $reqordredep->execute(array(5)); = attaquer (page bataille)
// $reqordredep->execute(array(6)); = conception de vaisseau (page construction)
// $reqordredep->execute(array(7)); = Réparation de vaisseau (page construction)

$reqordredep->execute(array(8)); //  = Ordre spécial premier vaisseau trouvé.
while ($repordredep = $reqordredep->fetch())
    {
    if ($repordredep['xdestination'] == 5)
        {$xdestination = 4;}
    else {$xdestination = $repordredep['xdestination']+1;}

    if ($repordredep['ydestination'] == 1)
        {$ydestination = 2;}
    else {$ydestination = $repordredep['ydestination']-1;}

    $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repordredep['idjoueurduvaisseau'], 0, 'Échec de la mission', 'Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer.'));

    $reqmettrepva1->execute(array($xdestination, $ydestination, 1, $repordredep['idvaisseaudeplacement']));

    $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement'])); 
    }
$reqordredep->closeCursor();

// $reqordredep->execute(array(9)); = design avec un ordre totalement bloqué.

?>