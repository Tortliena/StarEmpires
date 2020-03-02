<nav class="menu"><div><h3>Menu</h3></br>

<?php
// Affichage du tour en cours : 
$reponse = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1');
$touractuel = $reponse->fetch();
$reponse->closeCursor(); 
echo 'Tour'.$touractuel['id'].'</br>' ; 

// Partie non connectée
if (!isset($_SESSION['pseudo'])) 
	{
	echo '<a class ="lienmenu" href="Accueil.php">Accueil</a>' ;
	}

// Partie connectée
else
	{
	// récupérer le niveau du joueur.
   	$reqlvl = $bdg->prepare('SELECT lvl from utilisateurs WHERE id= ?');
    $reqlvl->execute(array($_SESSION['id']));
    $replvl = $reqlvl->fetch();
    echo 'Logging : ' . $_SESSION['pseudo'] . ' </br> ';
    echo '<a class ="lienmenu" href="script/deconnection.php">Déconnection</a></br>';
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
        
    echo '<a class ="lienmenu"  href="Capitale.php">Capitale</a> </br>';
	if ($replvl['lvl'] > 0)
        { 
        echo '<a class ="lienmenu" href="recherche.php">Recherche</a></br>';
	    }

	if ($replvl['lvl'] > 7) 
        {
        echo '<a class ="lienmenu" href="design.php">Conception</a></br>';
        }

 	echo '</br><span class = "titremenu">Planètes</span></br>';
    $reqplanete = $bdg->prepare('SELECT nomplanete, idplanete FROM planete WHERE idjoueurplanete = ? ORDER BY idplanete');
    $reqplanete->execute(array($_SESSION['id']));
    while ($repplanete = $reqplanete->fetch())
        {
        echo '<a class ="lienmenu" href="planete.php?id=' . $repplanete['idplanete'] . '">' . $repplanete['nomplanete'] . '</a></br>';
        }

    $ecrirehangars = 1 ;
    $reqvaiss = $bdg->prepare('SELECT v.idvaisseau, v.nomvaisseau, o.typeordre FROM vaisseau v LEFT JOIN ordredeplacement o ON o.idvaisseaudeplacement = v.idvaisseau WHERE v.idjoueurbat = ? AND v.typevaisseau = 5 ORDER BY v.idvaisseau');
    $reqvaiss->execute(array($_SESSION['id']));
    while ($repvaiss = $reqvaiss->fetch())
        {
        if ($ecrirehangars == 1) {echo '</br><span class = "titremenu">Hangars</span></br>' ; }
            $ecrirehangars = 2 ;
        
        echo '<a class ="lienmenu" href="hangars.php?id=' . $repvaiss['idvaisseau'] . '">' . $repvaiss['nomvaisseau'] . '</a></br>';

        switch ($repvaiss['typeordre'])
            {
            case '':
			echo "Aucun ordre.";
            break;
			
            case 0:
            echo "Se déplace";
            break;
            
            case 1:
            echo "Mine";
            break;
            
            case 2:
            echo "Decharge";
            break;
            
            case 3:
            echo "Rentre a la base";
            break;
            
            case 4:
            echo "Quitte l'orbite";
            break;
            
            case 5:
            echo "BATAILLE";
            break;
            
            case 6:
            case 7:
            echo "En cours de renovation";
            break;

            case 10:
            echo "Saut dimensionnel";
            break;
                
            default:
            echo "ordre special !";
            }
        echo '</br></br>'; 
        }

    $reqvaiss->closeCursor();
    }
?>

<!-- Passer le tour manuellement -->
<form action="tour/Gestionglobale.php">
<p>
<input type="submit" value="Passer le tour" />
</p>
</form>
<b><a class ="lienmenu" href="Administration.php">Admin</a></b></br> </br>
<a class ="lienmenu" href="tour/test.php">test du tour</a> </br> 
<a class ="lienmenu" href="test.php?id=2">test de page</a> </br>
<a class ="lienmenu" href="script/test.php?table=autre&amp;backup=non">test de script</a> </br>
<a class ="lienmenu" href="afaire.php">À faire</a> </br> </br>

</div>    
</nav>