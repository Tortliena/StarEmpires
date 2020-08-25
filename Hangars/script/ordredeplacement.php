<?php 
session_start(); 
include("../include/BDDconnection.php"); 
 
echo $_SESSION['id'] . ' ID du joueur </br>';
echo $_POST['idflotte'] . ' ID de la flotte </br>';
echo $_POST['typeordre'] . ' Type ordre </br>';
echo $_POST['xobjectif'] . ' x objectif </br>';
echo $_POST['yobjectif'] . ' y objectif</br>';
echo $_POST['confirmer'] . '</br> \'on\' si case coché, \'off\' si non cochée, null si pas de case.';

// Vérifier propriétaire du vaisseau.
$reqflotte = $bdg->prepare('    SELECT p.idjoueurplanete, f.idflotte, f.universflotte,
                                f.xflotte, f.yflotte, f.universdestination,
                                f.xdestination, f.ydestination, f.typeordre, f.bloque
                                FROM flotte f
                                INNER JOIN planete p ON p.idplanete = f.idplaneteflotte
                                WHERE f.idflotte = ?');
$reqflotte->execute(array($_POST['idflotte']));
$repflotte = $reqflotte->fetch();

if ($repflotte['idjoueurplanete'] != $_SESSION['id'])
    {
    header('Location: ../accueil.php?message=31');
    exit();
    }

// Il faut avoir coché la case pour annuler un ordre bloqué.
if ($repflotte['bloque'] == 1)
    { // Cas du vaisseau en cours de rénovation ! À virer ?
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
if ($repflotte['bloque'] == 2)
    {
    $message = 47 ;
    goto a;
    }
if ($_POST['typeordre'] == 6)
    { // Ordre de déplacement classique
    //Vérifier que les coordonnées sont différentes.
    if ($repflotte['xflotte'] == $_POST['xobjectif'] AND $repflotte['yflotte'] == $_POST['yobjectif'])
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
    // Vérifier qu'il y a un champs d'asteroides près de la flotte.
    $reqasteroide = $bda->prepare('SELECT idasteroide FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');
    $reqasteroide->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte'])); 
    $repasteroide = $reqasteroide->fetch();
    if (!isset($repasteroide['idasteroide']))
        {
        $message = 35 ;
        goto a;
        }
    $message = 39 ;
    }

// supprimer ordre précédent.
$reqmettreajourordre = $bdg->prepare('UPDATE flotte SET universdestination = ?, xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ?');
$reqmettreajourordre->execute(array(0, 0, 0, 0, 0, $_POST['idflotte']));

// Supprimer ordre de bataille :
$reqsupprimerbataille = $bdg->prepare('DELETE FROM bataille WHERE idflotteoffensive  = ?');
$reqsupprimerbataille->execute(array($_POST['idflotte']));

if ($_POST['typeordre'] == 5)
    { // Bataille
    $reqcreerbataille = $bdg->prepare('INSERT INTO bataille (idflotteoffensive, idflottedefensive) VALUES(?, ?)');
    $reqcreerbataille ->execute(array($_POST['idflotte'], $_POST['xobjectif']));
    $message = 46;
    }

if ($_POST['typeordre'] == 10)
    { // Ordre de saut.
    if ($repflotte['universflotte'] > 0)
        { // Univers commum
        $repflotte['universflotte'] = -2;
        }
    elseif ($repflotte['universflotte'] == -2)
        { // univers du joueur.
        $repflotte['universflotte'] = $repflotte['idjoueurplanete'];
        }
    else
        { // Mauvaise destination
        header('Location: ../accueil.php?message=31');
        exit();
        }
    }

if ($_POST['typeordre'] == 2)
    { // Ordre de saut spécifique
    if (in_array($_POST['xobjectif'], array(-3, -2, $_SESSION['id'])))
        { // Univers commum
        $repflotte['universflotte'] = $_POST['xobjectif'];
        $_POST['typeordre'] = 10; // Permet d'être traité comme un ordre de saut dimensionnel.
        }
    else
        { // Mauvaise destination
        header('Location: ../accueil.php?message=31');
        exit();
        }
    }


if ($_POST['typeordre'] == -1)
    { // Cas de l'annulation d'un ordre.
    if ($repflotte['typeordre'] == 1)
        { // Minage.
        $message = 49 ;
        }
    elseif ($repflotte['typeordre'] == 5)
        { // Bataille
        $message = 53 ;
        }
    else
        {// Par défaut, message générique.
        $message = 20 ;
        }
    }
else
    {
    $reqmettreajourordre->execute(array($repflotte['universflotte'], $_POST['xobjectif'], $_POST['yobjectif'], $_POST['typeordre'], 0, $_POST['idflotte']));
    }
 
if (isset($message))
    {
    a:
    header("location: ../hangars.php?message=" . $message . "&id=" . urlencode($_POST['idflotte']));
    exit();
    }

header("Location: ../hangars.php??message=31&id=" . urlencode($_POST['idflotte']));
?>