<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idvaisseau'] . '</br>';
echo $_POST['typeordre'] . '</br>';
echo $_POST['xobjectif'] . '</br>';
echo $_POST['yobjectif'] . '</br>';
echo $_POST['confirmer'] . '</br>'; //'on' si case coché, 'off' si non cochée, null si pas de case.
*/

// Si conception : $_POST['composant'] avec 2 valeurs dedans.

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdg->prepare('SELECT * FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
        {
        header('Location: ../accueil.php?message=31');
        exit();
        }

    $reqordreactuel = $bdg->prepare('SELECT * FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
    $reqordreactuel->execute(array($_POST['idvaisseau']));
    $repordreactuel = $reqordreactuel->fetch();

    // Il faut avoir coché la case pour annuler un ordre bloqué. 
    if ($repordreactuel['bloque'] == 1)
        { // Cas du vaisseau en cours de rénovation !
        if ($_POST['confirmer'] == 'on')
            { // Si on valide qu'on veut annuler, alors on peut continuer.

            }
        elseif ($_POST['confirmer'] == 'off')
            { // Si la variable existe et est à 0 :
            $message = 43 ;
            goto a; 
            }
        else
            {
            $message = 34 ;
            goto a;
            }
        }
   
    if ($_POST['typeordre'] == 0)
        { // Ordre de déplacement classique
        //Vérifier que les coordonnées sont différentes. 
        if ($repvaisseau['x'] == $_POST['xobjectif'] AND $repvaisseau['y'] == $_POST['yobjectif'])
            {
            header("location: ../hangars.php?message=19&" . "id=" . urlencode($_POST['idvaisseau'])); 
            exit();  
            }
        $message = 38 ;
        $_SESSION['message1'] = $_POST['xobjectif']; 
        $_SESSION['message2'] = $_POST['yobjectif']; 
        }

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
        $message = 39 ;
        }

        if ($_POST['typeordre'] == 2)
        { // 2 = décharger
        // Vérifier localisation du vaisseau
        if  ($repvaisseau['univers'] == $_SESSION['id'] AND
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
        $message = 40 ;
        }

    if ($_POST['typeordre'] == 4)
        {
        $message = 45; 
        }
    
    // supprimer ordre précédent.
    $reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
    $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));

    // Cas d'une suppression d'un ordre de rénovation de vaisseau :
    // Récupérer l'ordre de construction :
    $reqnumerodeconstruction = $bdg->prepare('SELECT idconstruction FROM concenptionencours WHERE idvaisseauconception = ?');
    $reqnumerodeconstruction->execute(array($_POST['idvaisseau']));
    $repnumerodeconstruction = $reqnumerodeconstruction->fetch();

    if (isset($repnumerodeconstruction['idconstruction']))
        {
        // Supprimer la construction en cours :
        $reqsupprimerconstructionencours = $bdg->prepare('DELETE FROM construction WHERE idconst = ?');
        $reqsupprimerconstructionencours->execute(array($repnumerodeconstruction['idconstruction']));

        // Supprimer la partie spéciale liée à la conception en cours :
        $reqsupprimerconcenptionencours = $bdg->prepare('DELETE FROM concenptionencours WHERE idvaisseauconception = ?');
        $reqsupprimerconcenptionencours->execute(array($_POST['idvaisseau']));
        $message = 33 ;
        } 

    if ($_POST['typeordre'] == -1)
        { // Cas de l'annulation d'un ordre.
        if (!isset($message))
            { // Si on a pas encore de message, alors c'est juste le message de base pour annuler un ordre.
            $message = 20 ;
            }
        }    
    else
        {
        $req = $bdg->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], $_POST['xobjectif'], $_POST['yobjectif'], $repvaisseau['univers'], $_SESSION['id'], $_POST['typeordre']));
        }

    if ($_POST['typeordre'] == 7 OR $_POST['typeordre'] == 6)
        { // 7 = réparer
        // Vérifier localisation du vaisseau
        if  ($repvaisseau['univers'] == $_SESSION['id'] AND $repvaisseau['x'] == 0 OR $repvaisseau['y'] == 0)
            {
            // Calculer le prix de réparation avec les dégats.
            $nbHPareparer = $repvaisseau['HPmaxvaisseau'] - $repvaisseau['HPvaisseau']; 
            $prixbienreparation = $nbHPareparer *10;

            if ($_POST['typeordre'] == 7)
                {
                if($repvaisseau['HPvaisseau'] == $repvaisseau['HPmaxvaisseau'])
                    { // Le vaisseau est full HP !
                    header("location: ../hangars.php?message=37&" . "id=" . urlencode($_POST['idvaisseau']));
                    exit();
                    }
                else
                    {
                    // Insérer construction/prix
                    $reqcreerconstruction = $bdg->prepare('INSERT INTO construction
                    (trucaconstruire, nombre, idjoueurconst, avancementbiens, avancementtitane, prixbiens, prixtitane)
                    VALUES(?, ?, ?, ?, ?, ?, ?)');
                    $reqcreerconstruction->execute(array(-2, 1, $_SESSION['id'], $prixbienreparation, 0, $prixbienreparation, 0));

                    $reqnumconstruction = $bdg->QUERY('SELECT idconst FROM construction ORDER BY idconst DESC LIMIT 1'); 
                    $repnumconstruction = $reqnumconstruction ->fetch();

                    // Insérer conception (besoin pour garder un lien vers le vaisseau)
                    $reqcreerconception = $bdg->prepare('INSERT INTO concenptionencours(idconstruction, idvaisseauconception, typecomposant, idnouvcomposant) VALUES(?, ?, ?, ?)');
                    $reqcreerconception->execute(array($repnumconstruction['idconst'], $_POST['idvaisseau'], 0 , 0)); 
                    $message = 44 ; 
                    }
                }
            elseif ($_POST['typeordre'] == 6)
                { // 6 = Conception de vaisseau.
                $result = $_POST['composant'];
                $result_explode = explode('|', $result);
                $reqcreerconstruction = $bdg->prepare('INSERT INTO construction
                    (trucaconstruire, nombre, idjoueurconst, avancementbiens, avancementtitane, prixbiens, prixtitane)
                    VALUES(?, ?, ?, ?, ?, ?, ?)');
                $reqcreerconstruction->execute(array(-1, 1, $_SESSION['id'], 100+$prixbienreparation, 0, 100+$prixbienreparation, 0));

                $reqnumconstruction = $bdg->QUERY('SELECT idconst FROM construction ORDER BY idconst DESC LIMIT 1'); 
                $repnumconstruction = $reqnumconstruction ->fetch();

                $reqcreerconception = $bdg->prepare('INSERT INTO concenptionencours(idconstruction, idvaisseauconception, typecomposant, idnouvcomposant) VALUES(?, ?, ?, ?)');
                $reqcreerconception->execute(array($repnumconstruction['idconst'], $_POST['idvaisseau'], $result_explode[1], $result_explode[0]));

                $message = 32 ; 
                }            
            }
        else
            { // Pas au bon endroit pour réparer le vaisseau.
            header("location: ../hangars.php?message=41&" . "id=" . urlencode($_POST['idvaisseau']));
            exit();
            }
        }

    if (isset($message))
        {
        a:
        header("location: ../hangars.php?message=" . $message . "&id=" . urlencode($_POST['idvaisseau']));
        exit(); 
        }

header("Location: ../hangars.php?id=" . urlencode($_POST['idvaisseau']));
?>