<?php 
session_start(); 
require __DIR__ . '/../include/bddconnection.php'; 
require __DIR__ . '/../function/consommercreeritemsplanetemultiple.php';
require __DIR__ . '/../function/retirerajouteritemsflottemultiple.php';
require __DIR__ . '/../function/flotte.php';

echo $_SESSION['id'] . ' id du joueur </br>';
echo $_POST['idflotte'] . ' id de la flotte</br>';
echo $_POST['iditem'] . ' id des items </br>';
echo $_POST['nombre'] . ' nombre d\'item a (de)charger</br>';
echo $_POST['typeechange'] . ' type d\'ordre</br>'; //1 = chargement, 2 = déchargement

$souteflotte = souteflotte($_POST['idflotte']);
$quantitetransportee = cargaisonflotte($_POST['idflotte']);

// Vérifier propriétaire du vaisseau.
$reqflotte = $bd->prepare(' SELECT p.idjoueurplanete, f.universflotte, f.xflotte, f.yflotte, f.idflotte
                            FROM c_flotte f
                            INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                            WHERE f.idflotte = ?');

$reqflotte->execute(array($_POST['idflotte']));
$repflotte = $reqflotte->fetch();

if ($repflotte['idjoueurplanete'] != $_SESSION['id'])
    {
    header('Location: ../accueil.php?message=31');
    exit();
    }

// Trouver si une planète du joueur est à proximité : 
$reqplanete = $bd->prepare('SELECT idplanete FROM c_planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? AND idjoueurplanete = ?'); 
$reqplanete->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte'], $repflotte['idjoueurplanete'])); 
$repplanete = $reqplanete->fetch(); 
if (!isset($repplanete['idplanete']))
    {
    header('Location: ../accueil.php?message=31');
    exit();
    }

$reqmessageinterne = $bd->prepare('INSERT INTO c_messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 

if (isset($repplanete['idplanete'])) 
    { // La flotte se trouve bel et bien au dessus d'un planète lui appartenant.
    if ($_POST['typeechange'] == 2) // déchargement
        {
        // récupérer les infos du cargo 
        $reqverifcargo = $bd->prepare(" SELECT  v.idvaisseau, SUM(c.quantiteitems) AS nb, i.nombatiment
                                        FROM c_vaisseau v
                                        LEFT JOIN c_cargovaisseau c ON c.idvaisseaucargo  = v.idvaisseau
                                        INNER JOIN a_items i ON i.iditem = c.typeitems
                                        WHERE v.idflottevaisseau = ? AND c.typeitems = ?
                                        GROUP BY i.iditem");
        $reqverifcargo->execute(array($repflotte['idflotte'], $_POST['iditem'])); 
        $repverifcargo = $reqverifcargo->fetch();

        if ($repverifcargo['nb'] < $_POST['nombre'] OR $_POST['nombre'] < 1)
            {
            header('Location: ../accueil.php?message=31');
            exit();
            }
        consommercreeritemsplanetemultiple(0, $_POST['iditem'], $repplanete['idplanete'], $_POST['nombre']); 
        retirerajouteritemsflottemultiple($_POST['iditem'], 0, $_POST['idflotte'], $_POST['nombre']);

        $message = 'Un vaisseau vient de livrer';
        $message = $message .' ' . $repverifcargo['quantiteitems'] . ' ' . $repverifcargo['nombatiment'] . ',';     
        $message = substr_replace($message, '.', -1, 1);
        }
    if ($_POST['typeechange'] == 1) // Chargement
        {
        // Vérifier que c'est un produit et qu'il y en a assez sur la planète.
        $reqverifsilo = $bd->prepare(" SELECT s.iditems, s.quantite, i.nombatiment, i.typeitem
                                        FROM c_silo s
                                        INNER JOIN a_items i ON i.iditem = s.iditems  
                                        WHERE s.idplanetesilo = ? and s.iditems = ?");
        $reqverifsilo ->execute(array($repplanete['idplanete'], $_POST['iditem']));
        $repverifsilo = $reqverifsilo ->fetch();
        if ($repverifsilo['typeitem'] != 'produit' OR $_POST['nombre'] > $repverifsilo['quantite'] OR $_POST['nombre'] < 1 OR $souteflotte - $quantitetransportee < $_POST['nombre'])
            {
            header('Location: ../accueil.php?message=31');
            exit();
            }
        consommercreeritemsplanetemultiple($_POST['iditem'], 0, $repplanete['idplanete'], $_POST['nombre']); 
        retirerajouteritemsflottemultiple(0, $_POST['iditem'], $_POST['idflotte'], $_POST['nombre']);
        
        $message = 'Un vaisseau vient de prendre ';
        $message = $message .' ' . $repverifcargo['quantiteitems'] . ' ' . $repverifcargo['nombatiment'] . ',';     
        $message = substr_replace($message, '.', -1, 1); 
        }
    }

if (isset($message))
    {
    $reqmessageinterne->execute(array('Ministère de l\'économie', $repflotte['idjoueurplanete'], 0, 'Marchandises en transit', $message)); 
    header("location: ../hangars.php?message=71&id=" . urlencode($_POST['idflotte']));
    exit();
    }

header('Location: ../accueil.php?message=31');
?>