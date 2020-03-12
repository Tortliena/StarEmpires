<?php
session_start();
include("../include/BDDconnection.php");
include("../function/consommercreeritemsplanetemultiple.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['combien'] . '</br>';
echo $_POST['trucaconstruire'] . '</br>';
echo $_POST['id'] . '</br>';
*/

$reqcreerconstruction = $bdg->prepare('INSERT INTO construction(trucaconstruire, nombre, idplaneteconst, avancementbiens, avancementtitane, prixbiens, prixtitane) VALUES(:trucaconstruire, :nombre, :idplaneteconst, :avancementbiens, :avancementtitane, :prixbiens, :prixtitane)');
$reqinfoitem = $bdd->prepare('SELECT coutbien, couttitane, itemnecessaire, nomlimite FROM items WHERE iditem = ?');

//Vérifier que la quantité est correcte. 
    if (empty($_POST['combien']) or $_POST['combien'] == NULL or $_POST['combien'] < 1 )
        {
        header("Location: ../planete.php?message=11&id=" . urlencode($_POST['id']));
        exit();  
        }

// Une fois la vérification faite, lancer le production.
    elseif ($_POST['trucaconstruire'] > 0)
        { // Cas des productions classiques (batiments, composants, autre)
        // récupérer les informations liée à la prod en cours. 
        $reqinfoitem->execute(array($_POST['trucaconstruire'])); 
        $repinfoitem = $reqinfoitem->fetch(); 

	    if (isset($repinfoitem['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments.
	        {
	        $reqlimite = $bdg->prepare('SELECT '.$repinfoitem['nomlimite'].' FROM limiteplanete WHERE idlimiteplanete = ?');
	        $reqlimite->execute(array($_POST['id']));
	        $replimite = $reqlimite->fetch(); // $replimite['0']

	        $reqcomptechantier = $bdg->prepare('SELECT COUNT(idbat) as nb FROM batiment WHERE typebat = ? AND idplanetebat = ?');
	        $reqcomptechantier->execute(array($_POST['trucaconstruire'], $_POST['id']));
	        $repcomptechantier = $reqcomptechantier->fetch();  // $repcomptechantier['nb']

	        $constencours = 0; //Permet de récupérer le nombre de construction en cours.
	        $reqconstructionencours = $bdg->prepare('SELECT nombre FROM construction WHERE trucaconstruire = ? AND idplaneteconst = ?');
	        $reqconstructionencours->execute(array($_POST['trucaconstruire'], $_POST['id']));
	        while($repconstructionencours=$reqconstructionencours->fetch())
	        	{
	        	$constencours = $constencours + $repconstructionencours['nombre'];
	        	}

	        if ($replimite['0'] < $repcomptechantier['nb'] + $_POST['combien'] + $constencours)
	            {
	            $_SESSION['message1'] = $replimite['0'];
	            $_SESSION['message2'] = $repcomptechantier['nb'];
                header("Location: ../planete.php?message=29&id=" . urlencode($_POST['id']));
	            exit();  
	            }
	        }

        if ($repinfoitem['itemnecessaire'] > 1)
            { // Cas ou l'on a besoin d'un item en stock pour faire cette construction
            $reqverifsilo = $bdg->prepare('SELECT quantite FROM silo WHERE idplanetesilo = ? AND iditems = ?');
            $reqverifsilo->execute(array($_POST['id'], $repinfoitem['itemnecessaire']));
            $repverifsilo = $reqverifsilo->fetch();       
            if ($repverifsilo['quantite']<$_POST['combien'])
                { // Vous n'avez pas assez en stock pour faire autant de construction !
                header("Location: ../planete.php?message=28&id=" . urlencode($_POST['id'])); 
                exit();
                }
            else
                { // On a du stock, donc on le consomme.
<<<<<<< HEAD
=======
                include("../function/consommercreeritemsplanetemultiple.php");
>>>>>>> master
                consommercreeritemsplanetemultiple($repinfoitem['itemnecessaire'], 0, $_POST['id'], $_POST['combien']);
                }
            }
        // Permet de gérer le message de construction. 
        $reqtransformernom = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
        $reqtransformernom ->execute(array($_POST['trucaconstruire']));
        $reptransformernom  = $reqtransformernom ->fetch();
        }

    elseif ($_POST['trucaconstruire'] < 0)
        { // Cas d'un vaisseau spatial
        $reqinfovaisseau = $bdg->prepare('SELECT nomvaisseau, idvaisseau FROM vaisseau WHERE idvaisseau = ? AND idjoueurvaisseau = ?');
        $reqinfovaisseau->execute(array(-$_POST['trucaconstruire'], -$_SESSION['id']));
        $repinfovaisseau = $reqinfovaisseau->fetch();  

        if (!isset($repinfovaisseau['nomvaisseau']))
            { // Vérifier idjoueur et idvaisseau : Virer si pas bon ensemble.
            header("Location: ../planete.php?message=31&id=" . urlencode($_POST['id']));
            exit();
            }
    	
		$a = 0;
		$reqcomposantpresent = $bdg->prepare('SELECT c.iditemcomposant, s.quantite FROM composantvaisseau c LEFT JOIN silo s ON s.iditems = c.iditemcomposant AND s.idplanetesilo = ? WHERE c.idvaisseaucompo = ?');

		$reqcomposantpresent->execute(array($_POST['id'], -$_POST['trucaconstruire']));
		while($repcomposantpresent = $reqcomposantpresent->fetch())
			{
			if (!isset($repcomposantpresent['quantite']))
				{ // Partie avec les trucs non présent dans le silo
				$a++;
				$reqinfoitem->execute(array($repcomposantpresent['iditemcomposant'])); 
		        $repinfoitem = $reqinfoitem->fetch(); 

		        if ($repinfoitem['itemnecessaire']!=0)
		        		{ // Item 'constructible'' par recherche.
						header("Location: ../planete.php?message=31&id=" . urlencode($_POST['id']));
					    exit();
					    }
				 $reqcreerconstruction->execute(array(
		        'trucaconstruire' => $repcomposantpresent['iditemcomposant'],
		        'nombre' => 1,
		        'idplaneteconst' => $_POST['id'],
		        'avancementbiens' => $repinfoitem['coutbien'],
		        'avancementtitane' => $repinfoitem['couttitane'], 
		        'prixbiens' => $repinfoitem['coutbien'],
		        'prixtitane' => $repinfoitem['couttitane']));
				}
			else
				{ // Partie présent dans le silo.
				}
			}

		if ($a != 0)
			{
			header("Location: ../planete.php?message=61&id=" . urlencode($_POST['id']));
		    exit();
		    }
		
		$reqcomposantpresent->execute(array($_POST['id'], -$_POST['trucaconstruire']));
		while($repcomposantpresent = $reqcomposantpresent->fetch())
			{ // On refait le tour, mais cette fois, on sait que tout est dans les stocks.
			consommercreeritemsplanetemultiple($repcomposantpresent['iditemcomposant'], 0, $_POST['id'], 1);
			}
      	// Si on a tout les équipements en stock :    
	    $repinfoitem['coutbien'] = 50;
	    $repinfoitem['couttitane'] = 0;
	    $reptransformernom['nombatiment'] = $repinfovaisseau['nomvaisseau'];
    	}

    $reqcreerconstruction->execute(array(
        'trucaconstruire' => $_POST['trucaconstruire'],
        'nombre' => $_POST['combien'],
        'idplaneteconst' => $_POST['id'],
        'avancementbiens' => $repinfoitem['coutbien'],
        'avancementtitane' => $repinfoitem['couttitane'], 
        'prixbiens' => $repinfoitem['coutbien'],
        'prixtitane' => $repinfoitem['couttitane']));

    // Permet de gérer l'ordre de construction.
    $dernierID = $bdg->lastInsertId();
    $reqderniereconst = $bdg->query('SELECT ordredeconstruction FROM construction ORDER BY ordredeconstruction DESC LIMIT 1');
    $repderniereconst = $reqderniereconst ->fetch();
    $reqordredeconstruction = $bdg->prepare('UPDATE construction SET ordredeconstruction = ? WHERE idconst = ?');
    $reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $dernierID));

	$_SESSION['message1'] = $_POST['combien'];
	$_SESSION['message2'] = $reptransformernom['nombatiment'];
   
	header("Location: ../planete.php?message=12&id=" . urlencode($_POST['id'])); 
	exit(); 
        
header("Location: ../planete.php?message=31&id=" . urlencode($_POST['id']));
?>