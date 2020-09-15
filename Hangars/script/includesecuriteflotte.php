<?php 
// Vérifier propriétaire du vaisseau.
$reqflotte = $bd->prepare(' SELECT *
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
?>