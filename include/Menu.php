<?php
require __DIR__ . '/../hangars/fonction/flotte.php';

echo '<nav class="menu">';
// Affichage du tour en cours : 
$reponse = $bd->query('SELECT id, fintour FROM c_tour ORDER BY id DESC LIMIT 1');
$touractuel = $reponse->fetch();

echo '<ul id="menu-demo2">';
echo '<li><a href="/forum/index.php">Forum</a></li> ';
echo '<li class="affichagetour">Tour '.$touractuel['id'].'</li> ';
echo '<li><a class ="lienmenu" href="/statjoueurs.php">Stats des joueurs</a></li>';
if (!isset($_SESSION['pseudo'])) 
    {
    echo '<li><a class ="lienmenu" href="/accueil.php">Accueil</a></li>' ;
    }
else
    {
    $reqflotte = $bd->prepare('SELECT idflotte, nomflotte, typeordre FROM c_flotte  WHERE idplaneteflotte = ? ORDER BY idflotte');
    $reqplanete = $bd->prepare('SELECT nomplanete, idplanete FROM c_planete WHERE idjoueurplanete = ? ORDER BY idplanete');
    
    // récupérer le niveau du joueur.
   	$reqlvl = $bd->prepare('SELECT * from c_utilisateurs WHERE id = ?');
    $reqlvl->execute(array($_SESSION['id']));
    $replvl = $reqlvl->fetch();

    $reqmessnonlu = $bd->prepare('SELECT COUNT(*) AS nbmessnonlu FROM c_messagerie WHERE idjoueurrecepteur = ? AND lu = ? AND supprimerecepteur = ?');
    $reqmessnonlu->execute(array($_SESSION['id'], 0, 0));
    $repmessnonlu = $reqmessnonlu->fetch();

    $reqmessnonluinterne = $bd->prepare('SELECT COUNT(*) AS reqmessnonluinterne FROM c_messagerieinterne WHERE destinataire = ? AND lu = ?');
    $reqmessnonluinterne->execute(array($_SESSION['id'], 0));
    $repmessnonluinterne  = $reqmessnonluinterne->fetch();

    echo '<li class="logging"><a class ="deco" href="/script/deconnection.php">Log : ' . $_SESSION['pseudo'].' (deco)</a></li>';
    

    echo '<li><a class ="lienmenu" href="/messagerie/messagerie.php">Messagerie';

    $nombremessagenonlu = $repmessnonlu['nbmessnonlu'] + $repmessnonluinterne['reqmessnonluinterne'] ;
    if ($nombremessagenonlu>0)
        {
        echo '<span class = "nvmessage"> ('.$nombremessagenonlu.'nv)</span>' ; 
        }
    echo '</a></li>';

    echo '<li><a class ="lienmenu" href="/administration/administration.php">Admin</a></li>';
    echo '<li><a class ="lienmenu" href="/administration/afaire.php">À faire</a></li>';
    echo '<li><a class ="lienmenu" href="/administration/variables.php">Variables du site</a></li>';

    // Seconde partie du menu : Empire et planètes.
    echo '</ul><ul id="menu-demo2">';
    echo '<li><a class="empire"href="/capitale/capitale.php">Capitale</a>';
   
	if ($replvl['lvl'] > 1)
        {
        echo '<ul><li><a href="/recherche.php">Recherche</a></li>';
	    }

	if ($replvl['lvl'] > 6) 
        {
        echo '<li><a class ="lienmenu" href="/conception_vaisseau/conception.php">Conception</a></li>';
        }
    
    if ($replvl['lvl'] > 1)
        {
        echo '</ul>';
	    }
    echo '</li>';

    $reqplanete->execute(array($_SESSION['id']));
    while ($repplanete = $reqplanete->fetch())
        {
        echo ' <li class="planete"><a href="/planete/planete.php?id=' . $repplanete['idplanete'] . '">' . $repplanete['nomplanete'] .'</a><ul>';
        
        $reqflotte->execute(array($repplanete['idplanete']));
        while ($repflotte = $reqflotte->fetch())
            { // Début partie flotte
            if (vitesseflotte($repflotte['idflotte']) > 0)
                {
                echo '<li><a href="/hangars/hangars.php?id=' . $repflotte['idflotte'] . '">'.$repflotte['nomflotte'];
                echo '<br><span class ="ordreflotte">';
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
                echo '</a></li>';
                }
            } // Fin partie flotte
        
        echo '</ul>';
        if ($replvl['lvl'] < 11)
            {
            echo '<li><a class ="lienmenu" href="/tour/gestionglobale.php">Passer le tour</a></li>';
            }   
        echo '</li>';
        } // Fin partie planète
    } // Fin partie connectées
echo '</nav>';

?>
<!--
<a class ="lienmenu" href="/test.php?id=1">test de page</a>
<a class ="lienmenu" href="/script/test.php?table=autre&amp;backup=non">test de script</a>-->
