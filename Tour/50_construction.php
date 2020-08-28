<?php
/*
session_start();
include("../include/BDDconnection.php");
include("fonctionsdutour.php");
*/

$message = $bdg->prepare("INSERT INTO messagetour (idjoumess, message, domainemess, numspemessage) VALUES (?, ?, ? , ?)") ;

// Gestion construction :
$reqsupprimercontruction = $bdg->prepare('DELETE FROM construction WHERE idconst =  ? ');
$diminutiondeun = $bdg->prepare('UPDATE construction SET nombre = nombre - 1, avancementbiens = ?, avancementtitane = ?, avancementneutrinos = ? WHERE idconst = ?');
$reqconstruction = $bdg->prepare("SELECT * FROM construction WHERE idplaneteconst = ? AND ordredeconstruction > 0 ORDER BY ordredeconstruction ASC");
$avancement = $bdg->prepare("UPDATE construction SET avancementbiens = ?, avancementtitane = ?, avancementneutrinos = ? WHERE idconst = ?");
$construirebatiment = $bdg->prepare('INSERT INTO batiment (typebat, idplanetebat) VALUES (?, ?)');
$reqlocalisationplanete = $bdg->prepare('SELECT xplanete, yplanete, universplanete FROM planete WHERE idplanete = ?');
$construirevaisseau = $bdg->prepare('INSERT INTO vaisseau (idflottevaisseau, nomvaisseau) VALUES (?, ?)');

// Cas des conceptions :
$reqinsertcomposant = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)');
$reqcomposant = $bdg->prepare('SELECT iditemcomposant, typecomposant FROM composantvaisseau WHERE idvaisseaucompo = ?');
$reqinfovaisseau = $bdg->prepare('SELECT idflottevaisseau, nomvaisseau FROM vaisseau WHERE idvaisseau = ?');
$reqsupprimerdeplacement = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$requpdatevaisseau = $bdg->prepare('UPDATE vaisseau SET HPmaxvaisseau = 1, idflottevaisseau = ? WHERE idvaisseau = ?');

// Gestion flotte : 
$reqtrouverflotte = $bdg->prepare('SELECT idflotte FROM flotte WHERE idplaneteflotte = ?');
$reqcreerflotte = $bdg->prepare('INSERT INTO flotte (idplaneteflotte) VALUES (?)');


// Par ailleurs :
$miseajourdesressources = $bdg->prepare("UPDATE planete SET biens = ?, titane = ?, neutrinos = ? WHERE idplanete = ?");
$reqcategorie = $bdd->prepare("SELECT typeitem, nombatiment, itemnecessaire, nomlimite FROM items WHERE iditem = ?");
$reqcomptebat = $bdg->prepare('SELECT COUNT(idbat) as nb FROM batiment WHERE typebat = ? AND idplanetebat = ?');

//Gestion des construction planete par planete
$reqplanete = $bdg->query('SELECT v.idplanetevariation, p.idjoueurplanete, 
                        v.chantier, p.biens, p.titane, p.neutrinos
                        FROM variationstour v INNER JOIN planete p
                        ON p.idplanete = v.idplanetevariation
                        ORDER BY p.idjoueurplanete');
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
                $reqcategorie = $bdg->prepare('SELECT '.$repinfoitem['nomlimite'].' FROM limiteplanete WHERE idlimiteplanete = ?'); 
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
                    $idflotte = $bdg->lastInsertId();
                    }

                if ($repinfovaisseau['idflottevaisseau'] < 0)
                    { // Si id de la flotte est négatif, alors c'est un plan, donc c'est un nouveau vaisseau.
                    $construirevaisseau->execute(array($idflotte, $repinfovaisseau['nomvaisseau']));
                    $IDdunouveauvaisseau = $bdg->lastInsertId();
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