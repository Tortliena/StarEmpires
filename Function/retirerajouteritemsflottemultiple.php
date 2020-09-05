<?php
function retirerajouteritemsflottemultiple($iditemretire, $iditemajoute, $idflotte, $nbdefois)
	{
	require __DIR__ . '/../include/bddconnection.php';
	// Gestion silo :
	$reqverifcargo = $bd->prepare('	SELECT c.quantiteitems, c.idcargovaisseau FROM cargovaisseau c
									INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucargo
									WHERE v.idflottevaisseau = ? AND c.typeitems = ? LIMIT 1');

	$reqtrouveridcargo = $bd->prepare('	SELECT idcargovaisseau FROM c_cargovaisseau
										WHERE idvaisseaucargo = ? AND typeitems = ? LIMIT 1');

	$reqsupprimersilo = $bd->prepare('DELETE FROM c_cargovaisseau WHERE idcargovaisseau = ?');

	$reqcreercargo = $bd->prepare('INSERT INTO c_cargovaisseau (idvaisseaucargo, typeitems, quantiteitems) VALUES (?, ?, ?)');
	
	$augmentercargo = $bd->prepare('UPDATE c_cargovaisseau SET quantiteitems = quantiteitems + 1 WHERE idcargovaisseau = ?' );
	$diminutioncargo = $bd->prepare('UPDATE c_cargovaisseau SET quantiteitems = quantiteitems - 1 WHERE idcargovaisseau = ?' );

	$reqcomptersoute = $bd->prepare('	SELECT v.capacitedesoute, SUM(c.quantiteitems) AS nb, v.idvaisseau 
										FROM c_vaisseau v LEFT JOIN c_cargovaisseau c ON v.idvaisseau = c.idvaisseaucargo
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