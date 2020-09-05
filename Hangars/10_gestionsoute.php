<?php
$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.
// Requête pour compter le nombre d'item.
$reqverifcargo = $bd->prepare("	SELECT SUM(c.quantiteitems) AS nb, i.nombatiment, i.iditem
								FROM c_cargovaisseau c   
								INNER JOIN a_items i ON i.iditem = c.typeitems
								INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucargo   
								WHERE v.idflottevaisseau = ?
								GROUP BY i.iditem");
$reqverifcargo ->execute(array($_GET['id']));
while ($repverifcargo  = $reqverifcargo ->fetch())
	{
	if ($a == 0 AND $repplanete2['idjoueurplanete'] != $repplanete['idjoueurplanete'])
		{ // Premier tour au cas ou on N'est PAS sur l'un de nos planètes.
		$texteexplication = '<p>Cette flotte transporte ';
		} // Premier tour au cas ou on est sur l'un de nos planètes.
	elseif ($a == 0 AND $repplanete2['idjoueurplanete'] == $repplanete['idjoueurplanete'])
		{
		$texteexplication = '<p><form method="post" action="script/ordrechargement.php">Cette flotte transporte&nbsp;';
		}
	elseif ($a != 0 AND $repplanete2['idjoueurplanete'] == $repplanete['idjoueurplanete'])
		{
		$texteexplication .= ',&nbsp;<form method="post" action="script/ordrechargement.php">';
		}
	else
		{ // Permet de gérer les cas avec de multiples items dans les soutes.
		$texteexplication .= ', ';
		}
	// Affiche ce qui est dans le cargo.
	$texteexplication .= $repverifcargo['nb'].' '.$repverifcargo['nombatiment'];
	if ($repplanete2['idjoueurplanete'] == $repplanete['idjoueurplanete'])
		{ // Permet de gérer les cas avec de multiples items dans les soutes.
		$texteexplication .= '&nbsp;<input type="number" name="nombre" min = "1" max = "'.$repverifcargo['nb'].'" value="'.$repverifcargo['nb'].'">';
		$texteexplication .= '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
		$texteexplication .= '<input name="iditem" type="hidden" value="'.$repverifcargo['iditem'].'">';
		$texteexplication .= '<input name="typeechange" type="hidden" value="2">';
		$texteexplication .= '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
		$texteexplication .= '&nbsp;<input type="submit" value="Décharger"/></form>';
		}
	$a = $a + $repverifcargo['nb'];
	}

$texte = 'Capacité des soutes : ' . $quantitetransportee . '/' . $souteflotte;

if ($a != 0)
    {
    echo '<p>'.$texteexplication.'.';
    infobulle($texte, 'infobulle');
    echo '</p>' ;
    }
else
	{
    echo '<p>Rien dans les soutes.';
    infobulle($texte, 'infobulle');
    echo '</p>' ;
    }

$a = 0;
$reqverifsilo = $bd->prepare("	SELECT s.iditems, s.quantite, i.nombatiment
				                FROM c_silo s
				                INNER JOIN a_items i ON i.iditem = s.iditems  
				                WHERE s.idplanetesilo = ? and i.typeitem = ?");
$reqverifsilo ->execute(array($repplanete2['idplanete'], 'produit'));
while ($repverifsilo  = $reqverifsilo ->fetch())
	{
	if ($a == 0)
		{
		echo 'Matériel pouvant être chargé dans la flotte : <br>';
		}
	$a++;

	$valeurmaximaledechargement = min($repverifsilo['quantite'], $souteflotte - $quantitetransportee);
	echo '<form method="post" action="script/ordrechargement.php">';
	echo $repverifsilo['quantite'] . ' ' . $repverifsilo['nombatiment'] ;
	echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
	echo '<input name="iditem" type="hidden" value="'.$repverifsilo['iditems'].'">';
	echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
	echo '<input name="typeechange" type="hidden" value="1">';
	echo '&nbsp;<input type="number" name="nombre" min = "1" max = "'.$valeurmaximaledechargement.'" value="'.$valeurmaximaledechargement.'">'; 
	echo '&nbsp;<input type="submit" value="Charger"/></form>';
	}
?>