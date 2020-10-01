<?php
/*
session_start();
include("../include/bddconnection.php");
include("fonctionsdutour.php");
*/

$message = $bd->prepare("INSERT INTO c_messagetour(idjoumess, message, domainemess, numspemessage) VALUES (?, ?, ? , ?)") ;

// Gestion construction :
$reqsupprimercontruction = $bd->prepare('DELETE FROM c_construction WHERE idconst =  ? ');
$diminutiondeun = $bd->prepare('UPDATE c_construction SET nombre = nombre - 1, avancementbiens = ?, avancementtitane = ?, avancementneutrinos = ? WHERE idconst = ?');
$reqconstruction = $bd->prepare("SELECT * FROM c_construction WHERE idplaneteconst = ? AND ordredeconstruction > 0 ORDER BY ordredeconstruction ASC");
$avancement = $bd->prepare("UPDATE c_construction SET avancementbiens = ?, avancementtitane = ?, avancementneutrinos = ? WHERE idconst = ?");
$construirebatiment = $bd->prepare('INSERT INTO c_batiment(typebat, idplanetebat) VALUES(?, ?)');
$reqlocalisationplanete = $bd->prepare('SELECT xplanete, yplanete, universplanete FROM c_planete WHERE idplanete = ?');
$construirevaisseau = $bd->prepare('INSERT INTO c_vaisseau(idflottevaisseau, nomvaisseau) VALUES(?, ?)');

// Cas des conceptions :
$reqinsertcomposant = $bd->prepare('INSERT INTO c_composantvaisseau(idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)');
$reqcomposant = $bd->prepare('SELECT iditemcomposant, typecomposant FROM c_composantvaisseau WHERE idvaisseaucompo = ?');
$reqinfovaisseau = $bd->prepare('SELECT idflottevaisseau, nomvaisseau FROM c_vaisseau WHERE idvaisseau = ?');
$reqsupprimerdeplacement = $bd->prepare('DELETE FROM c_ordredeplacement WHERE idvaisseaudeplacement = ?');
$requpdatevaisseau = $bd->prepare('UPDATE c_vaisseau SET HPmaxvaisseau = 1, idflottevaisseau = ? WHERE idvaisseau = ?');

// Gestion flotte : 
$reqtrouverflotte = $bd->prepare('SELECT idflotte FROM c_flotte WHERE idplaneteflotte = ?');
$reqcreerflotte = $bd->prepare('INSERT INTO c_flotte(idplaneteflotte) VALUES(?)');


// Par ailleurs :
$miseajourdesressources = $bd->prepare("UPDATE c_planete SET biens = ?, titane = ?, neutrinos = ? WHERE idplanete = ?");
$reqcategorie = $bd->prepare("SELECT typeitem, nombatiment, itemnecessaire, nomlimite FROM a_items WHERE iditem = ?");
$reqcomptebat = $bd->prepare('SELECT COUNT(idbat) as nb FROM c_batiment WHERE typebat = ? AND idplanetebat = ?');

