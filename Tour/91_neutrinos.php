<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerasteroides = $bd->prepare('INSERT INTO c_champsasteroides (xaste, yaste, uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)'); 

$reqquantiteasteroides = $bd->prepare('SELECT sum(quantite) as total FROM c_champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? AND typeitemsaste = ?');

$reqinfoetoileneutrinos = $bd->query('SELECT * FROM c_etoileneutrinos');
while($repinfoetoileneutrinos = $reqinfoetoileneutrinos->fetch())
	{
	// Permet d'avoir la quantité d'astéroides présents autour de l'étoile pour en limiter le nombre.
	$reqquantiteasteroides->execute(array($repinfoetoileneutrinos['xneutrinos'], $repinfoetoileneutrinos['yneutrinos'], $repinfoetoileneutrinos['universneutrinos'], 36));
	$repquantiteasteroides = $reqquantiteasteroides->fetch();

	$Commentairestour .= '<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : '.$repquantiteasteroides['total'];
	
	// Calcul du nombre d'astéroide à créer en fonction de la quantité dans l'étoile + quantité présente.
	if ($repquantiteasteroides['total'] < 30)
		{
		$Commentairestour .= '<br>Des débris au neutrinos ont été créés.';
		$quantite = rand(2,5);
		$reqcreerasteroides->execute(array($repinfoetoileneutrinos['xneutrinos'], $repinfoetoileneutrinos['yneutrinos'], $repinfoetoileneutrinos['universneutrinos'], 36, $quantite));
		}
	}
?>