<nav class="menu">        
    <div>
        <h3>Menu</h3>
           	<?php
        
            // Affichage du tour en cours : 
            $reponse = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1');
            $touractuel = $reponse->fetch();
            $reponse->closeCursor();?> 
            Tour <?php echo $touractuel['id'] ; ?>
            </br>
			
            <?php
            // Partie non connectée
            If (!isset($_SESSION['pseudo'])) 
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
            ?>
            <a class ="lienmenu" href="script/deconnection.php">Déconnection</a> </br>
            <a class ="lienmenu" href="Messagerie.php">Messagerie</br>

            <?php
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
            ?>
            </a></br>
            </br>
            <a class ="lienmenu"  href="Capitale.php">Capitale</a> </br>
            <a class ="lienmenu"  href="Chantier.php">Chantier</a> </br>
			<a class ="lienmenu" href="recherche.php">Recherche</a> </br>

			<?php
            // Permet d'afficher le lien vers le silo si on a le niveau pour y accéder.
            if ($replvl['lvl'] > 4) 
                {
                echo '<a class ="lienmenu" href="silo.php">Silo</a></br>';
                }

            $ecrirehangars = 1 ;
            $reqvaiss = $bdg->prepare('SELECT idvaisseau , nomvaisseau FROM vaisseau WHERE idjoueurbat = ? ORDER BY idvaisseau');
            $reqvaiss->execute(array($_SESSION['id']));
            while ($repvaiss = $reqvaiss->fetch())
                {
                if ($ecrirehangars == 1) {echo '</br><span class = "hangars">Hangars</span></br>' ; }
                    $ecrirehangars = 2 ;
                
                echo '<a class ="lienmenu" href="hangars.php?id=' . $repvaiss['idvaisseau'] . '">' . $repvaiss['nomvaisseau'] . '</a></br>';
                }//}

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
            <a class ="lienmenu" href="afaire.php">À faire</a> </br> </br>
        
    </div>    
</nav>