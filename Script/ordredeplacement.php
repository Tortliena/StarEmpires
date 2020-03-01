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

// Ordre totalement bloqué : 
if ($repordreactuel['bloque'] == 2)
    {
    $message = 47 ;
    goto a;
    }
if ($_POST['typeordre'] == 0)
    { // Ordre de déplacement classique
    //Vérifier que les coordonnées sont différentes. 
    if ($repvaisseau['x'] == $_POST['xobjectif'] AND $repvaisseau['y'] == $_POST['yobjectif'])
        {
        $message = 19 ;
        goto a;   
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
        $message = 35 ;
        goto a;
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
        $reqverifcargo = $bdg->prepare("SELECT quantiteitems FROM cargovaisseau WHERE idvaisseaucargo = ?") ;
        $reqverifcargo ->execute(array($_POST['idvaisseau']));
        $repverifcargo  = $reqverifcargo ->fetch();
        if (!isset($repverifcargo['quantiteitems']))
            {
            $message = 36 ;
            goto a;
            }
        }
    $message = 40 ;
    }

// ordre de rentrée vers la planète (= typeordre 3). Faire ici une vérification ?

if ($_POST['typeordre'] == 4)
    { // Ordre de sortie vers la carte.
    $message = 45; 
    }

// supprimer ordre précédent.
$reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));

// Cas d'une suppression d'un ordre de rénovation de vaisseau :
// Récupérer l'ordre de construction :
$reqnumerodeconstruction = $bdg->prepare('SELECT idconstruction FROM conceptionencours WHERE idvaisseauconception = ?');
$reqnumerodeconstruction->execute(array($_POST['idvaisseau']));
$repnumerodeconstruction = $reqnumerodeconstruction->fetch();

// Supprimer ordre de bataille :
$reqsupprimerbataille = $bdg->prepare('DELETE FROM bataille WHERE idvaisseauoffensif  = ?');
$reqsupprimerbataille->execute(array($_POST['idvaisseau']));

if ($_POST['typeordre'] == 5)
    { // Ordre de sortie vers la carte.
    $reqcreerbataille = $bdg->prepare('INSERT INTO bataille (idvaisseauoffensif,   idvaisseaudefensif) VALUES(?, ?)') ;
    $reqcreerbataille ->execute(array($_POST['idvaisseau'], $_POST['xobjectif']));
    $message = 46;
    }

if (isset($repnumerodeconstruction['idconstruction']))
    {
    // Supprimer la construction en cours :
    $reqsupprimerconstructionencours = $bdg->prepare('DELETE FROM construction WHERE idconst = ?');
    $reqsupprimerconstructionencours->execute(array($repnumerodeconstruction['idconstruction']));

    // Supprimer la partie spéciale liée à la conception en cours :
    $reqsupprimerconceptionencours = $bdg->prepare('DELETE FROM conceptionencours WHERE idvaisseauconception = ?');
    $reqsupprimerconceptionencours->execute(array($_POST['idvaisseau']));
    } 

if ($_POST['typeordre'] == 10)
    { // Ordre de saut.
	if ($repvaisseau['univers'] >0)
		{
		$repvaisseau['univers'] = -2;
		}
	elseif ($repvaisseau['univers'] ==-2)
		{
		$repvaisseau['univers'] = $repvaisseau['idjoueurbat'];
		}
    }

if ($_POST['typeordre'] == -1)
    { // Cas de l'annulation d'un ordre.
    if ($repordreactuel['typeordre'] == 1)
        { // Minage.
        $message = 49 ;
        } 
    elseif ($repordreactuel['typeordre'] == 2)
        { // Déchargement.
        $message = 50 ;
        } 
    elseif ($repordreactuel['typeordre'] == 3)
        { // Rentrer en orbite.
        $message = 51 ;
        } 
    elseif ($repordreactuel['typeordre'] == 4)
        { // Rentrer en orbite.
        $message = 52 ;
        } 
    elseif ($repordreactuel['typeordre'] == 5)
        { // Rentrer en orbite.
        $message = 53 ;
        } 
    elseif ($repordreactuel['typeordre'] == 6)
        { // Rentrer en orbite.
        $message = 33 ;
        } 
    elseif ($repordreactuel['typeordre'] == 7)
        { // Rentrer en orbite.
        $message = 54 ;
        } 
    else
        {// Par défaut, message générique.
        $message = 20 ;
        } 
    }    
