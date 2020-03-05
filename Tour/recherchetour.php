<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

$reqrecherencours = $bdg->prepare(" SELECT avrech , rechnesc, idrech, idrechprinc
                                    FROM rech_joueur
                                    WHERE idjoueurrecherche = ? AND rechposs = 0
                                    ORDER BY ordrerecherche ASC LIMIT 1 ");

$avancement = $bdg->prepare(" UPDATE rech_joueur
                              SET avrech =  avrech + ? , rechposs = ?
                              WHERE idrechprinc = ? AND rechposs = 0 LIMIT 1");

$reqdeleterecherche = $bdg->prepare("DELETE FROM rech_joueur WHERE idrechprinc = ? LIMIT 1");

$message = $bdg->prepare("	INSERT INTO messagetour (idjoumess , message , domainemess)
                            VALUES (?, ?, ?)");

$reqinforecherche = $bdd->prepare('SELECT itemnecessaire, idrecherche FROM recherche WHERE idrecherche = ?'); 
$reqinfoitem = $bdd->prepare('SELECT itemnecessaire FROM items WHERE technescessaire  = ?'); 
$reqarbretechno = $bdd->prepare('SELECT idrecherche FROM recherche WHERE recherchenecessaire = ?'); 

$reqprodrecherchejoueur = $bdg->query('SELECT id, recherche FROM utilisateurs ORDER BY id');
  while ($infojoueur = $reqprodrecherchejoueur->fetch())
    {
    $reqrecherencours ->execute(array($infojoueur['id']));
    while ($reprecherencours = $reqrecherencours->fetch())
        { // Si pas assez de recherche, avancer la recherche. 
        if ($infojoueur['recherche'] + $reprecherencours['avrech'] < $reprecherencours['rechnesc'])
            {
            $avancement->execute(array($infojoueur['recherche'], 0, $reprecherencours['idrechprinc']));
            } 
           
        // Si assez de recherche, alors avancer la rechercher + la marquée comme possédée. 
        else
            {
            $message->execute(array($infojoueur['id'], 'Vous venez de finir une recherche', 'recherche'));
            $reqinforecherche->execute(array($reprecherencours['idrech']));
            $repinforecherche = $reqinforecherche->fetch(); 
            
            if ($repinforecherche['itemnecessaire'] == 0)
				{ // Cas d'une recherche ne nécessitant rien (recherche classique)
				$avancement->execute(array($infojoueur['recherche'], 1, $reprecherencours['idrechprinc']));
				}
            else
	        	{ // Cas d'une recherche consommant un débris alien et donnant un composant.
	        	$reqdeleterecherche->execute(array($reprecherencours['idrechprinc']));

	        	$reqinfoitem->execute(array($reprecherencours['idrech']));
	        	$repinfoitem = $reqinfoitem->fetch();

				creerconsommeritems ($repinforecherche['itemnecessaire'], $repinfoitem['itemnecessaire'], $infojoueur['idjoueur']);
				}

            // Si la recherche donne accès à une autre recherche, alors on va créer une nouvelle recherche.
            $reqarbretechno->execute(array($reprecherencours['idrech']));
            while ($reparbretechno = $reqarbretechno->fetch())
            	{
            	creerrecherche($reparbretechno['idrecherche'], $infojoueur['id']);
            	}
            }    
    	}
    }

/*
// Permet de créer une recherche lorsqu'on a un artefact en stock.
$reqinfoartefact = $bdg->prepare("SELECT s.idjoueursilo, i.technescessaire FROM silo AS s INNER JOIN datawebsite.items AS i ON s.iditems = i.iditem WHERE i.typeitem = 'artefact'");
$reqinfoartefact->execute(array());
while ($repinfoartefact = $reqinfoartefact->fetch())
    {
    echo $repinfoartefact['technescessaire'] . ' tech nécessaire</br>';
    echo $repinfoartefact['idjoueursilo'] . ' id du joueur. </br>';
    creerrecherche($repinfoartefact['technescessaire'], $repinfoartefact['idjoueursilo']); 
    }
*/
?>