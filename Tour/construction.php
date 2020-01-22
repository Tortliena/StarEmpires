<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

/* Commentaire de début de cette phase.
function debutdesconstructions(&$Commentairestour)
{
    $Commentairestour .= '</br> Début de la production des biens';
}
debutdesconstructions($Commentairestour);
*/


// BUG : Pas de débris consommés lorsque recyclage fait.

// Preparation des requêtes sql :
$message = $bdd->prepare("INSERT INTO messagetour (idjoumess , message , domainemess , numspemessage) VALUES (? , ?, ? , ?)") ;

// Gestion construction :
$reqsupprimercontruction = $bdd->prepare('DELETE FROM construction WHERE idconst =  ? ');
$diminutiondeun = $bdd->prepare('UPDATE construction SET nombre = nombre - 1 , avancementbiens = ? , avancementtitane = ?  WHERE idconst = ? ' );
$construction = $bdd->prepare(
    "SELECT nombre, avancementbiens, avancementtitane, idjoueurconst, idconst, trucaconstruire, prixbiens , prixtitane 
    FROM construction WHERE idjoueurconst = ? ORDER BY idconst");
$avancement = $bdd->prepare("UPDATE construction SET avancementbiens = ? , avancementtitane = ? WHERE idconst = ?");

// Gestion silo :
$reqverifsilo = $bdd->prepare('SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?');
$diminutionsilo = $bdd->prepare('UPDATE silo SET quantite = quantite - 1 WHERE idjoueursilo = ? AND iditems = ?' );

// Par ailleurs :
$miseajourdesressources = $bdd->prepare("UPDATE utilisateurs SET biens = ? , titane = ? WHERE id = ?");
$reqcategorie = $bdd->prepare("SELECT typeitem , nombatiment, itemnecessaire, nomlimite FROM items WHERE iditem = ?");
$reqcomptebat = $bdd->prepare('SELECT COUNT(idbat) as nb FROM batiments WHERE typebat = ? AND idjoueurbat = ?');


//Gestion des construction joueur par joueur.
$joueur = $bdd->query('SELECT
                        v.idjoueur idj ,
                        v.chantier chantier ,
                        u.biens biens ,
                        u.titane ti
                        FROM variationstour v
                        INNER JOIN utilisateurs u
                        ON u.id = v.idjoueur
                        ORDER BY idj');
    while ($repjoueur = $joueur->fetch())
    { // Créer les variables qui vont être utilisées dans les boucles :
    $chantier =  $repjoueur['chantier'] ;
    $biens = $repjoueur['biens'] ;
    $titane = $repjoueur['ti'] ;

    // Gestion des constructions une par une et uniquement celles du joueur sélectionné.
    $construction ->execute(array($repjoueur['idj'])) ;
    while ($repconstruction = $construction->fetch())
        { // Créer les variables qui vont être utilisées dans les boucles :
        $nb = $repconstruction['nombre'];
        $avancementbiens = $repconstruction['avancementbiens'] ;
        $nouvavbien = $repconstruction['avancementbiens'] ;
        $avancementtitane = $repconstruction['avancementtitane'] ;
        $nouvavtitane = $repconstruction['avancementbiens'] ;
        $quantiteitemsnecessaire = 0;

        $reqcategorie ->execute(array($repconstruction['trucaconstruire']));
        $repcategorie = $reqcategorie ->fetch();

        // Cas dans lequel la construction consomme des items :
        if ($repcategorie['itemnecessaire']>0)
            {
            $reqverifsilo->execute(array($repjoueur['idj'], $repcategorie['itemnecessaire']));
            $repverifsilo = $reqverifsilo->fetch();
            $quantiteitemsnecessaire = $repverifsilo['quantite'];
            if ($repverifsilo['quantite'] <= 0)
                {
                $reqsupprimercontruction->execute(array($repconstruction['idconst']));
                break;
                }
            }

        a: // Revenir ici si prod se finie et qu'il y a un round 2.

        if (isset($repcategorie['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
          {
          // On récupère la limite.
          $reqlimite = $bdd->prepare('SELECT '.$repcategorie['nomlimite'].' FROM limitesjoueurs WHERE id = ?');
          $reqlimite->execute(array($repjoueur['idj']));
          $replimite = $reqlimite->fetch(); // $replimite['0']

          // On récupère le nombre de batiments actuels.
          $reqcomptebat->execute(array($repconstruction['trucaconstruire'], $repjoueur['idj']));
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
                {$message ->execute(array($repjoueur['idj']  , 'Manque de biens !' , 'Construction' , $repconstruction['idconst'])) ;}
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
            $message ->execute(array($repjoueur['idj']  , 'Manque d\'ouvriers !' , 'Construction' , $repconstruction['idconst'])) ;
            }


        // Si je peux finir le chantier : 
        if ($nouvavbien == 0 AND $nouvavtitane == 0)
            {
            if ($repcategorie['typeitem'] == 'batiments' OR $repcategorie['typeitem'] == 'vaisseau')
                {
                $construire = $bdd->prepare('INSERT INTO '.$repcategorie['typeitem'].' (typebat, idjoueurbat) VALUES (:typebat , :idjoueurbat )');
                $construire->execute(array(
                    'typebat' => $repconstruction['trucaconstruire'],
                    'idjoueurbat' => $repjoueur['idj'] ));
                }
            elseif ($repconstruction['trucaconstruire'] == 7)
                { // 7 = recycler des débris de biens
                $biens = $biens + 100;
                }
            elseif ($repconstruction['trucaconstruire'] == 9)
                { // 9 = recycler des débris de métaux rares
                $titane = $titane + 20;
                }

            $mess = $repcategorie['nombatiment'].' : Construction finie' ;
            $message ->execute(array($repjoueur['idj'] , $mess , 'Construction', 0));

            // Si je n'ai qu'un bâtiment à faire avant ou s'il ne me reste qu'un seul item en réserver :
                if ($nb < 2 OR $quantiteitemsnecessaire == 1)
                    {
                    $reqsupprimercontruction->execute(array($repconstruction['idconst']));
                    if ($quantiteitemsnecessaire > 0)
                        { // Si la construction consomme des items, alors diminuer le stock.
                        $quantiteitemsnecessaire--;
                        $diminutionsilo ->execute(array($repjoueur['idj'], $repcategorie['itemnecessaire']));
                        }
                    }
                else
                    {
                    $avancementbiens = $repconstruction['prixbiens'];
                    $avancementtitane = $repconstruction['prixtitane'] ;
                    $diminutiondeun->execute(array($avancementbiens, $avancementtitane, $repconstruction['idconst']));
                    $nb-- ;
                    if ($quantiteitemsnecessaire > 0)
                        { // Si la construction consomme des items, alors diminuer le stock.
                        $quantiteitemsnecessaire--;
                        $diminutionsilo ->execute(array($repjoueur['idj'], $repcategorie['itemnecessaire']));
                        }
                    goto a;
                    }
            }
        else
            {
            $avancement ->execute(array($nouvavbien, $nouvavtitane, $repconstruction['idconst']));
            }
        }
    $miseajourdesressources->execute(array($biens, $titane, $repjoueur['idj'])); 
    } 
$construction->closeCursor();
$joueur->closeCursor();
?>