<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerstation = $bd->prepare('INSERT INTO c_station (nomstation, xstation, ystation, universstation, idjoueurstation) VALUES (?,?,?,?,?);');
// récupérer le num du tour ($touractuel['id']) 
$reqtouractuel = $bd->query('SELECT id FROM c_tour ORDER BY id DESC LIMIT 1'); 
$touractuel = $reqtouractuel->fetch(); 
if ($touractuel['id'] == 1)
    {
    $pseudo = 'Galdonia';
    $pass_hache = password_hash('travian88', PASSWORD_DEFAULT);
    $requtilisateur = $bd->prepare('INSERT INTO c_utilisateurs(pseudo, motdepasse, dateinscription, niveauadmin) VALUES(:pseudo, :pass, CURDATE(), :niveauadmin)');
    $requtilisateur->execute(array(
        'pseudo' => $pseudo,
        'pass' => $pass_hache,
        'niveauadmin' => 1));
    $dernierIDjoueur = $bd->lastInsertId();

    $reqcreerstation->execute(array('Ydillia', 10, 10, -2, $dernierIDjoueur));
    }
?>