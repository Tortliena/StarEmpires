<?php 
session_start(); 
require __DIR__ . '/../../include/bddconnection.php'; 
require __DIR__ . '/../../function/variable.php';
require __DIR__ . '/../../function/retirerajouteritemsflottemultiple.php';
require __DIR__ . '/../fonction/flotte.php';
require __DIR__ . '/includesecuriteflotte.php';
/*
echo $_SESSION['pseudo'] . ' Pseudo du joueur </br>' ; 
echo $_SESSION['id'] . ' id du joueur </br>' ; 
echo $_POST['idflotte'] . ' id de la flotte </br>'; 
echo $_POST['idstation'] . ' id de la station</br>'; 
echo $_POST['iditem'] . ' id des items à vendre</br>'; 
echo $_POST['combien'] . ' nombre des items à vendre</br>';
echo $_POST['typetransaction'] . ' 1 = vendre, 2 = acheter';
*/

$reqcrediterjoueur = $bd->prepare('UPDATE c_utilisateurs SET creditgalactique = creditgalactique + ? WHERE id = ?');
$reqmessageinterne = $bd->prepare('INSERT INTO c_messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 

// Trouver si la station est à portée : 
$reqstation = $bd->prepare('SELECT idstation FROM c_station WHERE xstation = ? AND ystation = ? AND universstation = ? AND idstation = ?'); 
$reqstation->execute(array($repflotte['xflotte'], $repflotte['yflotte'], $repflotte['universflotte'], $_POST['idstation'])); 
$repstation = $reqstation->fetch();

if (!isset($repstation['idstation']) OR $repflotte['idjoueurplanete'] != $_SESSION['id'] OR $_POST['combien'] < 1)
    {
    header('Location: ../accueil.php?message=31');
    exit();
    }

if ($_POST['typetransaction'] == 1)
    { // DÉBUT PARTIE VENTE
    // Vérifier les quantités 
    $reqverifcargo = $bd->prepare(" SELECT SUM(c.quantiteitems) as nb
                                    FROM c_vaisseau v
                                    LEFT JOIN c_cargovaisseau c ON c.idvaisseaucargo  = v.idvaisseau
                                    INNER JOIN a_items i ON i.iditem = c.typeitems
                                    WHERE v.idflottevaisseau = ? AND i.iditem = ?");
    $reqverifcargo->execute(array($repflotte['idflotte'], $_POST['iditem'])); 
    $repverifcargo = $reqverifcargo->fetch();
    if ($repverifcargo['nb'] < $_POST['combien'])
        {
        header('Location: ../accueil.php?message=31');
        exit();
        }

    if ($_POST['iditem'] == 8)
        {
        $nom = 'débris de métaux rares';
        $prixparunite = variable(3);     
        }
    elseif ($_POST['iditem'] == 26)
        {
        $nom = 'titane en barres';
        $prixparunite = variable(7);     
        }
    elseif ($_POST['iditem'] == 41)
        {
        $nom = 'neutrinos en barre';
        $prixparunite = variable(10);     
        }

    $prix = $_POST['combien'] * $prixparunite; 
    $message = 'Un vaisseau vient de vendre ' . $_POST['combien'] . ' ' . $nom . ' pour '.$prix.'$.';   
    retirerajouteritemsflottemultiple($_POST['iditem'], 0, $_POST['idflotte'], $_POST['combien']);
    $reqmessageinterne->execute(array('Ministère de l\'économie', $repflotte['idjoueurplanete'], 0, 'Vente galactique', $message));
    $idmessage = 72; 
    } // FIN PARTIE VENTE


if ($_POST['typetransaction'] == 2)
    { // DÉBUT PARTIE ACHAT
    $souteflotte = souteflotte($_POST['idflotte']);
    $quantitetransportee = cargaisonflotte($_POST['idflotte']);

    if ($souteflotte - $quantitetransportee < $_POST['combien'])
        {
        header('Location: ../accueil.php?message=31');
        exit();
        }

    if ($_POST['iditem'] == 25)
        {
        $nom = 'Noyaux à sub-tachyons';
        $prixparunite = variable(4);     
        }
    
    $prix = -$_POST['combien'] * $prixparunite[0]; 
    $message = 'Un vaisseau vient d\'acheter ' . $_POST['combien'] . ' ' . $nom . ' pour '.$prix.'$.';

    retirerajouteritemsflottemultiple(0, $_POST['iditem'], $_POST['idflotte'], $_POST['combien']);
    $reqmessageinterne->execute(array('Ministère de l\'économie', $repflotte['idjoueurplanete'], 0, 'Achat galactique', $message)); 
    $idmessage = 73;
    }

// Commun partie vente et achat.
if (isset($message))
    {
    $reqcrediterjoueur->execute(array($prix, $_SESSION['id']));
    header("location: ../hangars.php?message=" . urlencode($idmessage) . "&id=" . urlencode($_POST['idflotte']));
    exit();
    }

header("Location: ../hangars.php?id=" . urlencode($_POST['idflotte']));
?>