<?php 
/*
session_start();
require __DIR__ . '/../include/bddconnection.php'; 
require __DIR__ . '/../function/consommercreeritemsplanetemultiple.php';
require __DIR__ . '/../function/flotte.php';
*/

// récupérer le num du tour ($touractuel['id']) 
$reqtouractuel = $bd->query('SELECT id FROM c_tour ORDER BY id DESC LIMIT 1'); 
$touractuel = $reqtouractuel->fetch(); 
 
// Gestion vaisseau 
$applicationdeplacement = $bd->prepare("UPDATE c_flotte SET xflotte = ? , yflotte = ?, universflotte = ? WHERE idflotte = ? "); 
$reqmettrePV1flotte = $bd->prepare("UPDATE c_flotte SET xflotte = ?, yflotte = ?, typeordre = ?, bloque = ? WHERE idflotte = ? "); 
$reqmettrePV1vaisseau = $bd->prepare("UPDATE c_vaisseau SET HPvaisseau = ? WHERE idflottevaisseau = ? "); 

// Divers 
$message = $bd->prepare("INSERT INTO c_messagetour(idjoumess, message, domainemess, numspemessage) VALUES (?, ?, ?, ?)"); 
$reqsupprimerordreprecedent = $bd->prepare('UPDATE c_flotte SET universdestination = 0, xdestination = 0, ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');
$reqmessageinterne = $bd->prepare('INSERT INTO c_messagerieinterne(expediteur, destinataire, lu, titre, texte) VALUES (?, ?, ?, ?, ?)');

//planete
$reqplanete = $bd->prepare('SELECT idplanete FROM c_planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? AND idjoueurplanete = ?');
$reqplanete2 = $bd->prepare('SELECT * FROM c_planete WHERE idplanete = ?');
$reqchangementproprioplanete = $bd->prepare('UPDATE c_planete SET idjoueurplanete = ?, biens = biens + ?, organisation = 100, prestige = 0, idplanetesuzerain = ? WHERE idplanete = ?');
$reqpop = $bd->prepare('INSERT INTO c_population(idplanetepop, typepop) VALUES(?, ?)');
$requpenv = $bd->prepare('UPDATE c_planete SET stabiliteenvironnement = ?, environnement = ?, organisation = ? WHERE idplanete = ?');
$requprestau = $bd->prepare('UPDATE c_planete SET restauration = ? WHERE idplanete = ?');

$tuerunepop = $bd->prepare('DELETE FROM c_population WHERE idplanetepop = ? ORDER BY RAND () LIMIT 1');
$detruireunbatiment = $bd->prepare('DELETE FROM c_batiment WHERE idplanetebat = ? ORDER BY RAND () LIMIT 1');

// Gestion exploration
$reqexplorationexistante = $bd->prepare("SELECT idexplore FROM c_explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? ");
$exploration = $bd->prepare("INSERT INTO c_explore(x , y, univers , idexplorateur, tourexploration) VALUES(?, ?, ?, ?, ?)");

