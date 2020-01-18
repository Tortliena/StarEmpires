<?php
session_start();
include("../script/BDDconnection.php");


$reqcountrecherche = $bdd->prepare('SELECT COUNT(*) AS nbdecentrederecherche FROM batiments WHERE idjoueurbat = ? AND typebat = 1');

$reqlvlup = $bdd->prepare('UPDATE utilisateurs SET lvl = lvl + 1 WHERE id = ?');



$reqlvl = $bdd->QUERY('SELECT lvl, id from utilisateurs ORDER BY id ASC');
WHILE($replvl = $reqlvl->fetch())
    {
    switch ($replvl['lvl'])
    { 
      case 0:
            echo 'cas 0 !</br>' ;
            $reqcountrecherche->execute(array($replvl['id']));
            $repcountrecherche = $reqcountrecherche->fetch();
            if ($repcountrecherche['nbdecentrederecherche']>0)
                {
                $reqlvlup->execute(array($replvl['id']));
                echo 'cas update 0</br>' ;
                }  
      break;
    }
    }
?>