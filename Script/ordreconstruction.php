<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['combien'] . '</br>';
echo $_POST['trucaconstruire'] . '</br>';
echo $_POST['id'] . '</br>';
*/

//Vérifier que la quantité est correcte. 
    if (empty($_POST['combien']) or $_POST['combien'] == NULL or $_POST['combien'] < 1 )
        {
        header('Location: ../chantier.php?message=11');
        exit();  
        }

// Une fois la vérification faite, lancer le production.
    else
        {
        // récupérer les informations liée à la prod en cours. 
        $reqinfoitem = $bdd->prepare('SELECT coutbien, couttitane, itemnecessaire, nomlimite FROM items WHERE iditem = ?');
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
	            header('Location: ../chantier.php?message=29');
	            exit();  
	            }
	        }

        if ($repinfoitem['itemnecessaire'] > 1)
            { // Cas ou l'on a besoin d'un item en stock pour faire cette construction
            $reqverifsilo = $bdg->prepare('SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?');
            $reqverifsilo->execute(array($_SESSION['id'], $repinfoitem['itemnecessaire']));
            $repverifsilo = $reqverifsilo->fetch();       
            // $repverifsilo['quantite'] = quantité dans les stocks necessaire pour la construction. 

            $constencours = 0; //Permet de récupérer le nombre de construction en cours utilisant l'item étudié.
	        $reqconstructionencours = $bdg->prepare('SELECT nombre FROM construction WHERE trucaconstruire = ? AND idjoueurconst = ?');
	        $reqconstructionencours->execute(array($_POST['trucaconstruire'], $_SESSION['id']));
	        while($repconstructionencours=$reqconstructionencours->fetch())
	        	{
	        	$constencours = $constencours + $repconstructionencours['nombre'];
	        	}

            if ($repverifsilo['quantite']<$_POST['combien']+$constencours)
                { // Vous n'avez pas assez en stock pour faire autant de construction !
                header("Location: ../planete.php?message=28&id=" . urlencode($_POST['id'])); 
                exit();  
                }
            }
            
        $reqcreerconstruction = $bdg->prepare('INSERT INTO construction(trucaconstruire, nombre, idplaneteconst, avancementbiens, avancementtitane, prixbiens, prixtitane) VALUES(:trucaconstruire, :nombre, :idplaneteconst, :avancementbiens, :avancementtitane, :prixbiens, :prixtitane)');
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

        // Permet de gérer le message de construction. 
		$reqtransformernom = $bdd->prepare('SELECT nombatiment FROM items WHERE iditem = ?');
		$reqtransformernom ->execute(array($_POST['trucaconstruire']));
		$reptransformernom  = $reqtransformernom ->fetch();
		$_SESSION['message1'] = $_POST['combien'];
		$_SESSION['message2'] = $reptransformernom['nombatiment'];
        
        header("Location: ../planete.php?message=12&id=" . urlencode($_POST['id'])); 
		exit(); 
        }
header("Location: ../planete.php?message=31&id=" . urlencode($_POST['id']));
?>