// Gestion cargo
$reqverifcargo = $bd->prepare(" SELECT  v.idvaisseau, v.capacitedesoute FROM c_vaisseau v
                                LEFT JOIN c_cargovaisseau c ON c.idvaisseaucargo  = v.idvaisseau
                                WHERE v.idflottevaisseau = ?");
$reqverifcargo2 = $bd->prepare("SELECT SUM(quantiteitems) AS quantitetransportee, quantiteitems FROM c_cargovaisseau WHERE idvaisseaucargo = ? AND typeitems like ?");
$reqcreercargo = $bd->prepare("INSERT INTO c_cargovaisseau (idvaisseaucargo, typeitems, quantiteitems) VALUES (?, ?, ?)");
$reqaugmentercargo = $bd->prepare("UPDATE c_cargovaisseau SET quantiteitems = ? WHERE idvaisseaucargo = ? AND typeitems = ?");

// Gestion Silo
$reqverifsilo = $bd->prepare("SELECT quantite FROM c_silo WHERE idjoueursilo = ? AND iditems = ?"); 
$reqcreersilo = $bd->prepare("INSERT INTO c_silo (idjoueursilo, iditems, quantite) VALUES (?, ?, ?)");
$reqaugmentersilo = $bd->prepare("UPDATE c_silo SET quantite = ? WHERE idjoueursilo = ? AND iditems = ?");

// Gestion astéroides.
$reqmajaste = $bd->prepare('UPDATE c_champsasteroides SET quantite = ? WHERE idasteroide = ?');
$reqsupaste = $bd->prepare('DELETE FROM c_champsasteroides WHERE idasteroide = ?');
$reqasteroide = $bd->prepare('SELECT idasteroide, quantite, typeitemsaste FROM c_champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? ORDER BY RAND () LIMIT 1');

// Gestion bataille
$reqsupprimerbataille = $bd->prepare('DELETE FROM c_bataille WHERE idflotteoffensive = ?');

// Module présent dans la flotte
$reqmodule = $bd->prepare(" SELECT v.idvaisseau FROM c_composantvaisseau c
                            INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucompo
                            WHERE v.idflottevaisseau = ? AND c.iditemcomposant = ?
                            LIMIT 1");

$requpdateordre = $bd->prepare('UPDATE c_flotte SET universdestination = ?, xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ?');

// Trouver les flottes en défense :
$reqtrouverflottedelaplanete = $bd->prepare('   SELECT v.idvaisseau FROM c_flotte f
                                                INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                                INNER JOIN c_vaisseau v ON v.idflottevaisseau = f.idflotte
                                                WHERE f.universflotte = ? AND p.universplanete = ? AND f.xflotte = ? AND p.xplanete = ? AND f.yflotte = ? AND p.yplanete = ?');
$reqtrouverflottedefense = $bd->prepare('   SELECT v.idvaisseau FROM flotte f
                                            INNER JOIN c_planete p ON p.idplanete = -f.idplaneteflotte
                                            INNER JOIN c_vaisseau v ON v.idflottevaisseau = f.idflotte
                                            WHERE p.universplanete = ? AND p.xplanete = ? AND p.yplanete = ?');

if ($tourrestraint == 'non')
    {
    $reqflotte = $bd->prepare(' SELECT * FROM c_flotte f
                                LEFT JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                WHERE typeordre = ?');
    }
else
    {
    $reqflotte = $bd->prepare(" SELECT * FROM c_flotte f
                                LEFT JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                WHERE typeordre = ? AND f.idflotte IN ('$idflottes')");
    }

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
    $perteorganisation = 200;

    // Info sur la planète envahie : $repflotte['xdestination'] = id de la planète envahie.
    $reqplanete2->execute(array($repflotte['xdestination']));
    $repplanete = $reqplanete2->fetch();

    // On déterminer s'il reste des vaisseaux dans la flotte défendant la planète.
    $reqtrouverflottedelaplanete->execute(array($repflotte['universflotte'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['xflotte'], $repflotte['yflotte'], $repflotte['yflotte']));
    $reptrouverflottedelaplanete = $reqtrouverflottedelaplanete->fetch();
    if (isset($reptrouverflottedelaplanete['idvaisseau']))
        {
        $invasionacceleree = true;
        }
    else  // Sinon on regarde s'il y en a en orbite
        {
        $reqtrouverflottedefense->execute(array($repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte']));
        $reptrouverflottedefense = $reqtrouverflottedefense->fetch();
        if (!isset($reptrouverflottedefense['idvaisseau']))
            {
            $invasionacceleree = true;
            } //Et dans l'un ou l'autre des cas, on augmente la vitesse d'invasion.
        }

    $textemessage = 'Notre planète '.$repplanete['nomplanete'].' est attaquée.';
    if ($invasionacceleree == true)
        {
        $perteorganisation = 300 + $perteorganisation;
        $diminution = 3;
        $stabiliteenvironnement = max($repplanete['environnement'] - 100 , 0);
        $nouvelenvironnement = $repplanete['environnement'] - 100;

        $probapertedunepop = RAND(1,10);
        if ($probapertedunepop == 1)
            {
            $perteorganisation = 500 + $perteorganisation;
            $Commentairestour .= '<br>Pop tuée sur la planète '.$repflotte['xdestination'].' lors d\'un combat.';
            $tuerunepop->execute(array($repflotte['xdestination']));
            $textemessage .= ' Une population a été tuée dans les bombardements.';
            }

        $probbatdetruit = RAND(1,10);
        if ($probbatdetruit == 1)
            {
            $perteorganisation = 200 + $perteorganisation;
            $Commentairestour .= '<br>bâtiment détruit sur la planète '.$repflotte['xdestination'].' lors d\'un combat.';
            $detruireunbatiment ->execute(array($repflotte['xdestination']));
            $textemessage .= ' Un bâtiment a été détruit dans les bombardements.';
            }
        $nouvelleorganisation = max(100, $repplanete['organisation'] - $perteorganisation);
        $requpenv->execute(array($stabiliteenvironnement, $nouvelenvironnement, $nouvelleorganisation, $repflotte['xdestination']));
        }

    if ($repflotte['ydestination'] > $diminution)
        {
        // Diminuer le compteur de 1 ou plus. La planète n'est pas envahie.
        $tempsrestant = $repflotte['ydestination'] - $diminution;
        $requpdateordre->execute(array(0, $repflotte['xdestination'], $tempsrestant, 3, 1, $repflotte['idflotte']));

        // Message pour le défenseur en fonction de l'état de sa défense.
        if ($invasionacceleree == true)
            {
            $tempsrestant = floor($tempsrestant/3);
            $textemessage .= ' Nos défenses sont dépassées ! Nous allons très rapidement perdre le contrôle de la planète (dans environ '.$tempsrestant.' tours) !';
            }
        else
            {
            $textemessage = ' Nos défenses tiennent bons, mais les ennemis progressent. Elle devrait tomber d\'ici '.$tempsrestant.' tours !';
            }

        $reqmessageinterne->execute(array('Ministère de la Défense', $repplanete['idjoueurplanete'], 0, 'Planète envahie', $textemessage));
        }
    else
        {
        // Récupérer info sur la planète d'origine de la flotte.
        $reqplanete2->execute(array($repflotte['idplaneteflotte']));
        $repplaneteattaquante = $reqplanete2->fetch();

        // Si la planète a un plus gros niveau que celle du joueur, alors lui prendre des planètes de niveau 1 + du prestige + faire perdre un lvl et virer les planètes féodée de même niveau.
        if ($repplanete['niveauplanete'] > 2 AND $repplanete['niveauplanete'] > $repplaneteattaquante['niveauplanete'])
            { // La planète est de niveau 2 au moins, mais supérieure à celle du conquérant. Donc juste pillage.
            
            //function planeteperteniveau($idplaneteperte, $idplaneteprisevassaux)
            planeteperteniveau($repplanete['niveauplanete'], 0);

            $textemessage = ' Notre planète a subi de graves dégats et a été pillé. Notre administration est toujours en place mais va avoir besoin de temps pour s\'en remettre.';
            $reqmessageinterne->execute(array('Ministère de la Défense', $repplanete['idjoueurplanete'], 0, 'Planète en ruines', $textemessage));
            }
        elseif($repplanete['niveauplanete'] > 2)
            { // Dans ce cas, on va soumettre la planète car elle a un bon niveau et peut être soumise.          
            //function planeteperteniveau($idplaneteperte, $idplaneteprisevassaux)
            planeteperteniveau($repflotte['xdestination'], $repflotte['idplaneteflotte']);
            }
        else
            {
            //function planeteperteniveau($idplaneteperte, $idplaneteprisevassaux)
            planeteperteniveau($repflotte['xdestination'], $repflotte['idplaneteflotte']);

            // Si niveau = 1 ou 2, alors la passer au niveau 1 et la soumettre et prendre le contrôle direct.         
            $reqchangementproprioplanete->execute(array($repflotte['idjoueurplanete'], 0, 1, $repflotte['idplaneteflotte'], $repflotte['xdestination']));

            // FAIRE MESSAGE EN FONCTION DU TYPE D'INVASION ! ! ! ! ABCDE
            $reqmessageinterne->execute(array('Force d\'invasion', $repflotte['idjoueurplanete'], 0, 'Planète envahie', 'Nos forces viennent de prendre le contrôle de la planète.'));
            }
        $reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));
        }
    }

$reqflotte->execute(array(4)); // = Terraformation
while ($repflotte = $reqflotte->fetch()) 
    { //$repflotte['xdestination'] = id de la planete
    $reqplanete2->execute(array($repflotte['xdestination'])); 
    $repplanete = $reqplanete2->fetch(); 

    $messterra = 'Terraformation non lancée.';
    if ($repplanete['environnement'] > 3000 OR $repplanete['restauration'] > 0 OR $repflotte['universflotte'] != $repplanete['universplanete'] OR $repflotte['xflotte'] != $repplanete['xplanete'] OR $repflotte['yflotte'] != $repplanete['yplanete'])
        {
        }
    else
        {
        if ($repplanete['environnement'] < 0)
            { // Cas de la restauration planétaire sur un monde abimé.
            $reqmodule->execute(array($repflotte['idflotte'], 39));
            $repmodule = $reqmodule->fetch();
            $tempsrestau = 20;
            $messterra = 'Un vaisseau avec un module de restauration planétaire a été utilisé pour restaurer une planète.';
            }
        
        if (!isset($repmodule['idvaisseau']))
            { // Cas de l'amélioration planétaire quelque soit l'environnement (mais - 3000). 
            $reqmodule->execute(array($repflotte['idflotte'], 40));
            $repmodule = $reqmodule->fetch();
            $tempsrestau = 30;
            $messterra = 'Un vaisseau avec un module d\'amélioration planétaire a été utilisé pour restaurer une planète.';
            }

        if (isset($repmodule['idvaisseau']))
            { // Un vaisseau peut terra, donc faire disparaitre le vaisseau + appliquer la restauration.
            disparitionvaisseau($repmodule['idvaisseau']);
            $requprestau->execute(array($tempsrestau, $repflotte['xdestination']));
            }
        }
    $reqmessageinterne->execute(array('Conseil civil', $repflotte['idjoueurplanete'], 0, 'Terraformation', $messterra));
    $reqsupprimerordreprecedent->execute(array($repflotte['idflotte']));   
    }

// (5) = Combat : Cet ordre ne fait rien ici, tout est géré avec les batailles.

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
    // Applique le déplacement : 
    $applicationdeplacement->execute(array($xeffectif , $yeffectif , $repflotte['universdestination'], $repflotte['idflotte'])); 

    if (isset($repflotte['idjoueurplanete']) AND $repflotte['universdestination'] > -3)
        { // $repflotte['idjoueurplanete'] = Permet de gérer le cas des flottes neutres. $repflotte['universdestination'] : Pas d'exploration dans l'univers 3.
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
                $valeurpossibles = array(1, 2, 3, 4, 5, 15, 16, 17, 18, 19, 20);
                $valeur1 = $valeurpossibles[array_Rand($valeurpossibles, 1)];
                $valeur2 = rand(1,20);
                $a = rand(1,2);
                if ($a == 1)
                    {
                    $xeffectif = $valeur1; 
                    $yeffectif = $valeur2; 
                    }
                else
                    {
                    $xeffectif = $valeur2; 
                    $yeffectif = $valeur1; 
                    }
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
            if (empty($repexplorationexistante['idexplore']) AND $universdestination > -3) 
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
        $reqchangementproprioplanete->execute(array($repflotte['idjoueurplanete'], $bonusbiens[0], $repflotte['idplaneteflotte'], $repflotte['xdestination'])); 
        $reqpop->execute(array($repflotte['xdestination'], 1));
        $messcolonisation = 'Cette flotte vient de coloniser une planete.';
        $message ->execute(array($repflotte['idjoueurplanete'] , $messcolonisation, 'flotte' , $repflotte['idflotte'])) ;
        $reqmessageinterne->execute(array('Conseil civil', $repflotte['idjoueurplanete'], 0, 'planète colonisée', 'Nous venons de coloniser une nouvelle planète. Le vaisseau colonisateur a été perdu dans le processus'));

        disparitionvaisseau($peutcoloniser[1]);
        }
    $reqsupprimerordreprecedent->execute(array($repflotte['idflotte'])); 
    }
?>