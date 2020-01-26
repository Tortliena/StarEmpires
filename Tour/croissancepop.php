<?php
/*session_start();
include("../script/BDDconnection.php");
*/

// Actuellement : Si pop max sup à pop actuelle de pégu, alors la pop augmente de 1. 

function commentairecroissancedelapopdebut(&$Commentairestour)
{
    $Commentairestour .= '</br> Début de la croissance des pop';
}
commentairecroissancedelapopdebut($Commentairestour);

$req = $bdg->prepare('SELECT COUNT(*) AS nbpopulation FROM population WHERE joueurpop= ?');
$creationpop = $bdg->prepare('INSERT INTO population(joueurpop) VALUES(:joueurpop)');

$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES (?, ?, ?)") ; 

$reponse = $bdg->query('SELECT id, popmax FROM limitesjoueurs');
while ($donnees = $reponse->fetch())
	{ // Compter le nombre de pop.
	$req->execute(array($donnees['id']));
	$nbdepopulation = $req->fetch();
	
	// change d'avoir une pop de plus :
	$popenplus = rand(1 , 100) ;

    // 19% de chance d'avoir une pop de plus !
	if ($donnees['popmax'] > $nbdepopulation['nbpopulation'] AND $popenplus < 20)
		{
		$creationpop ->execute(array('joueurpop' => $donnees['id']));
         $message ->execute(array($donnees['id'], 'Une nouvelle population vient d\'apparaitre sur votre planète.', 'capitale'));
    	}
    elseif ($donnees['popmax'] > $nbdepopulation['nbpopulation'])
    	{
        $message ->execute(array($donnees['id'], 'Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.', 'capitale'));
    	}
	}
$reponse->closeCursor();

function commentairecroissancedelapopfin(&$Commentairestour)
{
    $Commentairestour .= '</br> Fin de la croissance des pop';
}
commentairecroissancedelapopfin($Commentairestour);

?>