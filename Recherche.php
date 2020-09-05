<?php
include("include/entete.php");

echo '<h1>RECHERCHE</h1>';

include("include/message.php") ; 
$typemessage = 'recherche' ;
include("include/resume.php");

// Afficher la recherche en cours !
$reqrecherencours = $bd->prepare("	SELECT r.nomrecherche FROM a_recherche r
      								INNER JOIN c_rech_joueur rj ON r.idrecherche = rj.idrech
      								WHERE rj.rechposs = 0 AND rj.idjoueurrecherche = ?
      								ORDER BY rj.ordrerecherche ASC LIMIT 1 ");
$reqrecherencours->execute(array($_SESSION['id']));
$reprecherencours = $reqrecherencours->fetch() ; 
    
if (!isset($reprecherencours['nomrecherche']))
	{
	echo '<p>Aucune recherche en cours.</p>'; 
	}
else
	{
	echo '<p> La recherche en cours est ' . $reprecherencours['nomrecherche'] . '</p>'  ;
	}

echo '<h2>Recherches possibles :</h2>';

// Recherche actuelle : Permet d'évaluer la difficulté d'une recherche plus loin.
$afficherrecherche = $bd->prepare('SELECT recherche FROM c_utilisateurs WHERE id = ?');
$afficherrecherche->execute(array($_SESSION['id']));
$recherche = $afficherrecherche->fetch();

$reqrechercheencours = $bd->prepare("SELECT * FROM a_recherche r INNER JOIN c_rech_joueur rj ON r.idrecherche = rj.idrech WHERE rj.idjoueurrecherche = ? AND rj.rechposs = 0 ORDER BY rj.ordrerecherche ASC");
$reqrechercheencours->execute(array($_SESSION['id']));
while ($reprechercheencours = $reqrechercheencours->fetch())
	{
	?>
	<form method="post" action="script/enregistrementrecherche.php">
	<?php  echo $reprechercheencours['nomrecherche'] . ' : ' . $reprechercheencours['descriptionrecherche'] ; ?>
	<input type="hidden" value="<?php echo $reprechercheencours['idrecherche'] ; ?>" name="idrecherche" />
  	<?php  // Partie affichant la difficulté des recherches.
	if (isset($reprechercheencours['avrech'])) // Si la recherche existe, alors afficher cette partie.
		{?> </br>Difficultée : <?php
		if ($recherche[0] == 0)
			{echo '<span class="impossible">Pas de recherche au dernier tour</span>';}
		elseif ($recherche[0] * 20 < $reprechercheencours['rechnesc'])
			{echo '<span class="impossible">Quasi-impossible</span>';}
		elseif ($recherche[0] * 10 < $reprechercheencours['rechnesc'])
			{echo '<span class="difficile">Dur</span>';}
		elseif ($recherche[0] * 5 < $reprechercheencours['rechnesc'])
			{echo '<span class="normal">Normal</span>';}
		else
			{echo '<span class="tresfacile">facile</span>' ;}
		echo '&nbsp; ; &nbsp;';
		}


	echo 'Avancement actuel : ';
	// Affichage de l'avancement actuel
	if ($reprechercheencours['avrech'] == 0)
		{echo '<span class="aucun">aucun</span>';}
	elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] < 0.25)
		{echo '<span class="faible">prémisses</span>';}
	elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] < 0.60)
		{echo '<span class="moyen">avancé</span>';}
	elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] < 1)
		{echo '<span class="fort">presque fini</span>' ;}
	elseif ($reprechercheencours['avrech'] / $reprechercheencours['rechnesc'] >= 1)
		{echo '<span class="fort">Devrait être fini</span>' ;}?>

	<input type="submit" value="Rechercher" />
	</form> </p>  <?php
	}

$reqrechercheencours->closeCursor();
echo '<h2>Recherches finies :</h2>';

$reqrecherchefinie = $bd->prepare("  SELECT r.nomrecherche , r.descriptionrecherche
                                      FROM a_recherche AS r
                                      INNER JOIN c_rech_joueur AS rj
                                      ON r.idrecherche = rj.idrech
                                      WHERE rj.idjoueurrecherche = ?
                                      AND rj.rechposs = 1");

$reqrecherchefinie->execute(array($_SESSION['id']));
while ($reprecherchefinie = $reqrecherchefinie->fetch())
	{
	echo '<p>' . $reprecherchefinie['nomrecherche'] . ' : ' . $reprecherchefinie['descriptionrecherche'] . '</p>' ;
	}
$reqrecherchefinie->closeCursor();
?>
  </div>
  </body>
</html>