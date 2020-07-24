<?php 
session_start(); 
include("../include/BDDconnection.php"); 

/*
echo $_SESSION['id'] . ' id du joueur </br>'; 
echo $_POST['idvaisseau'].' id du vaisseau  </br>' ; 
echo $_POST['nombre'].' nombre de composant à ajouter  </br>' ; 
echo $_POST['iditem'].' id du composant à ajouter  </br>' ; 
*/

if (isset($_POST['idvaisseau'])) 
    {
    $idvaisseau = $_POST['idvaisseau']; 

    $reqvaisseau = $bdg->prepare('SELECT idflottevaisseau FROM vaisseau WHERE idvaisseau = ?'); 
    $reqvaisseau->execute(array($_POST['idvaisseau'])); 
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idflottevaisseau']>0) // Cas d'un vaisseau réel dans une flotte classique.
        {
        $reqidjoueurdelaflotte = $bdg->prepare('SELECT p.idjoueurplanete FROM flotte f INNER JOIN planete p ON p.idplanete = f.idplaneteflotte WHERE f.idflotte = ?'); 
        $reqidjoueurdelaflotte->execute(array($repvaisseau['idflottevaisseau'])); 
        $repidjoueurdelaflotte = $reqidjoueurdelaflotte ->fetch();

        $idjoueur = $repidjoueurdelaflotte['idjoueurplanete']; 
        }
    elseif ($repvaisseau['idflottevaisseau']<0) // Cas d'un plan, et idflotte = id du joueur.
        {
        $idjoueur = -$repvaisseau['idflottevaisseau'];       
        }

    if ($idjoueur != $_SESSION['id'])
        { // vérification que le vaisseau appartient bien au joueur.
        header('Location: ../conception.php?message=31'); 
        exit();
        }

    if ($_POST['nombre'] > 0) // Correspond à ajouter un composant
        {
        $reqcomposant = $bdd ->prepare('SELECT typecomposant FROM composant WHERE idcomposant = ?');
        $reqcomposant->execute(array($_POST['iditem'])); 
        $repcomposant = $reqcomposant->fetch(); 

        // Dans ce cas, insérer le composant dans le vaisseau :
        $reqcreercomposantdesign = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 
        for ($i = 1; $i <= $_POST['nombre']; $i++)
            { 
            $reqcreercomposantdesign->execute(array(-$_POST['idvaisseau'], $_POST['iditem'], $repcomposant['typecomposant']));
            $message = 65; 
            }
        }
    elseif ($_POST['nombre'] < 0) // Correspond à supprimer des composants
        {
        // récupérer la structure prise par les composants 
        $reqsupprimercomposant = $bdg->prepare('DELETE FROM composantvaisseau WHERE iditemcomposant = ? AND idvaisseaucompo = ? LIMIT 1');
        
        $nombredeboucle = -$_POST['nombre'];
        for ($i = 1; $i <= $nombredeboucle; $i++) 
            {
            $reqsupprimercomposant->execute(array($_POST['iditem'], -$_POST['idvaisseau'])); 
            $message = 65; 
            }
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
    $reqcreerdesign = $bdg->prepare('INSERT INTO vaisseau (idflottevaisseau, nomvaisseau) VALUES (?, ?)');
    $reqcreerdesign->execute(array(-$_SESSION['id'], $_POST['nom'])); 
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
    $message = 55;
    $idvaisseau = $dernierID;
    }
include("../function/caracteristiquesvaisseau.php");
caracteristiquesvaisseau ($idvaisseau, $_SESSION['id']);


if ($repvaisseau['idflottevaisseau']>0) // Cas d'un vaisseau réel dans une flotte classique.
    {
    header("Location: ../vaisseau.php?message=".urlencode($message)."&id=" . urlencode($idvaisseau));
    }
else
    {
    header("Location: ../conception.php?message=".urlencode($message)."&id=" . urlencode($idvaisseau));
    }
?>