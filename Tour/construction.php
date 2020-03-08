<?php
/*
session_start();
include("../include/BDDconnection.php");
include("fonctionsdutour.php");
*/

$message = $bdg->prepare("INSERT INTO messagetour (idjoumess, message, domainemess, numspemessage) VALUES (?, ?, ? , ?)") ;

// Gestion construction :
$reqsupprimercontruction = $bdg->prepare('DELETE FROM construction WHERE idconst =  ? ');
$diminutiondeun = $bdg->prepare('UPDATE construction SET nombre = nombre - 1, avancementbiens = ?, avancementtitane = ? WHERE idconst = ?');
$reqconstruction = $bdg->prepare("SELECT * FROM construction WHERE idplaneteconst = ? AND ordredeconstruction > 0 ORDER BY ordredeconstruction ASC");
$avancement = $bdg->prepare("UPDATE construction SET avancementbiens = ?, avancementtitane = ? WHERE idconst = ?");
$construirebatiment = $bdg->prepare('INSERT INTO batiment (typebat, idplanetebat) VALUES (?, ?)');
$reqlocalisationplanete = $bdg->prepare('SELECT xplanete, yplanete, universplanete FROM planete WHERE idplanete = ?');
$construirevaisseau = $bdg->prepare('INSERT INTO vaisseau (idjoueurvaisseau, univers, x, y) VALUES (?, ?, ?, ?)');

// Cas des conceptions :
$reqconceptioninfo = $bdg->prepare('SELECT v.nomvaisseau, c.idvaisseauconception, c.idnouvcomposant, c.typecomposant
    FROM vaisseau v INNER JOIN conceptionencours c
    ON c.idvaisseauconception = v.idvaisseau
    WHERE idconstruction = ?');
$reqinsertcomposant = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)');
$reqsupprimercomposant = $bdg->prepare('DELETE FROM composantvaisseau WHERE idvaisseaucompo = ? AND typecomposant = ?');
$reqsupprimerconception = $bdg->prepare('DELETE FROM conceptionencours WHERE idvaisseauconception = ? AND typecomposant = ?');
$reqsupprimerdeplacement = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$requpdatevaisseau = $bdg->prepare('UPDATE vaisseau SET HPmaxvaisseau = 1 WHERE idvaisseau = ?');
$requpdatedeplacement = $bdg->prepare('UPDATE ordredeplacement SET bloque = 1 WHERE idvaisseaudeplacement = ?');

// Par ailleurs :
$miseajourdesressources = $bdg->prepare("UPDATE planete SET biens = ?, titane = ? WHERE idplanete = ?");
$reqcategorie = $bdd->prepare("SELECT typeitem, nombatiment, itemnecessaire, nomlimite FROM items WHERE iditem = ?");
$reqcomptebat = $bdg->prepare('SELECT COUNT(idbat) as nb FROM batiment WHERE typebat = ? AND idplanetebat = ?');

