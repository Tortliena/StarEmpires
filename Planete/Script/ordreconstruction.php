<?php 
session_start(); 
include("../../include/BDDconnection.php"); 
include("../../function/consommercreeritemsplanetemultiple.php"); 

/*
echo $_SESSION['id'] . '</br>' ; 
echo $_POST['combien'] . '</br>'; 
echo $_POST['trucaconstruire'] . '</br>'; 
echo $_POST['id'] . '</br>'; 
*/

$nummessage = 12; // Message par défaut en cas de construction lancée.

$reqcreerconstruction = $bdg->prepare('INSERT INTO construction(trucaconstruire, nombre, idplaneteconst, avancementbiens, avancementtitane, avancementneutrinos, prixbiens, prixtitane, prixneutrinos) VALUES(:trucaconstruire, :nombre, :idplaneteconst, :avancementbiens, :avancementtitane, :avancementneutrinos, :prixbiens, :prixtitane, :prixneutrinos)'); 
$reqinfoitem = $bdd->prepare('SELECT coutbien, couttitane, coutneutrinos, itemnecessaire, nomlimite, technescessaire FROM items WHERE iditem = ?'); 

$reqverifiertechnologie = $bdg->prepare('SELECT idrechprinc FROM rech_joueur WHERE idjoueurrecherche = ? AND idrech = ? AND rechposs = 1');

//Vérifier que la quantité est correcte.  
    if (empty($_POST['combien']) or $_POST['combien'] == NULL or $_POST['combien'] < 1 ) 
        { 
        header("Location: ../00_planete.php?message=11&id=" . urlencode($_POST['id'])); 
        exit();   
        } 
 
