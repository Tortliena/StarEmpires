<?php
session_start();
include("../../include/bddconnection.php");
include("../../function/consommercreeritemsplanetemultiple.php");
include("includesecuriteplanete.php");

/*
echo $_SESSION['id'] . '</br>' ;
echo $_POST['perdreressources'] . '</br>' ;
echo $_POST['idconstruction'] . '</br>' ;
echo $_POST['idplanete'] . '</br>' ;
*/

//Vérifier propriétaire de la construction.  
$reqproprietaireordreconstruction = $bd->prepare('SELECT * FROM c_construction WHERE idconst = ?');
$reqproprietaireordreconstruction->execute(array($_POST['idconstruction']));
$repproprietaireordreconstruction = $reqproprietaireordreconstruction->fetch();

$reqordredeconstruction = $bd->prepare('UPDATE c_construction SET ordredeconstruction = ? WHERE idconst = ?');

if ($repproprietaireordreconstruction['idplaneteconst'] != $_POST['idplanete'])
    {
    header('Location: ../accueil.php'); exit();
    }

if ($_GET['action'] == 'annuler') 
    {
    if ($repproprietaireordreconstruction['trucaconstruire'] > 0)
        { // On est ici en train de gérer les items classique, et si on a consommé quelque chose, alors on le rends.
        $reqinfoitem = $bd->prepare('SELECT itemnecessaire FROM a_items WHERE iditem = ?');
        $reqinfoitem->execute(array($repproprietaireordreconstruction['trucaconstruire'])); 
        $repinfoitem = $reqinfoitem->fetch();
        $nummessage = 14;
        }
    elseif ($repproprietaireordreconstruction['trucaconstruire'] < 0)
        { // On est ici en train de gérer les vaisseaux
        if (!isset($_POST['perdreressources']))
            { // Cette partie force à cocher la case pour annuler un vaisseau.
            $repproprietaireordreconstruction['avancementbiens'] = -1;
            }
        $nummessage = 62;
        $repinfoitem['itemnecessaire'] = 0;
        }

    // Si pas d'avancement ou si on a coché la case on supprime tout.
    if (($repproprietaireordreconstruction['avancementbiens'] == $repproprietaireordreconstruction['prixbiens'] AND $repproprietaireordreconstruction['avancementtitane'] == $repproprietaireordreconstruction['prixtitane']) OR isset($_POST['perdreressources']))
        {
        $nbitemrembourses = $repproprietaireordreconstruction['nombre'];
        $nummessage = 13;
        $erqdeleteconst = $bd->prepare("DELETE FROM c_construction WHERE idconst = :idconst");
        $erqdeleteconst->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
        $erqdeleteconst->execute();
        }  
    else
        {// Si avancé et pas coché, alors on ne laisse qu'une seule construction et on renvoie vers la page avec un message d'alerte.
        $nbitemrembourses = $repproprietaireordreconstruction['nombre']-1;
        $stmt = $bd->prepare("UPDATE c_construction SET nombre = 1 WHERE idconst = :idconst");
        $stmt->bindParam(':idconst', $_POST['idconstruction'], PDO::PARAM_INT);
        $stmt->execute();
        }
    consommercreeritemsplanetemultiple(0, $repinfoitem['itemnecessaire'], $_POST['idplanete'], $nbitemrembourses);
    header("location: ../planete.php?message=" . urlencode($nummessage) . "&id=" . urlencode($_POST['idplanete']));
    exit();
    } // Fin annulation de la construction.

elseif ($_GET['action'] == 'deprioriser')
    { // Cela permet d'envoyer la construction en tout dernier de la liste.
    $reqderniereconst = $bd->query('SELECT ordredeconstruction FROM c_construction ORDER BY ordredeconstruction DESC LIMIT 1');
    $repderniereconst = $reqderniereconst->fetch();

    $reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $_POST['idconstruction']));
    header("location: ../planete.php?message=57&id=" . urlencode($_POST['idplanete']));
    exit(); 
    }

elseif ($_GET['action'] == 'prioriser')
    { // Cela permet d'envoyer la construction en tout premier de la liste
    $reqpremiereconst = $bd->prepare('SELECT ordredeconstruction, idconst FROM c_construction WHERE idplaneteconst = ? ORDER BY ordredeconstruction ASC LIMIT 1');
    $reqpremiereconst->execute(array($_POST['idplanete']));
    $reppremiereconst = $reqpremiereconst->fetch();
    
    $reqordredeconstruction->execute(array($reppremiereconst['ordredeconstruction'], $_POST['idconstruction']));
    $reqordredeconstruction->execute(array($repproprietaireordreconstruction['ordredeconstruction'], $reppremiereconst['idconst']));

    header("location: ../planete.php?message=77&id=" . urlencode($_POST['idplanete']));
    exit(); 
    }

elseif ($_GET['action'] == 'pause')
    { // Cela permet d'envoyer la construction en tout dernier de la liste.
    $reqordredeconstruction->execute(array(0, $_POST['idconstruction']));
    header("location: ../planete.php?message=58&id=" . urlencode($_POST['idplanete']));
    exit(); 
    }

elseif ($_GET['action'] == 'reprise')
    { // Cela permet d'envoyer la construction en tout dernier de la liste.
    $reqderniereconst = $bd->query('SELECT ordredeconstruction FROM c_construction ORDER BY ordredeconstruction DESC LIMIT 1');
    $repderniereconst = $reqderniereconst->fetch();

    $reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $_POST['idconstruction']));
    header("location: ../planete.php?message=59&id=" . urlencode($_POST['idplanete']));
    exit(); 
    }

header("location: ../planete.php?message=31&id=" . urlencode($_POST['idplanete']));
?>