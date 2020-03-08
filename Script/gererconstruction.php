<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['perdreressources'] . '</br>' ;
echo $_POST['idconstruction'] . '</br>' ;
echo $_POST['id'] . '</br>' ;
*/

//Vérifier propriétaire de la construction.  
$reqproprietaireordreconstruction = $bdg->prepare('SELECT * FROM construction WHERE idconst = ?');
$reqproprietaireordreconstruction->execute(array($_POST['idconstruction']));
$repproprietaireordreconstruction = $reqproprietaireordreconstruction->fetch();

if ($repproprietaireordreconstruction['idplaneteconst'] != $_POST['id'])
    {
    header('Location: ../Accueil.php'); exit();
    }

if ($_GET['action'] == 'annuler' AND $repproprietaireordreconstruction['trucaconstruire'] > 0) 
    { // Truc à construire doit être supérieur à 1, car sinon on a aussi des conceptions et problème avec déplacement/conception.
    $reqinfoitem = $bdd->prepare('SELECT itemnecessaire FROM items WHERE iditem = ?');
    $reqinfoitem->execute(array($repproprietaireordreconstruction['trucaconstruire'])); 
    $repinfoitem = $reqinfoitem->fetch();

    include("../function/consommercreeritemsplanetemultiple.php");

    // Si pas d'avancement ou si on a coché la case on supprime tout.
    if (($repproprietaireordreconstruction['avancementbiens'] == $repproprietaireordreconstruction['prixbiens'] AND $repproprietaireordreconstruction['avancementtitane'] == $repproprietaireordreconstruction['prixtitane']) OR isset($_POST['perdreressources']))
        {
        $stmt = $bdg->prepare("DELETE FROM construction WHERE idconst = :idconst");
        $stmt->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
        $stmt->execute();
        consommercreeritemsplanetemultiple(0, $repinfoitem['itemnecessaire'], $_POST['id'], $repproprietaireordreconstruction['nombre']);
        header("location: ../planete.php?message=13&id=" . urlencode($_POST['id']));
        exit(); 
        }  
    else
        {// Si avancé et pas coché, alors on ne laisse qu'une seule construction et on renvoie vers la page avec un message d'alerte.
        $stmt = $bdg->prepare("UPDATE construction SET nombre = 1 WHERE idconst = :idconst");
        $stmt->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
        $stmt->execute();
        for ($i = 2; $i <= $repproprietaireordreconstruction['nombre']; $i++)
            { // On va rembourser la quantité en cours -1 (intérêt du 2)
            creerconsommeritems(0, $repinfoitem['itemnecessaire'], $_POST['id']);
            }
        header("location: ../planete.php?message=14&id=" . urlencode($_POST['id']));
        exit(); 
        }

    } // Fin annulation de la construction.

elseif ($_GET['action'] == 'deprioriser')
    { // Cela permet d'envoyer la construction en tout dernier de la liste.
    $reqderniereconst = $bdg->query('SELECT ordredeconstruction FROM construction ORDER BY ordredeconstruction DESC LIMIT 1');
    $repderniereconst = $reqderniereconst ->fetch();
    $reqordredeconstruction = $bdg->prepare('UPDATE construction SET ordredeconstruction = ? WHERE idconst = ?');
    $reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $_POST['idconstruction']));
    header("location: ../planete.php?message=57&id=" . urlencode($_POST['id']));
    exit(); 
    }

elseif ($_GET['action'] == 'pause')
    { // Cela permet d'envoyer la construction en tout dernier de la liste.
    $reqordredeconstruction = $bdg->prepare('UPDATE construction SET ordredeconstruction = ? WHERE idconst = ?');
    $reqordredeconstruction->execute(array(0, $_POST['idconstruction']));
    header("location: ../planete.php?message=58&id=" . urlencode($_POST['id']));
    exit(); 
    }

elseif ($_GET['action'] == 'reprise')
    { // Cela permet d'envoyer la construction en tout dernier de la liste.
    $reqderniereconst = $bdg->query('SELECT ordredeconstruction FROM construction ORDER BY ordredeconstruction DESC LIMIT 1');
    $repderniereconst = $reqderniereconst ->fetch();
    $reqordredeconstruction = $bdg->prepare('UPDATE construction SET ordredeconstruction = ? WHERE idconst = ?');
    $reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $_POST['idconstruction']));
    header("location: ../planete.php?message=59&id=" . urlencode($_POST['id']));
    exit(); 
    }

header("location: ../planete.php?message=31&id=" . urlencode($_POST['id']));
?>