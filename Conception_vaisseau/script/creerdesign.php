<?php 
session_start(); 
include("../../include/bddconnection.php"); 

if (isset($_POST['remplacementcomposant']))
	{
	$toto = explode("_", $_POST['remplacementcomposant']);
	$_POST['iditem'] = $toto[0];
	$_POST['nombre'] = $toto[1];
	}

/*
echo $_SESSION['id'] . ' id du joueur </br>'; 
echo $_POST['idvaisseau'].' id du vaisseau  </br>' ; 
echo $_POST['nombre'].' nombre de composant à ajouter  </br>' ; 
echo $_POST['iditem'].' id du composant à ajouter  </br>' ; 
*/

if (isset($_POST['idvaisseau'])) 
    {
    $idvaisseau = $_POST['idvaisseau']; 

    $reqvaisseau = $bd->prepare('SELECT idflottevaisseau FROM c_vaisseau WHERE idvaisseau = ?'); 
    $reqvaisseau->execute(array($_POST['idvaisseau'])); 
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idflottevaisseau']>0) // Cas d'un vaisseau réel dans une flotte classique.
        {
        $reqidjoueurdelaflotte = $bd->prepare('SELECT p.idjoueurplanete FROM c_flotte f INNER JOIN c_planete p ON p.idplanete = -f.idplaneteflotte WHERE f.idflotte = ?'); 
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
        header('Location: ../../accueil.php?message=31');
        exit();
        }

   	$reqcomposant = $bd ->prepare('SELECT typecomposant FROM a_composant WHERE idcomposant = ?');
    $reqcomposant->execute(array($_POST['iditem'])); 
    $repcomposant = $reqcomposant->fetch(); 

    if ($_POST['nombre'] == 0) // Correspond à remplacer un composant dans le cas des moteurs/noyaux
    	{
    	if ($repcomposant['typecomposant'] == 'moteur' OR $repcomposant['typecomposant'] == 'noyau')
    		{
	        $reqsupprimermoteurounoyau = $bd->prepare('DELETE FROM c_composantvaisseau WHERE idvaisseaucompo = ? AND typecomposant = ?');
	        $reqsupprimermoteurounoyau->execute(array(-$_POST['idvaisseau'], $repcomposant['typecomposant']));
    		}
    	else
    		{
    		header('Location: ../../accueil.php?message=31');
    		}

    	$_POST['nombre']++; // Permet de passer par la case d'ajoute de composant peu après.
    	}

    if ($_POST['nombre'] >= 0) // Correspond à ajouter un composant
        {
        $reqcomposant = $bd ->prepare('SELECT typecomposant FROM a_composant WHERE idcomposant = ?');
        $reqcomposant->execute(array($_POST['iditem'])); 
        $repcomposant = $reqcomposant->fetch(); 

        // Dans ce cas, insérer le composant dans le vaisseau :
        $reqcreercomposantdesign = $bd->prepare('INSERT INTO c_composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)'); 
        for ($i = 1; $i <= $_POST['nombre']; $i++)
            { 
            $reqcreercomposantdesign->execute(array(-$_POST['idvaisseau'], $_POST['iditem'], $repcomposant['typecomposant']));
            $message = 65; 
            }
        }
    elseif ($_POST['nombre'] < 0) // Correspond à supprimer des composants
        {
        $reqsupprimercomposant = $bd->prepare('DELETE FROM c_composantvaisseau WHERE iditemcomposant = ? AND idvaisseaucompo = ? LIMIT 1');
        
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
    $reqcreerdesign = $bd->prepare('INSERT INTO c_vaisseau (idflottevaisseau, nomvaisseau) VALUES (?, ?)');
    $reqcreerdesign->execute(array(-$_SESSION['id'], $_POST['nom'])); 
    $dernierID = $bd->lastInsertId();

    $reqcomposant = $bd ->prepare(' SELECT i.souscategorie, i.typeitem FROM a_composant c 
                                    INNER JOIN a_items i ON c.idcomposant = i.iditem 
                                    WHERE c.idcomposant = ?');
    $reqcreercomposantdesign = $bd->prepare('INSERT INTO c_composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)');
 
    foreach($_POST as $value)
        {
        if ($value > 0)
            {
            $reqcomposant->execute(array($value));
            $repcomposant = $reqcomposant->fetch();
            if ($repcomposant['typeitem'] != 'composant')
                {
                header('Location: ../../accueil.php?message=31');
                exit();
                }
            $reqcreercomposantdesign->execute(array($dernierID, $value, $repcomposant['souscategorie']));
            }
        }
    $message = 55;
    $idvaisseau = $dernierID;
    }

if (isset($message))
	{
	include("../fonction/caracteristiquesvaisseau.php");
	caracteristiquesvaisseau($idvaisseau, $_SESSION['id']);

	if ($repvaisseau['idflottevaisseau']>0) // Cas d'un vaisseau réel dans une flotte classique.
	    {
	    header("Location: ../vaisseau.php?message=".urlencode($message)."&id=" . urlencode($idvaisseau));
	    }
	else
	    {
	    header("Location: ../conception.php?message=".urlencode($message)."&id=" . urlencode($idvaisseau));
	    }
	exit();
    }
header('Location: ../../accueil.php?message=31');
?>