//Gestion des construction planete par planete
if ($tourrestraint == 'non')
    {
    $reqplanete = $bd->query('  SELECT v.idplanetevariation, p.idjoueurplanete, v.chantier, p.biens, p.titane, p.neutrinos
    FROM c_variationstour v INNER JOIN c_planete p ON p.idplanete = v.idplanetevariation
    ORDER BY p.idjoueurplanete');
    }
else
    {
    $reqplanete = $bd->query('  SELECT v.idplanetevariation, p.idjoueurplanete, v.chantier, p.biens, p.titane, p.neutrinos
                        FROM c_variationstour v INNER JOIN c_planete p ON p.idplanete = v.idplanetevariation
                        WHERE v.idplanetevariation IN ('.$idplanetes.')
                        ORDER BY p.idjoueurplanete');
    }
    
while ($repplanete = $reqplanete->fetch())
    { // Créer les variables qui vont être utilisées dans les boucles :
    $chantier =  $repplanete['chantier'] ;
    $biens = $repplanete['biens'];
    $titane = $repplanete['titane'];
    $neutrinos = $repplanete['neutrinos'];

    // Gestion des constructions une par une et uniquement celles du joueur sélectionné.
    $reqconstruction->execute(array($repplanete['idplanetevariation']));
    while ($repconstruction = $reqconstruction->fetch())
        { // Créer les variables qui vont être utilisées dans les boucles :
        $nb = $repconstruction['nombre'];
        $avancementbiens = $repconstruction['avancementbiens'];
        $nouvavbien = $repconstruction['avancementbiens'];
        $avancementtitane = $repconstruction['avancementtitane'];
        $nouvavtitane = $repconstruction['avancementtitane'];
        $avancementneutrinos = $repconstruction['avancementneutrinos'];
        $nouvavneutrinos = $repconstruction['avancementneutrinos'];
        $itemaajouteraustock = 0;

        a: // Revenir ici si prod se finie et qu'il y a un round 2.

        if (isset($repcategorie['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
            {
            if (is_numeric($repcategorie['nomlimite']))
                {
                $limite = $repcategorie['nomlimite'];
                }
            else
                {
                $reqcategorie = $bd->prepare('SELECT '.$repinfoitem['nomlimite'].' FROM c_limiteplanete WHERE idlimiteplanete = ?'); 
                $reqcategorie->execute(array($_POST['id'])); 
                $repcategorie = $reqcategorie->fetch();
                $limite = $repcategorie['0'];
                }

            // On récupère le nombre de batiments actuels.
            $reqcomptebat->execute(array($repconstruction['trucaconstruire'], $repplanete['idplanetevariation']));
            $repcomptebat = $reqcomptebat->fetch();  

            if ($limite<=$repcomptebat['nb'])
                {
                $reqsupprimercontruction->execute(array($repconstruction['idconst']));
                break; // Permet de gérer le cas des construction au delà de la limite.
                }
            }

        if ($avancementbiens > 1) // S'il reste des biens à investir, faire cette partie.
            {
            $minbiens = min($chantier, $avancementbiens, $biens) ;
            $nouvavbien = $avancementbiens - $minbiens ; 

            $chantier = $chantier - $minbiens ;
            $biens = $biens - $minbiens ;
            if ($biens == 0)
                {
                $message ->execute(array($repplanete['idplanetevariation']  , 'Manque de biens !' , 'Construction' , $repconstruction['idconst'])) ;
                }
            }
        else {$nouvavbien = 0;}

        if ($avancementtitane > 1)  // S'il reste du titane à investir, faire cette partie.
            {
            $mintitane = min($chantier/5, $avancementtitane, $titane) ;
            $nouvavtitane = $avancementtitane - $mintitane ; 

            $chantier = $chantier - $mintitane * 5 ;
            $titane = $titane - $mintitane ;
            }
        else {$nouvavtitane = 0;}

        if ($avancementneutrinos > 1)  // S'il reste du titane à investir, faire cette partie.
            {
            $minneutrinos = min($chantier/20, $avancementneutrinos, $neutrinos);
            $nouvavneutrinos = $avancementneutrinos - $minneutrinos;

            $chantier = $chantier - $minneutrinos * 5;
            $neutrinos = $neutrinos - $minneutrinos;
            }
        else {$nouvavneutrinos = 0;}

        if ($chantier == 0 OR ($chantier < 5 AND $titane > 0) OR ($chantier < 20 AND $neutrinos > 0)) 
            {
            $message ->execute(array($repplanete['idplanetevariation']  , 'Manque d\'ouvriers !' , 'Construction' , $repconstruction['idconst'])) ;
            }

        // Si je peux finir le chantier : 
        if ($nouvavbien == 0 AND $nouvavtitane == 0 AND $nouvavneutrinos == 0)
            {
            $reqcategorie ->execute(array($repconstruction['trucaconstruire']));
            $repcategorie = $reqcategorie ->fetch();

            if ($repcategorie['typeitem'] == 'batiment')
                { // cas des batiments
                $construirebatiment->execute(array($repconstruction['trucaconstruire'], $repplanete['idplanetevariation'] ));
                }

            elseif ($repcategorie['typeitem'] == 'composant' OR $repcategorie['typeitem'] == 'produit')
                { // Ajoute le composant dans le silo.
                $itemaajouteraustock = $repconstruction['trucaconstruire'];
                }

            elseif ($repconstruction['trucaconstruire'] < 0)
                { // cas des vaisseaux
                $reqlocalisationplanete->execute(array($repplanete['idplanetevariation']));
                $replocalisationplanete = $reqlocalisationplanete->fetch();

                $reqinfovaisseau->execute(array(-$repconstruction['trucaconstruire']));
                $repinfovaisseau = $reqinfovaisseau->fetch();

                $reqtrouverflotte->execute(array(-$repplanete['idplanetevariation']));
                $reptrouverflotte = $reqtrouverflotte->fetch();
                if (isset($reptrouverflotte['idflotte']))
                    {// la flotte de défense de la planète existe et on va envoyer le vaisseau dedans. Valeur négative = flotte défensive.
                    $idflotte = $reptrouverflotte['idflotte'] ;
                    }
                else
                    {// la flotte de défense n'existe pas, donc on la créé et on va envoyer le vaisseau dedans.
                    $reqcreerflotte->execute(array(-$repplanete['idplanetevariation']));
                    $idflotte = $bd->lastInsertId();
                    }

                if ($repinfovaisseau['idflottevaisseau'] < 0)
                    { // Si id de la flotte est négatif, alors c'est un plan, donc c'est un nouveau vaisseau.
                    $construirevaisseau->execute(array($idflotte, $repinfovaisseau['nomvaisseau']));
                    $IDdunouveauvaisseau = $bd->lastInsertId();
                    $reqcomposant->execute(array(-$repconstruction['trucaconstruire']));
                    while ($repcomposant= $reqcomposant->fetch())
                        {// Insérer les composants dans le nouveau vaisseau
                        $reqinsertcomposant->execute(array($IDdunouveauvaisseau, $repcomposant['iditemcomposant'], $repcomposant['typecomposant']));
                        }
                    }
                elseif ($repinfovaisseau['idflottevaisseau'] == 0)
                    { // Cas des réparations ou des conceptions
                    // Le fait de mettre les PV à 1 fait que le vaisseau va être full PV lorsqu'on fait la MAJ des vaisseaux.
                    $requpdatevaisseau->execute(array($idflotte, -$repconstruction['trucaconstruire']));
                    }
                 }

            elseif ($repconstruction['trucaconstruire'] == 7)
                { // 7 = recycler des débris de biens

                // calcul du nombre de recycleur de niveau 1 : $repnbrecycleur['nb'];
                $reqcomptebat->execute(array(21, $repplanete['idplanetevariation']));
                $repnbrecycleur = $reqcomptebat->fetch();

                // calcul du nombre de recycleur de niveau 2 : $repnbrecycleur2['nb'];
                $reqcomptebat->execute(array(22, $repplanete['idplanetevariation']));
                $repnbrecycleur2 = $reqcomptebat->fetch();
                
                // Calculer valeur recyclage :  
                $valeurminimalederecyclage = 50 + 15*min($repnbrecycleur['nb'], 1)+ 10*min($repnbrecycleur2 ['nb'], 1) ;
                $valeurmaximalederecyclage = 100 + 30*min($repnbrecycleur['nb'], 1) + 20*min($repnbrecycleur2 ['nb'], 1) ;
                $recdebris = rand($valeurminimalederecyclage , $valeurmaximalederecyclage);

                $biens = $biens + $recdebris;
                
                $mess = 'Le recyclage des débris vous a rapporté ' . $recdebris . ' biens divers.' ;
                $message ->execute(array($repplanete['idjoueurplanete'], $mess , 'planete', $repplanete['idplanetevariation']));
                }

            elseif ($repconstruction['trucaconstruire'] == 9)
                { // 9 = recycler des débris de métaux rares

                // calcul du nombre de recycleur de niveau 1 : $repnbrecycleur['nb'];
                $reqcomptebat->execute(array(21, $repplanete['idplanetevariation']));
                $repnbrecycleur = $reqcomptebat->fetch();

                // calcul du nombre de recycleur de niveau 2 : $repnbrecycleur2['nb'];
                $reqcomptebat->execute(array(22, $repplanete['idplanetevariation']));
                $repnbrecycleur2 = $reqcomptebat->fetch();
                
                // Calculer valeur recyclage :  
                $valeurminimalederecyclage = 8 + 2*min($repnbrecycleur['nb'], 1) + 5*min($repnbrecycleur2 ['nb'], 1) ;
                $valeurmaximalederecyclage = 16 + 4*min($repnbrecycleur['nb'], 1) + 10*min($repnbrecycleur2 ['nb'], 1) ;
                $recdebrisrare = rand($valeurminimalederecyclage , $valeurmaximalederecyclage);

                $titane = $titane + $recdebrisrare;
                $mess = 'Le recyclage des débris vous a rapporté ' . $recdebrisrare . ' unités de titane.' ;
                $message ->execute(array($repplanete['idjoueurplanete'] , $mess , 'planete', $repplanete['idplanetevariation']));
                }

            elseif ($repconstruction['trucaconstruire'] == 37)
                { // 37 = purification de neutrinos
                $recdebrisirradies = rand(20, 50); // REVOIR CETTE PARTIE AVEC DES RECYCLEURS ?

                $neutrinos = $neutrinos + $recdebrisirradies;
                $mess = 'Le recyclage des débris vous a rapporté ' . $recdebrisirradies . ' barres de neutrinos.' ;
                $message ->execute(array($repplanete['idjoueurplanete'] , $mess , 'planete', $repplanete['idplanetevariation']));
                }
            
            elseif ($repconstruction['trucaconstruire'] == 27)
                { // 27 = utilisation du titane en barres.
                $gaindetitane = rand(40, 60); // REVOIR CETTE PARTIE AVEC DES RECYCLEURS ?
                $gainbien = rand(200, 400);

                $biens = $biens + $gainbien;
                $titane = $titane + $gaindetitane;
                $mess = 'L\'utilisation des barres en titane vous a rapporté ' . $gainbien . ' biens et '.$gaindetitane.' de titane.' ;
                $message ->execute(array($repplanete['idjoueurplanete'] , $mess , 'planete', $repplanete['idplanetevariation']));
                }

            elseif ($repconstruction['trucaconstruire'] == 42)
                { // 42 = utilisation des barres de neutrinos.
                $gainneutrinos = rand(40, 60); // REVOIR CETTE PARTIE AVEC DES RECYCLEURS ?
                $gainbien = rand(200, 400);

                $biens = $biens + $gainbien;
                $neutrinos = $neutrinos + $gainneutrinos;
                $mess = 'L\'utilisation des barres de neutrinos vous a rapporté ' . $gainbien . ' biens et '.$gainneutrinos.' de neutrinos stabilisés.' ;
                $message ->execute(array($repplanete['idjoueurplanete'] , $mess , 'planete', $repplanete['idplanetevariation']));
                }

            if ($repconstruction['trucaconstruire'] != 7 AND $repconstruction['trucaconstruire'] != 9 AND $repconstruction['trucaconstruire'] != 37)
                {
                $mess = $repcategorie['nombatiment'].' : Construction finie' ;
                $message ->execute(array($repplanete['idjoueurplanete'] , $mess , 'planete', $repplanete['idplanetevariation']));
                }

            consommercreeritemsplanetemultiple(0, $itemaajouteraustock, $repplanete['idplanetevariation'], 1);
            
            // Si je n'ai qu'un bâtiment à faire avant ou s'il ne me reste qu'un seul item en réserver :
            if ($nb < 2)
                {
                $reqsupprimercontruction->execute(array($repconstruction['idconst']));
                }
            else
                {
                $avancementbiens = $repconstruction['prixbiens'];
                $avancementtitane = $repconstruction['prixtitane'];
                $avancementneutrinos = $repconstruction['prixneutrinos'];
                $diminutiondeun->execute(array($avancementbiens, $avancementtitane, $avancementneutrinos, $repconstruction['idconst']));
                $nb-- ;
                goto a;
                }
            }
        else
            {
            $avancement ->execute(array($nouvavbien, $nouvavtitane, $nouvavneutrinos, $repconstruction['idconst']));
            }
        }
    $miseajourdesressources->execute(array($biens, $titane, $neutrinos, $repplanete['idplanetevariation'])); 
    }
?>