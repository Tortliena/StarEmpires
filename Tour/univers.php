<?php
/*
session_start();
require __DIR__ . '/../include/BDDconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerplanete = $bdg->prepare('INSERT INTO planete (
    nomplanete, xplanete, yplanete, universplanete, idjoueurplanete,
    biens, titane, taille, lune, organisation, efficacite)
    VALUES (?,?,?,?,?,?,?,?,?,?,?);');

$reqcompterplanete = $bdg->prepare('SELECT COUNT(idplanete) AS nb FROM planete WHERE universplanete = ?');

$reqcreerstation = $bdg->prepare('INSERT INTO station (nomstation, xstation, ystation, universstation, idjoueurstation) VALUES (?,?,?,?,?);');

$reqcreerasteroides = $bda->prepare('INSERT INTO champsasteroides (xaste, yaste, uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)'); 

$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE universplanete = ? AND xplanete = ? AND yplanete = ?');

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

// Requête pour mettre les flottes vides sur les planètes mères.
disparitionflotte()
?>