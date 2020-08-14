<?php
/*
session_start();
require __DIR__ . '/../include/BDDconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerstation = $bdg->prepare('INSERT INTO station (nomstation, xstation, ystation, universstation, idjoueurstation) VALUES (?,?,?,?,?);');
// récupérer le num du tour ($touractuel['id']) 
$reqtouractuel = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1'); 
$touractuel = $reqtouractuel->fetch(); 
if ($touractuel['id'] == 1)
    {
    $pseudo = 'Galdonia';
    $pass_hache = password_hash('travian88', PASSWORD_DEFAULT);
    $requtilisateur = $bdg->prepare('INSERT INTO utilisateurs(pseudo, motdepasse, dateinscription, niveauadmin) VALUES(:pseudo, :pass, CURDATE(), :niveauadmin)');
    $requtilisateur->execute(array(
        'pseudo' => $pseudo,
        'pass' => $pass_hache,
        'niveauadmin' => 1));
    $dernierIDjoueur = $bdg->lastInsertId();

    $reqcreerstation->execute(array('Ydillia', 10, 10, -2, $dernierIDjoueur));
    }
?>