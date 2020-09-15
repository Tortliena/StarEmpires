<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerasteroides = $bd->prepare('INSERT INTO c_champsasteroides (xaste, yaste, uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)'); 
$reqplanete = $bd->prepare('SELECT idplanete FROM c_planete WHERE universplanete = ? AND xplanete = ? AND yplanete = ?');

$reqquantiteasteroides = $bd->prepare('SELECT sum(quantite) as total FROM c_champsasteroides WHERE uniaste = ?');
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