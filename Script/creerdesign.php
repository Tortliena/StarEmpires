<?php 
session_start(); 
include("../include/BDDconnection.php"); 
 
/* 
echo $_SESSION['id'] . ' id du joueur </br>'; 
 
// Cas modification de vaisseau : 
echo $_POST['idvaisseau'].' id du vaisseau  </br>' ; 
echo $_POST['nombre'].' nombre de composant à ajouter  </br>' ; 
echo $_POST['iditem'].' id du composant à ajouter  </br>' ; 
*/ 
 
if (isset($_POST['idvaisseau'])) 
    { 
    $message = 65; // Composant ajouté. 
    $idvaisseau = $_POST['idvaisseau']; 
 
    $reqvaisseau = $bdg->prepare('SELECT structure from vaisseau WHERE idvaisseau = ? AND idjoueurvaisseau = ?'); 
    $reqvaisseau->execute(array($_POST['idvaisseau'], -$_SESSION['id'])); 
    $repvaisseau = $reqvaisseau->fetch(); 
 
    if (!isset($repvaisseau['structure'])) 
        { // Vérification du joueur/vaisseau. 
        header('Location: ../conception.php?message=31'); 
        exit(); 
        } 
 
    // récupérer la structure prise par les composants 
    $reqcomposant = $bdd ->prepare('SELECT i.souscategorie, i.typeitem, c.structure  
                                    FROM datawebsite.composant c 
                                    INNER JOIN datawebsite.items i ON c.idcomposant = i.iditem 
                                    WHERE c.idcomposant = ?'); 
    $reqcomposant->execute(array($_POST['iditem'])); 
    $repcomposant = $reqcomposant->fetch(); 
 
    if ($repvaisseau['structure'] + $repcomposant['structure']*$_POST['nombre'] > 0) 
        { // Si la nouvelle structure est négative/neutre, alors insérer sinon virer. 
        header("Location: ../conception.php?message=64&id=" . urlencode($idvaisseau)); 
        exit(); 
        } 
 
 
    $reqcreercomposantdesign = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 
 
    for ($i = 1; $i <= $_POST['nombre']; $i++) 
        { 
        $reqcreercomposantdesign->execute(array($_POST['idvaisseau'], $_POST['iditem'], $repcomposant['souscategorie']));  
        } 
    } 
 
else 
    { // Cas de création d'un plan. 
    if (is_numeric($_POST['nom']) OR empty($_POST['nom'])) 
        { 
        header('Location: ../conception.php?message=56'); 
        exit(); 
        } 
 
    // Créer design global. 
    $reqcreerdesign = $bdg->prepare('INSERT INTO vaisseau (idjoueurvaisseau, nomvaisseau, univers, x, y) VALUES (?, ?, ?, ?, ?)');  
    $reqcreerdesign->execute(array(-$_SESSION['id'], $_POST['nom'], 0, 0, 0)); 
    $dernierID = $bdg->lastInsertId(); 
 
    $reqcomposant = $bdd ->prepare('SELECT i.souscategorie, i.typeitem 
                                    FROM datawebsite.composant c 
                                    INNER JOIN datawebsite.items i ON c.idcomposant = i.iditem 
                                    WHERE c.idcomposant = ?'); 
    $reqcreercomposantdesign = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 
 
 
    foreach($_POST as $value) 
        { 
        if ($value > 0) 
            { 
            $reqcomposant->execute(array($value)); 
            $repcomposant = $reqcomposant->fetch(); 
            if ($repcomposant['typeitem'] != 'composant') 
                { 
                header('Location: ../accueil.php?message=31'); 
                exit(); 
                } 
 
            $reqcreercomposantdesign->execute(array($dernierID, $value, $repcomposant['souscategorie'])); 
            } 
        } 
 
    $reqdeplacementbloque = $bdg->prepare('INSERT INTO ordredeplacement (idvaisseaudeplacement, xdestination, ydestination, universdestination, idjoueurduvaisseau, typeordre, bloque) VALUES(?, ?, ?, ?, ?, ?, ?)'); 
    // 9 = ordre spécial pour les design. bloque = 2 = impossible de supprimer/modifier. 
    $reqdeplacementbloque->execute(array($dernierID, -1, -1, -1, $_SESSION['id'], 9, 2)); 
    $message = 55; 
    $idvaisseau = $dernierID; 
    } 
include("../function/caracteristiquesvaisseau.php"); 
caracteristiquesvaisesau ($idvaisseau, $_SESSION['id']); 
 
header("Location: ../conception.php?message=".urlencode($message)."&id=" . urlencode($idvaisseau)); 
?>