// Une fois la vérification faite, lancer le production. 
    elseif ($_POST['trucaconstruire'] > 0) 
        { // Cas des productions classiques (batiments, composants, autre) 
        // récupérer les informations liée à la prod en cours.  
        $reqinfoitem->execute(array($_POST['trucaconstruire']));  
        $repinfoitem = $reqinfoitem->fetch();

        if ($repinfoitem['technescessaire']!=0)
			{ // Si item a besoin d'une tech, il faut que le joueur la possède. 
			$reqverifiertechnologie->execute(array($_SESSION['id'], $repinfoitem['technescessaire']));
			$repverifiertechnologie = $reqverifiertechnologie->fetch();
			if (!isset($repverifiertechnologie['idrechprinc']))
				{
				header("Location: ../00_planete.php?message=31&id=" . urlencode($_POST['id'])); 
		    	exit();
		    	} 
		    }	

	    if (isset($repinfoitem['nomlimite'])) // S'il y a un maximum sur l'un de ces batiments. 
	        {
	        if (is_numeric($repinfoitem['nomlimite']))
	        	{
	        	$limite = $repinfoitem['nomlimite'];
	        	}
	        else
	        	{
   		        $reqlimite = $bdg->prepare('SELECT '.$repinfoitem['nomlimite'].' FROM limiteplanete WHERE idlimiteplanete = ?'); 
		        $reqlimite->execute(array($_POST['id'])); 
		        $replimite = $reqlimite->fetch();
	        	$limite = $replimite['0'];
	        	}
 
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
 
	        if ($limite < $repcomptechantier['nb'] + $_POST['combien'] + $constencours) 
	            { 
	            $_SESSION['message1'] = $limite; 
	            $_SESSION['message2'] = $repcomptechantier['nb']; 
                header("Location: ../00_planete.php?message=29&id=" . urlencode($_POST['id'])); 
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
                header("Location: ../00_planete.php?message=28&id=" . urlencode($_POST['id']));  
                exit(); 
                } 
            else 
                { // On a du stock, donc on le consomme. 
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
        $reqinfovaisseau = $bdg->prepare('SELECT nomvaisseau, idvaisseau FROM vaisseau WHERE idvaisseau = ? AND idflottevaisseau = ?'); 
        $reqinfovaisseau->execute(array(-$_POST['trucaconstruire'], -$_SESSION['id'])); 
        $repinfovaisseau = $reqinfovaisseau->fetch();   
 
        if (!isset($repinfovaisseau['nomvaisseau'])) 
            { // Vérifier idjoueur et idvaisseau : Virer si pas bon ensemble. 
            header("Location: ../00_planete.php?message=31&id=" . urlencode($_POST['id'])); 
            exit(); 
            } 
    	 
		$a = 0; 
		$reqcomposantpresent = $bdg->prepare('SELECT COUNT(c.iditemcomposant) AS nb, c.iditemcomposant, s.quantite FROM composantvaisseau c LEFT JOIN silo s ON s.iditems = c.iditemcomposant AND s.idplanetesilo = ? WHERE c.idvaisseaucompo = ? AND iditemcomposant > 0 GROUP BY c.iditemcomposant'); 
 
		$reqcomposantpresent->execute(array($_POST['id'], -$_POST['trucaconstruire'])); 
		while($repcomposantpresent = $reqcomposantpresent->fetch()) 
			{
			$nombreditemmanquant = $repcomposantpresent['nb'] - $repcomposantpresent['quantite'];
			if ($nombreditemmanquant > 0) 
				{ // Trop de composants dans le vaisseau par rapport aux stocks.
				$a++;

				$reqinfoitem->execute(array($repcomposantpresent['iditemcomposant']));
		        $repinfoitem = $reqinfoitem->fetch();

		        if ($repinfoitem['itemnecessaire']!=0)
	        		{ // Item 'constructible' par recherche.
					header("Location: ../00_planete.php?message=31&id=" . urlencode($_POST['id']));
				    exit();
				    }

				if ($repinfoitem['technescessaire']!=0)
					{ // Si item a besoin d'une tech, il faut que le joueur la possède.
					$reqverifiertechnologie->execute(array($_SESSION['id'], $repinfoitem['technescessaire']));
					$repverifiertechnologie = $reqverifiertechnologie->fetch();
					if (!isset($repverifiertechnologie['idrechprinc']))
						{
						header("Location: ../00_planete.php?message=31&id=" . urlencode($_POST['id']));
				    	exit();
				    	}
				    }
				for ($i = 1; $i <= $nombreditemmanquant; $i++)
					{
					// echo $i . 'valeur de i<br>';
					$reqcreerconstruction->execute(array(
			        'trucaconstruire' => $repcomposantpresent['iditemcomposant'],
			        'nombre' => 1,
			        'idplaneteconst' => $_POST['id'],
			        'avancementbiens' => $repinfoitem['coutbien'],
			        'avancementtitane' => $repinfoitem['couttitane'],
			        'avancementneutrinos' => $repinfoitem['coutneutrinos'],
			        'prixbiens' => $repinfoitem['coutbien'],
			        'prixtitane' => $repinfoitem['couttitane'],
				    'avancementneutrinos' => $repinfoitem['coutneutrinos']));
			    	}
				} 
			} 
		if ($a != 0) 
			{ 
			header("Location: ../00_planete.php?message=61&id=" . urlencode($_POST['id'])); 
		    exit(); 
		    }

		$reqcomposantpresent->execute(array($_POST['id'], -$_POST['trucaconstruire']));
		while($repcomposantpresent = $reqcomposantpresent->fetch()) 
			{
			// On refait le tour, mais cette fois, on sait que tout est dans les stocks.
			consommercreeritemsplanetemultiple($repcomposantpresent['iditemcomposant'], 0, $_POST['id'], $repcomposantpresent['nb']);
			}
      	// Si on a tout les équipements en stock :
	    $repinfoitem['coutbien'] = 50;
	    $repinfoitem['couttitane'] = 0;
	    $repinfoitem['coutneutrinos'] = 0;
	    $reptransformernom['nombatiment'] = $repinfovaisseau['nomvaisseau'];

	    if ($_POST['combien'] > 1)
	    	{
	    	$_POST['combien'] = 1;
	    	$nummessage = 63;
			}
    	}

$reqcreerconstruction->execute(array(
    'trucaconstruire' => $_POST['trucaconstruire'],
    'nombre' => $_POST['combien'],
    'idplaneteconst' => $_POST['id'],
    'avancementbiens' => $repinfoitem['coutbien'],
    'avancementtitane' => $repinfoitem['couttitane'],
   	'avancementneutrinos' => $repinfoitem['coutneutrinos'],
    'prixbiens' => $repinfoitem['coutbien'],
    'prixtitane' => $repinfoitem['couttitane'],
	'prixneutrinos' => $repinfoitem['coutneutrinos']));

// Permet de gérer l'ordre de construction.
$dernierID = $bdg->lastInsertId();
$reqderniereconst = $bdg->query('SELECT ordredeconstruction FROM construction ORDER BY ordredeconstruction DESC LIMIT 1');
$repderniereconst = $reqderniereconst ->fetch();
$reqordredeconstruction = $bdg->prepare('UPDATE construction SET ordredeconstruction = ? WHERE idconst = ?');
$reqordredeconstruction->execute(array($repderniereconst['ordredeconstruction']+1, $dernierID));

$_SESSION['message1'] = $_POST['combien'];
$_SESSION['message2'] = $reptransformernom['nombatiment'];

header("Location: ../00_planete.php?message=" . urlencode($nummessage) . "&id=" . urlencode($_POST['id']));
exit();
?>