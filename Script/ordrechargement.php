<?php 
session_start(); 
require __DIR__ . '/../include/BDDconnection.php'; 
require __DIR__ . '/../function/consommercreeritemsplanetemultiple.php';

/* 
echo $_SESSION['pseudo'] . '</br>';
echo $_SESSION['id'] . '</br>';
echo $_POST['idflotte'] . '</br>';
*/

// Vérifier propriétaire du vaisseau.
$reqflotte = $bdg->prepare('    SELECT p.idjoueurplanete, f.universflotte,
                                f.xflotte, f.yflotte, f.idflotte
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

// Trouver si une planète du joueur est à proximité : 
$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? AND idjoueurplanete = ?'); 
$reqplanete->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte'], $repflotte['idjoueurplanete'])); 
$repplanete = $reqplanete->fetch(); 

$reqverifcargo = $bdd->prepare("    SELECT  v.idvaisseau, c.typeitems, c.quantiteitems, i.nombatiment
                                    FROM gamer.vaisseau v
                                    LEFT JOIN gamer.cargovaisseau c ON c.idvaisseaucargo  = v.idvaisseau
                                    INNER JOIN items i ON i.iditem = c.typeitems
                                    WHERE v.idflottevaisseau = ?");

$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 

$reqsupcargaisonvaisseau = $bdg->prepare('DELETE c FROM cargovaisseau c INNER JOIN vaisseau v ON c.idvaisseaucargo  = v.idvaisseau WHERE v.idflottevaisseau = ?'); 

if (isset($repplanete['idplanete'])) 
    {
    $message = 'Un vaisseau vient de livrer';
    // récupérer les infos du cargo 
    $reqverifcargo->execute(array($repflotte['idflotte'])); 
    while ($repverifcargo = $reqverifcargo->fetch()) 
        { 
        consommercreeritemsplanetemultiple(0, $repverifcargo['typeitems'], $repplanete['idplanete'], $repverifcargo['quantiteitems']); 
        $message = $message .' ' . $repverifcargo['quantiteitems'] . ' ' . $repverifcargo['nombatiment'] . ',';     
        } 
    $message = substr_replace($message, '.', -1, 1); 
    }

if (isset($message))
    {
    $reqsupcargaisonvaisseau->execute(array($repflotte['idflotte'])); 
    $reqmessageinterne->execute(array('Ministère de l\'économie', $repflotte['idjoueurplanete'], 0, 'Livraison de marchandise', $message)); 
    header("location: ../hangars.php?message=71&id=" . urlencode($_POST['idflotte']));
    exit();
    }

header("Location: ../hangars.php?id=" . urlencode($_POST['idflotte']));
?>