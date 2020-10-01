<nav class="menu"><div><h3>Menu</h3></br>
<?php
require __DIR__ . '/../hangars/fonction/flotte.php';

// Affichage du tour en cours : 
$reponse = $bd->query('SELECT id, fintour FROM c_tour ORDER BY id DESC LIMIT 1');
$touractuel = $reponse->fetch();
$reponse->closeCursor(); 
echo 'Tour '.$touractuel['id'].'</br>' ; 
if (!isset($_SESSION['pseudo'])) 
	{
    echo '<a class ="lienmenu" href="/accueil.php">Accueil</a><br>' ;
    }
echo '<a class ="lienmenu" href="/forum/index.php">Forum</a></br><br>';
// Partie connectée
if (isset($_SESSION['pseudo'])) 
	{
	// récupérer le niveau du joueur.
   	$reqlvl = $bd->prepare('SELECT * from c_utilisateurs WHERE id = ?');
    $reqlvl->execute(array($_SESSION['id']));
    $replvl = $reqlvl->fetch();
    echo 'Logging : ' . $_SESSION['pseudo'] . ' </br> ';
    echo '<a class ="lienmenu" href="/script/deconnection.php">Déconnection</a></br>';
    echo '<a class ="lienmenu" href="/messagerie/messagerie.php">Messagerie</br>';

    $reqmessnonlu = $bd->prepare('SELECT COUNT(*) AS nbmessnonlu FROM c_messagerie WHERE idjoueurrecepteur = ? AND lu = ? AND supprimerecepteur = ?');
    $reqmessnonlu->execute(array($_SESSION['id'], 0, 0));
    $repmessnonlu = $reqmessnonlu->fetch();

    $reqmessnonluinterne = $bd->prepare('SELECT COUNT(*) AS reqmessnonluinterne FROM c_messagerieinterne WHERE destinataire = ? AND lu = ?');
    $reqmessnonluinterne->execute(array($_SESSION['id'], 0));
    $repmessnonluinterne  = $reqmessnonluinterne->fetch();

    $nombremessagenonlu = $repmessnonlu['nbmessnonlu'] + $repmessnonluinterne['reqmessnonluinterne'] ;
    if ($nombremessagenonlu>0)
        {
        echo '<span class = "nvmessage">'.$nombremessagenonlu.' nv mess</span>' ; 
        }
    echo '</a></br>';
        
    echo '<a class ="lienmenu"  href="/capitale/capitale.php">Capitale</a> </br>';
	if ($replvl['lvl'] > 1)
        {
        echo '<a class ="lienmenu" href="/recherche.php">Recherche</a></br>';
	    }

	if ($replvl['lvl'] > 6) 
        {
        echo '<a class ="lienmenu" href="/conception_vaisseau/conception.php">Conception</a></br>';
        }

 	echo '</br><span class = "titremenu">Planètes</span>';
    
    $reqflotte = $bd->prepare('SELECT idflotte, nomflotte, typeordre FROM c_flotte  WHERE idplaneteflotte = ? ORDER BY idflotte');
    $reqplanete = $bd->prepare('SELECT nomplanete, idplanete FROM c_planete WHERE idjoueurplanete = ? ORDER BY idplanete');
    
    $reqplanete->execute(array($_SESSION['id']));
    while ($repplanete = $reqplanete->fetch())
        {
        echo '</br><a class ="lienmenu" href="/planete/planete.php?id=' . $repplanete['idplanete'] . '">' . $repplanete['nomplanete'] . '</a></br>';
       
        $ecrirehangars = 1 ;
        $reqflotte->execute(array($repplanete['idplanete']));
        while ($repflotte = $reqflotte->fetch())
            {
            if (vitesseflotte($repflotte['idflotte']) > 0)
                {
                echo '<li class ="listemenu"><a class ="lienmenu" href="/hangars/hangars.php?id=' . $repflotte['idflotte'] . '">' . $repflotte['nomflotte'] . '</a></li><span class ="ordreflotte">';
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
                    
                    case 4:
                        echo "Terraformation";
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
            echo '</span></br>'; 
            } // Fin code pour les flottes.
        $reqflotte->closeCursor();
        } // Fin partie planète
    echo '<br><br><a class ="lienmenu" href="/administration/administration.php">Admin</a></br>';
    echo '<a class ="lienmenu" href="/administration/afaire.php">À faire</a></br>';
    } // Fin partie connectée.
?>

<!-- Passer le tour manuellement -->
<form action="/tour/gestionglobale.php">
<p>
<input type="submit" value="Passer le tour" />
</p>
</form>
<a class ="lienmenu" href="/statjoueurs.php">Stats des joueurs</a> </br> 

<!--
<a class ="lienmenu" href="/test.php?id=1">test de page</a> </br>
<a class ="lienmenu" href="/script/test.php?table=autre&amp;backup=non">test de script</a> </br>-->

</div>    
</nav>