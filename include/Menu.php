<nav class="menu"><div><h3>Menu</h3></br>
<?php

require __DIR__ . '/../function/flotte.php';

// Affichage du tour en cours : 
$reponse = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1');
$touractuel = $reponse->fetch();
$reponse->closeCursor(); 
echo 'Tour '.$touractuel['id'].'</br>' ; 

// Partie non connectée
if (!isset($_SESSION['pseudo'])) 
	{
	echo '<a class ="lienmenu" href="/starempires/Accueil.php">Accueil</a>' ;
	}

// Partie connectée
else
	{
	// récupérer le niveau du joueur.
   	$reqlvl = $bdg->prepare('SELECT lvl, creditgalactique from utilisateurs WHERE id= ?');
    $reqlvl->execute(array($_SESSION['id']));
    $replvl = $reqlvl->fetch();
    echo 'Logging : ' . $_SESSION['pseudo'] . ' </br> ';
    echo '<a class ="lienmenu" href="/starempires/script/deconnection.php">Déconnection</a></br>';
    echo '<a class ="lienmenu" href="Messagerie.php">Messagerie</br>';

    $reqmessnonlu = $bdg->prepare('SELECT COUNT(*) AS nbmessnonlu FROM messagerie WHERE idjoueurrecepteur = ? AND lu = ? AND supprimerecepteur = ?');
    $reqmessnonlu->execute(array($_SESSION['id'], 0, 0));
    $repmessnonlu = $reqmessnonlu->fetch();

    $reqmessnonluinterne = $bdg->prepare('SELECT COUNT(*) AS reqmessnonluinterne FROM messagerieinterne WHERE destinataire = ? AND lu = ?');
    $reqmessnonluinterne->execute(array($_SESSION['id'], 0));
    $repmessnonluinterne  = $reqmessnonluinterne->fetch();

    $nombremessagenonlu = $repmessnonlu['nbmessnonlu'] + $repmessnonluinterne['reqmessnonluinterne'] ;
    if ($nombremessagenonlu>0)
        {
        echo '<span class = "nvmessage">'.$nombremessagenonlu.' nv mess</span>' ; 
        }
    echo '</a></br>';
        
    echo '<a class ="lienmenu"  href="/starempires/Capitale.php">Capitale</a> </br>';
	if ($replvl['lvl'] > 1)
        {
        echo '<a class ="lienmenu" href="/starempires/Recherche.php">Recherche</a></br>';
	    }

	if ($replvl['lvl'] > 6) 
        {
        echo '<a class ="lienmenu" href="/starempires/Conception.php">Conception</a></br>';
        }

 	echo '</br><span class = "titremenu">Planètes</span></br>';
    
    $reqflotte = $bdg->prepare('SELECT idflotte, nomflotte, typeordre FROM flotte  WHERE idplaneteflotte = ? ORDER BY idflotte');
    $reqplanete = $bdg->prepare('SELECT nomplanete, idplanete FROM planete WHERE idjoueurplanete = ? ORDER BY idplanete');
    
    $reqplanete->execute(array($_SESSION['id']));
    while ($repplanete = $reqplanete->fetch())
        {
        echo '<a class ="lienmenu" href="/starempires/planete.php?id=' . $repplanete['idplanete'] . '">' . $repplanete['nomplanete'] . '</a></br>';
       
        $ecrirehangars = 1 ;
        $reqflotte->execute(array($repplanete['idplanete']));
        while ($repflotte = $reqflotte->fetch())
            {
            if (vitesseflotte($repflotte['idflotte']) > 0)
                {
                if ($ecrirehangars == 1) {echo '</br><span class = "titremenu">Hangars</span></br>' ; }
                    $ecrirehangars = 2 ;
                
                echo '<a class ="lienmenu" href="/starempires/hangars.php?id=' . $repflotte['idflotte'] . '">' . $repflotte['nomflotte'] . '</a></br>';

                switch ($repflotte['typeordre'])
                    {
                    case 0:
                    echo "Aucun ordre.";
                    break;
                               
                    case 1:
                    echo "Mine";
                    break;

                    case 2:
                    echo "Saut dimensionnel";
                    break;

                    case 3:
                    echo "Invasion";
                    break;
                                  
                    case 5:
                    echo "BATAILLE";
                    break;
                    
                    case 6:
                    echo "Se déplace";
                    break;

                    case 10:
                    echo "Saut dimensionnel";
                    break;

                    case 11:
                    echo "Colonisation";
                    break;
                        
                    default:
                    echo "ordre special !";
                    }
                }
            echo '</br></br>'; 
            } // Fin code pour les flottes.
        $reqflotte->closeCursor();
        } // Fin partie planète
    } // Fin partie connectée.
?>

<!-- Passer le tour manuellement -->
<form action="tour/00_Gestionglobale.php">
<p>
<input type="submit" value="Passer le tour" />
</p>
</form>
<b><a class ="lienmenu" href="/starempires/administration/Administration.php">Admin</a></b></br> </br>
<a class ="lienmenu" href="/starempires/tour/test.php">test du tour</a> </br> 
<a class ="lienmenu" href="/starempires/test.php?id=1">test de page</a> </br>
<a class ="lienmenu" href="/starempires/script/test.php?table=autre&amp;backup=non">test de script</a> </br>
<a class ="lienmenu" href="/starempires/administration/afaire.php">À faire</a> </br> </br>
<a class ="lienmenu" href="/starempires/forum/index.php">Forum</a></br>

</div>    
</nav>