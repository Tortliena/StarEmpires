<?php

session_start();
include("../script/BDDconnection.php");


// récupérer le num du tour ($touractuel['id'])
$reqtouractuel = $bdd->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1');
$touractuel = $reqtouractuel->fetch();

// Gestion vaisseau
$reqvaisseau = $bdd->prepare('SELECT idjoueurbat, nomvaisseau, x, y, univers FROM vaisseau WHERE idvaisseau = ?');
$applicationdeplacement = $bdd->prepare("UPDATE vaisseau SET x = ? , y = ?, univers = ? where idvaisseau = ? ");

// Divers
$message = $bdd->prepare("INSERT INTO messagetour (idjoumess , message , domainemess , numspemessage) VALUES (? , ?, ? , ?)") ;
$reqsupprimerordreprecedent = $bdd->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');

// Gestion exploration
$reqexplorationexistante = $bdd->prepare("SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? ");
$exploration = $bdd->prepare("INSERT INTO explore (x , y, univers , idexplorateur, tourexploration) VALUES (?, ?, ?, ?, ?)") ;

// Gestion cargo
$reqcreercargo = $bdd->prepare("INSERT INTO cargovaisseau (idvaisseaucargo, typeitems, quantiteitems) VALUES (?, ?, ?)") ;
$reqverifcargo = $bdd->prepare("SELECT cargovaisseau.typeitems, cargovaisseau.quantiteitems, items.nombatiment FROM cargovaisseau INNER JOIN items ON items.iditem = cargovaisseau.typeitems WHERE cargovaisseau.idvaisseaucargo = ? AND cargovaisseau.typeitems like ?") ;
$reqaugmentercargo = $bdd->prepare("UPDATE cargovaisseau SET quantiteitems = ? WHERE idvaisseaucargo = ? AND typeitems = ?") ;
$reqsupcargaisonvaisseau = $bdd->prepare('DELETE FROM  cargovaisseau WHERE idvaisseaucargo = ?');

// Gestion Silo
$reqverifsilo = $bdd->prepare("SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?") ;
$reqcreersilo = $bdd->prepare("INSERT INTO silo (idjoueursilo, iditems, quantite) VALUES (?, ?, ?)") ;
$reqaugmentersilo = $bdd->prepare("UPDATE silo SET quantite = ? WHERE idjoueursilo = ? AND iditems = ?") ;

// Gestion astéroides.
$reqmajaste = $bdd->prepare('UPDATE champsasteroides SET quantité = ? where idasteroide = ?');
$reqsupaste = $bdd->prepare('DELETE FROM  champsasteroides WHERE idasteroide = ?');
$reqasteroide = $bdd->prepare('SELECT idasteroide, quantité, typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');


// récupération des ordres de déplacement (= typeordre 0).
$reqordredep = $bdd->query('SELECT idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau FROM ordredeplacement WHERE typeordre = 0');
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();
    
    // Si le vaisseau se trouve au hangars :
    if ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0 AND $repvaisseau['univers'] == 0)
        { // Et que le vaisseau tente de sortir vers l'orbite de la planète
        if ($repordredep['xdestination'] == 3 AND $repordredep['ydestination'] == 3 AND $repordredep['universdestination'] == $repordredep['idjoueurduvaisseau'])
             {
            //Créer message pour le joueur.
            $mess = 'Ce vient de sortir du hangars et se trouve maintenant en orbite de notre monde.'; 
            $message ->execute(array($repordredep['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repordredep['idvaisseaudeplacement']));
             goto a;
             } // Permet d'appliquer l'ordre
        else {goto b;} // Supprimer l'ordre
        }

    // Si le tente de se déplacer vers le hangars
    if ($repordredep['xdestination'] == 0 AND $repordredep['ydestination'] == 0)
        { // Et que le vaisseau se trouve en orbite de la planète mère
        if ($repvaisseau['univers'] == 0 AND $repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3)
             { goto a;} // Permet d'appliquer l'ordre
        else { goto b;} // Supprimer l'ordre
        }

    //Créer message pour le joueur.
    $mess = 'Ce vaisseau vient de se déplacer. Il était avant en ' . $repvaisseau['x'] . '-' . $repvaisseau['y'] ; 
    $message ->execute(array($repordredep['idjoueurduvaisseau'] , $mess , 'Vaisseau' , $repordredep['idvaisseaudeplacement'])) ;
    
    a:
    // Applique le déplacement :
    $applicationdeplacement->execute(array($repordredep['xdestination'] , $repordredep['ydestination'] , $repordredep['universdestination'], $repordredep['idvaisseaudeplacement']));

    // Exploration si case inconnue :
    $reqexplorationexistante->execute(array($repordredep['xdestination'] , $repordredep['ydestination'] , $repordredep['universdestination'] , $repordredep['idvaisseaudeplacement']));
    $repexplorationexistante = $reqexplorationexistante->fetch(); 
    if (empty($repexplorationexistante['idexplore']))
        {
        $exploration ->execute(array($repordredep['xdestination'] , $repordredep['ydestination'] , $repordredep['universdestination'], $repordredep['idjoueurduvaisseau'], $touractuel['id'])) ;

        //Créer message pour le joueur.
        $messexplo = 'Ce vaisseau vient d\'explorer le parsec (' . $repordredep['xdestination']  . ' - ' . $repordredep['ydestination'] .').'  ; 
        $message ->execute(array($repordredep['idjoueurduvaisseau'] , $messexplo , 'Vaisseau' , $repordredep['idvaisseaudeplacement'])) ;
        }
    
    b:  
    // Supprimer l'ordre de déplacement
    $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
    }
$reqordredep->closeCursor();

// ordre de récolte des astéroides (= typeordre 1)
$reqordredep = $bdd->query('SELECT idvaisseaudeplacement FROM ordredeplacement WHERE typeordre = 1');
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();
    // emplacement du vaisseau : $repvaisseau['x'] $repvaisseau['y'] $repvaisseau['univers'] 

    $reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
    $repasteroide = $reqasteroide->fetch();
    // Données sur astéroides : $repasteroide['idasteroide'] , $repasteroide['quantité'], $repasteroide['typeitemsaste']

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
        if ($repasteroide['quantité'] < 2)
            {
            $reqsupaste->execute(array($repasteroide['idasteroide']));
            }
        else // Sinon on réduit de 1 sa valeur.
            {
            $reqmajaste->execute(array($repasteroide['quantité'] - 1 , $repasteroide['idasteroide']));
            }
        }
    $reqsupprimerordreprecedent->execute(array($repordredep['idvaisseaudeplacement']));
    }

// ordre de déchargement (= typeordre 2)
$reqordredep = $bdd->query('SELECT idvaisseaudeplacement, idjoueurduvaisseau FROM ordredeplacement WHERE typeordre = 2');
while ($repordredep = $reqordredep->fetch())
    {
    // Vérifier ou se trouver le vaisseau :
    $reqvaisseau->execute(array($repordredep['idvaisseaudeplacement']));
    $repvaisseau = $reqvaisseau->fetch();
    // emplacement du vaisseau : $repvaisseau['x'] $repvaisseau['y'] $repvaisseau['univers'] 

    // Vérifier le vaisseau se trouve sur la planète mère :
    if ($repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3 AND $repvaisseau['univers'] == $repvaisseau['idjoueurbat'])
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
?>