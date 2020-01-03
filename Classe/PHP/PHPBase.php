    <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
    </head>
    <body>

		<?php
			echo "Cette ligne <strong>a été</strong> écrite \"uniquement\" en PHP.";
		?>
        
        <p>Aujourd'hui nous sommes le <?php echo date('d/m/Y h:i:s'); ?>.</p>

        <?php // Commentaire monoligne!
        
        /* Commentaire
        Multi
        Ligne */
         ?>


        <?php
        $variable = "Mon \"nom\" est Mateo21";
        $variable = 'Je m\'appelle Mateo21';
        $age_du_visiteur = 17;
        $pas_de_valeur = NULL;
        $je_suis_un_zero = true;
        $je_suis_bon_en_php = false;
        $poids = 57.3;
        ?>


<?php
$age_du_visiteur = 17;
echo "Le visiteur a ";
echo $age_du_visiteur;
echo " ans";
echo 'Le visiteur a ' . $age_du_visiteur . ' ans';
?>



<?php
$nombre = 2 + 4; // $nombre prend la valeur 6
$nombre = 5 - 1; // $nombre prend la valeur 4
$nombre = 3 * 5; // $nombre prend la valeur 15
$nombre = 10 / 2; // $nombre prend la valeur 5

// Allez on rajoute un peu de difficulté
$nombre = 3 * 5 + 1; // $nombre prend la valeur 16
$nombre = (1 + 2) * 2; // $nombre prend la valeur 6
?>


<?php
$nombre = 10;
$resultat = ($nombre + 5) * $nombre; // $resultat prend la valeur 150
?>


    </body>
</html>



<?php
function add_some_extra(&$string)
{
    $string .= ', et un peu plus.';
}
$str = 'Ceci est une chaîne';
add_some_extra($str);
echo $str; // Affiche : 'Ceci est une chaîne, et un peu plus.'
?>