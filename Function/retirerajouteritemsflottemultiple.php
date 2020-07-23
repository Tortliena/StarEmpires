<?php
function retirerajouteritemsflottemultiple($iditemretire, $iditemajoute, $idflotte, $nbdefois)
	{
	require __DIR__ . '/../include/BDDconnection.php';
	// Gestion silo :
	$reqverifcargo = $bdg->prepare('	SELECT c.quantiteitems, c.idcargovaisseau FROM cargovaisseau c
										INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucargo
										WHERE v.idflottevaisseau = ? AND c.typeitems = ? LIMIT 1');

	$reqtrouveridcargo = $bdg->prepare('SELECT idcargovaisseau FROM cargovaisseau
										WHERE idvaisseaucargo = ? AND typeitems = ? LIMIT 1');

	$reqsupprimersilo = $bdg->prepare('DELETE FROM cargovaisseau WHERE idcargovaisseau = ?');

	$reqcreercargo = $bdg->prepare('INSERT INTO cargovaisseau (idvaisseaucargo, typeitems, quantiteitems) VALUES (?, ?, ?)');
	
	$augmentercargo = $bdg->prepare('UPDATE cargovaisseau SET quantiteitems = quantiteitems + 1 WHERE idcargovaisseau = ?' );
	$diminutioncargo = $bdg->prepare('UPDATE cargovaisseau SET quantiteitems = quantiteitems - 1 WHERE idcargovaisseau = ?' );

	$reqcomptersoute = $bdg->prepare('	SELECT v.capacitedesoute, SUM(c.quantiteitems) AS nb, v.idvaisseau 
										FROM vaisseau v LEFT JOIN cargovaisseau c ON v.idvaisseau = c.idvaisseaucargo
										WHERE v.idflottevaisseau = ?
										GROUP BY v.idvaisseau');	

	for ($i = 1; $i <= $nbdefois; $i++)
	    {
	    if ($iditemretire > 0)
	      {
	      // Requete pour vérifier si j'en ai en stock    
	      $reqverifcargo->execute(array($idflotte, $iditemretire));
	      $repverifcargoretirer = $reqverifcargo->fetch();


	      if ($repverifcargoretirer['quantiteitems'] > 1)
	          {       // Si oui, alors augmenter le stock
	          $diminutioncargo->execute(array($repverifcargoretirer['idcargovaisseau']));
	          }
	      elseif ($repverifcargoretirer['quantiteitems'] == 1)
	          {       // Sinon, on supprime le stock 
	          $reqsupprimersilo->execute(array($repverifcargoretirer['idcargovaisseau']));
	          }
	      else       // Si on a pas de stock, on casse la boucle.
	          {
	          break;
	          }
	      }

	    if ($iditemajoute > 0)
			{
	      	// Faire une requete pour trouver une vaisseau pas totalement plein.
			$reqcomptersoute->execute(array($idflotte));
			while($repcomptersoute = $reqcomptersoute->fetch())
				{
				if ($repcomptersoute['nb']< $repcomptersoute['capacitedesoute'])
				    { // Si on a de la place dans le vaisseau, alors on augmente le stock. 
					// Si oui, alors augmenter le stock
			    	$reqtrouveridcargo->execute(array($repcomptersoute['idvaisseau'], $iditemajoute));
			    	$reptrouveridcargo = $reqtrouveridcargo->fetch();
				    if (isset($reptrouveridcargo['idcargovaisseau']))
						{
						$augmentercargo->execute(array($reptrouveridcargo['idcargovaisseau']));
						}
					else // Sinon, créer le stock stock  
						{
						$reqcreercargo->execute(array($repcomptersoute['idvaisseau'], $iditemajoute, 1));
						}
					break; //Et on casse la boucle actuelle, sinon, on continue au prochain vaisseau.
					}
				}
	      	}
	    }
	}
?>