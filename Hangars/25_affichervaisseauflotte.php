<?php
$a = 0; 
$reqvaisseaudanslaflotte = $bdg->prepare("SELECT idvaisseau, nomvaisseau, HPmaxvaisseau, HPvaisseau   
                FROM vaisseau
                WHERE idflottevaisseau = ?") ;
$reqvaisseaudanslaflotte ->execute(array($_GET['id']));
while ($repvaisseaudanslaflotte = $reqvaisseaudanslaflotte ->fetch())
	{
	$a++; 
	$PourcentHP = $repvaisseaudanslaflotte['HPvaisseau'] / $repvaisseaudanslaflotte['HPmaxvaisseau'] * 100 ;
	echo '<a href="../Conception_vaisseau/50_vaisseau.php?id=' . $repvaisseaudanslaflotte['idvaisseau'] . '">' . $repvaisseaudanslaflotte['nomvaisseau'] . '</a> (' . number_format($PourcentHP, 0) . '%)'; 

	if ($repplanete2['idplanete'] == $repflotte['idplaneteflotte'])
		{
		if ($PourcentHP < 100)
		    {
		    //Requête pour réparer le vaisseau
		    echo '&nbsp<form method="post" action="script/ordrevaisseau.php">'; 
		    echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
		    echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseaudanslaflotte['idvaisseau'].'">';
		    echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
		    echo '<input name="mouvement" type="hidden" value="5">';
		    echo '<input type="submit" value="Réparer"/></form> '; 
		    }
		echo '<form method="post" action="script/ordrevaisseau.php">'; 
		echo '<input name="idplanete" type="hidden" value="'.$repplanete2['idplanete'].'">';
		echo '<input name="idvaisseau" type="hidden" value="'.$repvaisseaudanslaflotte['idvaisseau'].'">';
		echo '<input name="idflotte" type="hidden" value="'.$_GET['id'].'">';
		echo '<input name="mouvement" type="hidden" value="3">';
		echo ' <input type="submit" value="Rejoindre la planète"/></form>';
		}
	echo '</br>';
	}
?>