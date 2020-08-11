<?php
if (isset($repstation['idstation']))
	{
    echo '<p>Une station accepte de faire du commerce ! </p>';

	// Requête pour compter le nombre d'item.
	$reqcargocommerce = $bdg->prepare("	SELECT SUM(c.quantiteitems) AS nb, i.nombatiment 
						                FROM cargovaisseau c   
						                INNER JOIN datawebsite.items i ON i.iditem = c.typeitems
						                INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucargo   
						                WHERE v.idflottevaisseau = ? AND i.iditem = ?");

	// Cas des débris de métaux rares
	$reqcargocommerce ->execute(array($_GET['id'], 8));
	$repdebrisrares = $reqcargocommerce ->fetch();
    // Variable avec prix des items selon la function !
	$prixdebrisrares = variable(3);
    // function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
	if ($repdebrisrares['nb'] > 0)
		{
		vendrestation($_GET['id'], $repstation['idstation'], 8, $repdebrisrares['nb'], $repdebrisrares['nombatiment'], $prixdebrisrares[0]);
		}
	else
		{
		echo '<p>Cette station accepte les '.$repdebrisrares['nombatiment'].' au prix de '.$prixdebrisrares[0].'$, mais votre flotte n\'en transporte pas.</p>';
		}

	// Cas du titane en barre
	$reqcargocommerce ->execute(array($_GET['id'], 26));
	$reptitaneenbarre = $reqcargocommerce ->fetch();
    // Variable avec prix des items selon la function !
	$prixtitaneenbarre = variable(7);
    // function vendrestation($idflotte, $idstation, $iditem, $itemenstock, $nomitem, $prixitem)
	if ($reptitaneenbarre['nb'] > 0)
		{
		vendrestation($_GET['id'], $repstation['idstation'], 26, $reptitaneenbarre['nb'], $reptitaneenbarre['nombatiment'], $prixtitaneenbarre[0]);
		}
	else
		{
		echo '<p>Cette station accepte les '.$reptitaneenbarre['nombatiment'].' au prix de '.$prixtitaneenbarre[0].'$, mais votre flotte n\'en transporte pas.</p>';
		}

    // $replvl['creditgalactique'] vient du include menu.
	echo 'Vous avez '.$replvl['creditgalactique'].'$.';

	// Acheter des moyaux lvl 2 :
	$prixnoyau2 = variable(5);
	$maxpossible = min(floor($replvl['creditgalactique']/$prixnoyau2[0]) , $souteflotte-$quantitetransportee);
	acheterstation($_GET['id'], $repstation['idstation'], 25, $maxpossible, 'Noyaux à sub-tachyons', $prixnoyau2[0]);
    }
?>