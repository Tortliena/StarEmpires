<?php
/*
session_start();
include("../include/BDDconnection.php");
include("fonctionsdutour.php");
*/
$reqcompterplanete = $bdg->prepare('SELECT COUNT(idplanete) AS nb FROM planete WHERE universplanete = ?');

$reqcreerplanete = $bdg->prepare('INSERT INTO planete (
    nomplanete, xplanete, yplanete, universplanete, idjoueurplanete,
    biens, titane, taille, lune, organisation, efficacite)
    VALUES (?,?,?,?,?,?,?,?,?,?,?);');

$reqcreerasteroides = $bda->prepare('INSERT INTO champsasteroides (xaste , yaste , uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)'); 

$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE universplanete = ? AND xplanete = ? AND yplanete = ?');

function random_1($car)
    {
    $string = "";
    $chaine = "abcdefghijklmnpqrstuvwxy";
    srand((double)microtime()*1000000);
    for($i=0; $i<$car; $i++)
        {
        $string .= $chaine[rand()%strlen($chaine)];
        }
    return $string;
    }

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
        $nom = random_1(10);
        
        $reqcreerplanete->execute(array($nom, $x, $y, -2, 0, 10, 0, $taille, $lune, 10, 0));
        }
    }

$reqquantiteasteroides = $bda->prepare('SELECT sum(quantite) as total FROM champsasteroides WHERE uniaste = ?');
$reqquantiteasteroides ->execute(array(-2));
$repquantiteasteroides = $reqquantiteasteroides->fetch();

if ($repquantiteasteroides['total'] < 200)
    {
    for ($i = 1; $i <= 5; $i++)
        {
        $xymax = 20;
        $x = rand(1, $xymax);
        $y = rand(1, $xymax);

        $reqplanete->execute(array(-2, $x, $y));
        $repplanete =$reqplanete->fetch();
        if (!isset($repplanete['idplanete']))
            {
            $ValeurPoid = array(1=>80, 2=>10, 3=>10, 4=>5); 
            $asteroidecree = nombrealeatoireavecpoid($ValeurPoid); 
            switch ($asteroidecree) 
                {  
                case 1: // Un peu de biens
                    $reqcreerasteroides->execute(array($x, $y, -2, 6, 3));
                break; 

                case 2: // Plein de biens. 
                    $reqcreerasteroides->execute(array($x, $y, -2, 6, 10)); 
                break; 

                case 3: // Chance de trouver un peu de biens et de titane. 
                    $reqcreerasteroides->execute(array($x, $y, -2, 6, 2)); 
                    $reqcreerasteroides->execute(array($x, $y, -2, 8, 3)); 
                break; 

                case 4: // Chance de trouver beaucoup de titane et un peu de biens. 
                    $reqcreerasteroides->execute(array($x, $y, -2, 6, 4)); 
                    $reqcreerasteroides->execute(array($x, $y, -2, 8, 10)); 
                break; 
                }
            }
        }
    }
?>