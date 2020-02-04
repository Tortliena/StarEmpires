<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idvaisseau'] . '</br>';
echo $_POST['typeordre'] . '</br>';
*/

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdg->prepare('SELECT x, y, univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
        {
        header('Location: ../accueil.php?message=31');
        exit();
        }

    $reqordreactuel = $bdg->prepare('SELECT typeordre FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
    $reqordreactuel->execute(array($_POST['idvaisseau']));
    $repordreactuel = $reqordreactuel->fetch();   
    if ($repordreactuel['typeordre'] == 6)
        { // Cas du vaisseau en cours de rénovation !
        header("location: ../hangars.php?message=34&" . "id=" . urlencode($_POST['idvaisseau'])); 
        exit();
        }

    else
        {
        // supprimer ordre précédent.
        $reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        if ($_POST['typeordre'] == 1)
            { // 1 = miner
            // Vérifier qu'il y a un champs d'asteroides près du vaisseau. 
            $reqasteroide = $bda->prepare('SELECT idasteroide FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');
            $reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
            $repasteroide = $reqasteroide->fetch();   
            if (!isset($repasteroide['idasteroide']))
                {
                header("location: ../hangars.php?message=35&" . "id=" . urlencode($_POST['idvaisseau'])); 
                exit();
                }
            }

        if ($_POST['typeordre'] == 2)
            {
            // Vérifier localisation du vaisseau
            if  ( $repvaisseau['univers'] == $_SESSION['id'] AND
                // Cas du vaisseau proche de la planète :
                (($repvaisseau['x'] == 3 OR $repvaisseau['y'] == 3 )
                OR
                // Cas du vaisseau en orbite de la planète :
                ($repvaisseau['x'] == 0 OR $repvaisseau['y'] == 0)
                ))
                {
                // Vérifier qu'il y a quelque chose dans le vaisseau.
                $reqverifcargo = $bdg->prepare(" SELECT quantiteitems FROM cargovaisseau WHERE idvaisseaucargo = ?") ;
                $reqverifcargo ->execute(array($_POST['idvaisseau']));
                $repverifcargo  = $reqverifcargo ->fetch();
                if (!isset($repverifcargo['quantiteitems']))
                    {
                    header("location: ../hangars.php?message=36&" . "id=" . urlencode($_POST['idvaisseau']));
                    exit();
                    }
                }
            }
              
        $req = $bdg->prepare('INSERT INTO ordredeplacement (idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], 0, 0, $_SESSION['id'], $_SESSION['id'], $_POST['typeordre']));
        }

header("Location: ../hangars.php?id=" . urlencode($_POST['idvaisseau']));
?>