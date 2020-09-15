<?php
if (isset($repstation['idstation']))
	{
	if (!isset($_GET['x']) OR ($_GET['x'] == $repflotte['xflotte'] AND $_GET['y'] == $repflotte['yflotte']))
	    {
	    echo '<p>Une station accepte de faire du commerce ! </p>';

		// Requête pour compter le nombre d'item.
		$reqcargocommerce = $bd->prepare("	SELECT SUM(c.quantiteitems) AS nb, i.nombatiment 
							                FROM c_cargovaisseau c   
							                INNER JOIN a_items i ON i.iditem = c.typeitems
							                INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucargo   
							                WHERE v.idflottevaisseau = ? AND i.iditem = ?");

		// Cas des débris de métaux rares
		$reqcargocommerce ->execute(array($_GET['id'], 8));
		$repdebrisrares = $reqcargocommerce ->fetch();
	    // Variable avec prix des items selon la function !
		$prixdebrisrares = variable(3);
	    // function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
		if ($repdebrisrares['nb'] > 0)
			{
			vendrestation($_GET['id'], $repstation['idstation'], 8, $repdebrisrares['nb'], $repdebrisrares['nombatiment'], $prixdebrisrares);
			}
		else
			{
			echo '<p>Cette station accepte les '.$repdebrisrares['nombatiment'].' au prix de '.$prixdebrisrares.'$, mais votre flotte n\'en transporte pas.</p>';
			}

		// Cas du titane en barre
		$reqcargocommerce ->execute(array($_GET['id'], 26));
		$reptitaneenbarre = $reqcargocommerce ->fetch();
	    // Variable avec prix des items selon la function !
		$prixtitaneenbarre = variable(7);
	    // function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
		if ($reptitaneenbarre['nb'] > 0)
			{
			vendrestation($_GET['id'], $repstation['idstation'], 26, $reptitaneenbarre['nb'], $reptitaneenbarre['nombatiment'], $prixtitaneenbarre);
			}
		else
			{
			echo '<p>Cette station accepte les '.$reptitaneenbarre['nombatiment'].' au prix de '.$prixtitaneenbarre.'$, mais votre flotte n\'en transporte pas.</p>';
			}

		// Cas du neutrinos en barre
		$reqcargocommerce ->execute(array($_GET['id'], 41));
		$repneutrinosbarre = $reqcargocommerce ->fetch();
		// Variable avec prix des items selon la function !
		$prixneutrinosbarre = variable(10);
		// function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
		if ($repneutrinosbarre['nb'] > 0)
			{
			vendrestation($_GET['id'], $repstation['idstation'], 41, $repneutrinosbarre['nb'], $repneutrinosbarre['nombatiment'], $prixneutrinosbarre);
			}
		else
			{
			echo '<p>Cette station accepte les '.$repneutrinosbarre['nombatiment'].' au prix de '.$prixneutrinosbarre.'$, mais votre flotte n\'en transporte pas.</p>';
			}


	    // $replvl['creditgalactique'] vient du include menu.
		echo 'Vous avez '.$replvl['creditgalactique'].'$.';

		// Acheter des moyaux lvl 2 :
		$prixnoyau2 = variable(5);
		$maxpossible = min(floor($replvl['creditgalactique']/$prixnoyau2) , $souteflotte-$quantitetransportee);
		acheterstation($_GET['id'], $repstation['idstation'], 25, $maxpossible, 'Noyaux à sub-tachyons', $prixnoyau2);
	    }
	elseif ($repdect['idexplore'])
		{
		echo 'Station en '.$_GET['x'].'-'.$_GET['y'].'.';
		}
	else
		{
		echo 'Quelque chose émet un signal très puissant et formant une suite mathématique.';
		}
	}
?>