<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqplanete = $bd->prepare('SELECT idplanete FROM c_planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ?');
$reqstation = $bd->prepare('SELECT idstation FROM c_station WHERE xstation = ? AND ystation = ? AND universstation = ?');
$reqetoileaneutrons = $bd->prepare('SELECT idetoileneutrinos FROM c_etoileneutrinos WHERE xneutrinos = ? AND	yneutrinos = ? AND universneutrinos = ?');

$reqcreerplanete = $bd->prepare('INSERT INTO c_planete( nomplanete, xplanete, yplanete, universplanete, idjoueurplanete,
                                                        biens, titane, taille, lune, organisation, efficacite, environnement)
                                        VALUES (?,?,?,?,?,?,?,?,?,?,?,?);');
$reqcompterplanete = $bd->prepare('SELECT COUNT(idplanete) AS nb FROM c_planete WHERE universplanete = ?');

// GESTION UNIVERS 2 !
$reqcompterplanete->execute(array(-2));
$repcompterplanete = $reqcompterplanete->fetch();
if ($repcompterplanete['nb'] < 50 OR !isset($repcompterplanete['nb']))
    {
    $xymax = 20;
    $x = rand(1, $xymax);
    $y = rand(1, $xymax);
    
    $reqplanete->execute(array($x, $y, -2));
    $repplanete = $reqplanete->fetch();
    $reqstation->execute(array($x, $y, -2));
    $repstation = $reqstation->fetch();
    $reqetoileaneutrons->execute(array($x, $y, -2));
    $repetoileaneutrons = $reqetoileaneutrons->fetch();

    if (!isset($repplanete['idplanete']) AND !isset($repstation['idstation']) AND !isset($repetoileaneutrons['idetoileneutrinos']))
        {
        $taille = rand(3,6);
        $lune = rand(0,3);
        $nom = generateurdenom(10);
        $environnement = rand(-2500,500);

        $reqcreerplanete->execute(array($nom, $x, $y, -2, 0, 10, 0, $taille, $lune, 10, 0, $environnement));
        }
    }

// GESTION UNIVERS 3
$reqcompterplanete->execute(array(-3));
$repcompterplanete = $reqcompterplanete->fetch();
if ($repcompterplanete['nb'] < 30 OR !isset($repcompterplanete['nb']))
    {
    $xymax = 20;
    $x = rand(1, $xymax);
    $y = rand(1, $xymax);
    
    $reqplanete->execute(array($x, $y, -3));
    $repplanete = $reqplanete->fetch();
    $reqstation->execute(array($x, $y, -3));
    $repstation = $reqstation->fetch();
    $reqetoileaneutrons->execute(array($x, $y, -3));
    $repetoileaneutrons = $reqetoileaneutrons->fetch();

    if (!isset($repplanete['idplanete']) AND !isset($repstation['idstation']) AND !isset($repetoileaneutrons['idetoileneutrinos']))
        {
        $taille = rand(3,8);
        $lune = rand(0,4);
        $nom = generateurdenom(10);
        $environnement = rand(-3500,500);

        $reqcreerplanete->execute(array($nom, $x, $y, -3, 0, 10, 0, $taille, $lune, 10, 0, $environnement));
        }
    }
?>