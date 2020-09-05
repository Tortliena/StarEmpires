<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqplanete = $bd->prepare('SELECT idplanete FROM c_planete WHERE universplanete = ? AND xplanete = ? AND yplanete = ?');
$reqcreerplanete = $bd->prepare('INSERT INTO c_planete( nomplanete, xplanete, yplanete, universplanete, idjoueurplanete,
                                                        biens, titane, taille, lune, organisation, efficacite, environnement)
                                        VALUES (?,?,?,?,?,?,?,?,?,?,?,?);');
$reqcompterplanete = $bd->prepare('SELECT COUNT(idplanete) AS nb FROM c_planete WHERE universplanete = ?');
$reqcompterplanete->execute(array(-2));
$repcompterplanete =$reqcompterplanete->fetch();
if ($repcompterplanete['nb'] < 50 OR !isset($repcompterplanete['nb']))
    {
    $xymax = 20;
    $x = rand(1, $xymax);
    $y = rand(1, $xymax);
    
    $reqplanete->execute(array(-2, $x, $y));
    $repplanete =$reqplanete->fetch();
    if (!isset($repplanete['idplanete']))
        {
        $taille = rand(3,6);
        $lune = rand(0,3);
        $nom = generateurdenom(10);
        $environnement = rand(-2500,500);

        $reqcreerplanete->execute(array($nom, $x, $y, -2, 0, 10, 0, $taille, $lune, 10, 0, $environnement));
        }
    }
?>