//Gestion des construction planete par planete
$reqplanete = $bdg->query('SELECT v.idplanetevariation, p.idjoueurplanete, 
                        v.chantier, p.biens, p.titane ti
                        FROM variationstour v INNER JOIN planete p
                        ON p.idplanete = v.idplanetevariation
                        ORDER BY p.idjoueurplanete');
while ($repplanete = $reqplanete->fetch())
    { // Créer les variables qui vont être utilisées dans les boucles :
    $chantier =  $repplanete['chantier'] ;
    $biens = $repplanete['biens'] ;
    $titane = $repplanete['ti'] ;

    // Gestion des constructions une par une et uniquement celles du joueur sélectionné.
    $reqconstruction->execute(array($repplanete['idplanetevariation']));
    while ($repconstruction = $reqconstruction->fetch())
        { // Créer les variables qui vont être utilisées dans les boucles :
        $nb = $repconstruction['nombre'];
        $avancementbiens = $repconstruction['avancementbiens'] ;
        $nouvavbien = $repconstruction['avancementbiens'] ;
        $avancementtitane = $repconstruction['avancementtitane'] ;
        $nouvavtitane = $repconstruction['avancementbiens'] ;
        $itemaajouteraustock = 0;

        // Si c'est une rénovation de vaisseau (-1 = changer composant, -2 = réparer) :
        if ($repconstruction['trucaconstruire'] == -1 OR $repconstruction['trucaconstruire'] == -2)
            {
            $reqconceptioninfo->execute(array($repconstruction['idconst']));
            $repconceptioninfo = $reqconceptioninfo->fetch();

            // Permet de bloquer un ordre. Le vaisseau ne peut plus avoir un nouvel ordre.
            $requpdatedeplacement->execute(array($repconceptioninfo['idvaisseauconception']));

            // Cela permet d'avoir l'item nécessaire pour le consommer.
            $repcategorie['itemnecessaire'] = $repconceptioninfo['idnouvcomposant'];
            $repcategorie['typeitem'] = "conception" ;
            $repcategorie['nombatiment'] = "Rénovation du " ; 
            $repcategorie['nombatiment'] .= $repconceptioninfo['nomvaisseau'] ;
            // 2 dernière lignes = Permet de donner un nom pour le message au joueur.  
            }
        else
            { // Sinon aller récupérer les infos dans la table des items.
            $reqcategorie ->execute(array($repconstruction['trucaconstruire']));
            $repcategorie = $reqcategorie ->fetch();
            }

        a: // Revenir ici si prod se finie et qu'il y a un round 2.

        if (isset($repcategorie['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
          {
          // On récupère la limite.
          $reqlimite = $bdg->prepare('SELECT '.$repcategorie['nomlimite'].' FROM limiteplanete WHERE idlimiteplanete = ?');
          $reqlimite->execute(array($repplanete['idplanetevariation']));
          $replimite = $reqlimite->fetch(); // $replimite['0']

          // On récupère le nombre de batiments actuels.
          $reqcomptebat->execute(array($repconstruction['trucaconstruire'], $repplanete['idplanetevariation']));
          $repcomptebat = $reqcomptebat->fetch();  // $repcomptechantier['nb']
               
          if ($replimite['0']<=$repcomptebat['nb'])
            {
            $reqsupprimercontruction->execute(array($repconstruction['idconst']));
            break;
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

        if ($chantier == 0 OR ($chantier < 5 AND $titane > 0)) 
            {
            $message ->execute(array($repplanete['idplanetevariation']  , 'Manque d\'ouvriers !' , 'Construction' , $repconstruction['idconst'])) ;
            }

        // Si je peux finir le chantier : 
        if ($nouvavbien == 0 AND $nouvavtitane == 0)
            {
            if ($repcategorie['typeitem'] == 'batiment')
                { // cas des batiments
                $construirebatiment->execute(array($repconstruction['trucaconstruire'], $repplanete['idplanetevariation'] ));
                }

            elseif ($repcategorie['typeitem'] == 'vaisseau')
                { // cas des vaisseaux
                $reqlocalisationplanete->execute(array($repplanete['idplanetevariation']));
                $replocalisationplanete = $reqlocalisationplanete->fetch();

                $construirevaisseau->execute(array($repplanete['idjoueurplanete'], 0, $repplanete['idplanetevariation'], 0));             
                }

            elseif ($repcategorie['typeitem'] == 'composant')
                { // Ajoute le composant dans le silo.
                $itemaajouteraustock = $repconstruction['trucaconstruire'];
                }

            elseif ($repcategorie['typeitem'] == 'conception')
                { // Cas d'un changement de composant dans un vaisseau
                if ($repconstruction['trucaconstruire'] == -1)
                    {
                    // Supprimer précédent composant
                    $reqsupprimercomposant->execute(array($repconceptioninfo['idvaisseauconception'], $repconceptioninfo['typecomposant']));

                    // Puis insérer le nouveau
                    $reqinsertcomposant->execute(array($repconceptioninfo['idvaisseauconception'], $repconceptioninfo['idnouvcomposant'], $repconceptioninfo['typecomposant']));
                    }
                // Permet de gérer le cas des réparations (les PV du vaisseau = PV max lors du recalcul des PV car PV composant =! PV max vaisseau dans update des vaisseaux.)
                $requpdatevaisseau->execute(array($repconceptioninfo['idvaisseauconception']));
                
                // Supprimer la conception en cours.
                $reqsupprimerconception->execute(array($repconceptioninfo['idvaisseauconception'], $repconceptioninfo['typecomposant']));

                // Supprimer l'ordre de déplacement.
                $reqsupprimerdeplacement->execute(array($repconceptioninfo['idvaisseauconception']));
                }

            elseif ($repconstruction['trucaconstruire'] == 7)
                { // 7 = recycler des débris de biens
                $recdebris = rand(75 , 150);
                $biens = $biens + $recdebris;
                $mess = 'Le recyclage des débris vous a rapporté ' . $recdebris . ' biens divers.' ;
                $message ->execute(array($repplanete['idplanetevariation'] , $mess , 'Construction', $repplanete['idplanetevariation']));
                }

            elseif ($repconstruction['trucaconstruire'] == 9)
                { // 9 = recycler des débris de métaux rares
                $recdebrisrare = rand(15 , 30);
                $titane = $titane + $recdebrisrare;
                $mess = 'Le recyclage des débris vous a rapporté ' . $recdebrisrare . ' unités de titane.' ;
                $message ->execute(array($repplanete['idjoueurplanete'] , $mess , 'planete', $repplanete['idplanetevariation']));
                }

            if ($repconstruction['trucaconstruire'] != 7 AND $repconstruction['trucaconstruire'] != 9)
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
                $avancementtitane = $repconstruction['prixtitane'] ;
                $diminutiondeun->execute(array($avancementbiens, $avancementtitane, $repconstruction['idconst']));
                $nb-- ;
                goto a;
                }
            }
        else
            {
            $avancement ->execute(array($nouvavbien, $nouvavtitane, $repconstruction['idconst']));
            }
        }
    $miseajourdesressources->execute(array($biens, $titane, $repplanete['idplanetevariation'])); 
    }
?>