else
    {
    $req = $bdg->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
    $req->execute(array($_POST['idvaisseau'], $_POST['xobjectif'], $_POST['yobjectif'], $repvaisseau['univers'], $_SESSION['id'], $_POST['typeordre']));
    }

if ($_POST['typeordre'] == 7 OR $_POST['typeordre'] == 6)
    { // 7 = réparer ; // 6 = changer composant.
    // Vérifier localisation du vaisseau
    if  ($repvaisseau['univers'] == $_SESSION['id'] AND $repvaisseau['x'] == 0 OR $repvaisseau['y'] == 0)
        {
        if ($_POST['typeordre'] == 7)
            { // Cas et variables spécifiques aux réparations 
            if($repvaisseau['HPvaisseau'] == $repvaisseau['HPmaxvaisseau'])
                { // Le vaisseau est full HP !
                $message = 37 ;
                goto a;
                }
            $trucaconstruire = -2;
            $prixrenovation = 0;
            $typecomposant = 0;
            $idnouvcomposant = 0;
            $message = 44; 

            }
        elseif ($_POST['typeordre'] == 6)
            { // Cas et variables spécifiques aux rénovations.
            $result = $_POST['composant'];
            $result_explode = explode('|', $result);
            $typecomposant = $result_explode[1];
            $idnouvcomposant = $result_explode[0];
            $trucaconstruire = -1;
            $prixrenovation = 20; 
            $message = 32 ; 
            }

        // Gestion des réparations et des rénovations avec les constructions :
        // Calculer le prix de réparation avec les dégats.
        $prixbienreparation = ROUND(
            $repvaisseau['biensvaisseau']*(1 - $repvaisseau['HPvaisseau']/$repvaisseau['HPmaxvaisseau'])/2
            + ($repvaisseau['HPmaxvaisseau']-$repvaisseau['HPvaisseau'])*10);

        $prixtitanereparation = ROUND($repvaisseau['titanevaisseau']*(1 - $repvaisseau['HPvaisseau']/$repvaisseau['HPmaxvaisseau'])/2);

        // Requete pour gérer l'ordre des constructions.
        $reqderniereconst = $bdg->query('SELECT ordredeconstruction FROM construction ORDER BY ordredeconstruction DESC LIMIT 1');
        $repderniereconst = $reqderniereconst ->fetch();

        // Insérer construction/prix
        $reqcreerconstruction = $bdg->prepare('INSERT INTO construction
            (trucaconstruire, nombre, idjoueurconst, avancementbiens, avancementtitane, prixbiens, prixtitane, ordredeconstruction)
            VALUES(?, ?, ?, ?, ?, ?, ?, ?)');
        $reqcreerconstruction->execute(array($trucaconstruire, 1, $_SESSION['id'], $prixbienreparation+$prixrenovation, $prixtitanereparation, $prixbienreparation+$prixrenovation, $prixtitanereparation, $repderniereconst['ordredeconstruction']+1));

        $dernierID = $bdg->lastInsertId();

        $reqcreerconception = $bdg->prepare('INSERT INTO conceptionencours(idconstruction, idvaisseauconception, typecomposant, idnouvcomposant) VALUES(?, ?, ?, ?)');
        $reqcreerconception->execute(array($dernierID, $_POST['idvaisseau'], $typecomposant, $idnouvcomposant)); 
        }
    else
        { // Pas au bon endroit pour réparer le vaisseau.
        $message = 41 ;
        goto a; 
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