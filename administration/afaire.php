<?php
include("../include/entete.php");
?>
<form method="post" action="script/ajouterafaire.php">
    <p>
        <input type="text" name="nouveauprojet" id="nouveauprojet" placeholder="nouveau projet" size="40" maxlength="127" />
        <select name="niveaudeprojet" id="niveaudeprojet">
            <option value="encours">En cours</option>
            <option value="petittrucrapide">Petit truc rapide</option>
            <option value="grosetapesouspeu">Grosse étape à faire sous peu</option>
            <option value="petittrucplustard">Petit truc plus tard</option>
            <option value="grosseetapeplustard">Grosse étape plus tard</option>
            <option value="lancementsite">Pour le lancement du site</option>
        </select>
        <input type="submit" value="Ajouter" />
    </p>
    </form>

<h2>En cours :</h2>
<?php
$reponse = $bd->prepare('SELECT texteafaire, idafaire FROM b_afaire WHERE priorite = ? ORDER BY idafaire');
$reponse->execute(array('encours'));
while ($donnees = $reponse->fetch())
  {
    echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
  }
$reponse->closeCursor();
?>

    <h2>Petit truc rapide :</h2>

<?php
$reponse->execute(array('petittrucrapide'));
while ($donnees = $reponse->fetch())
  {
    echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
  }
$reponse->closeCursor();
?>

    <h2>Grosse étape à faire sous peu :</h2>

    <?php
        $reponse->execute(array("grosetapesouspeu"));
        while ($donnees = $reponse->fetch())
          {
            echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
          }
        $reponse->closeCursor();
    ?>

    <h2>Petit truc plus tard</h2>

<?php
$reponse->execute(array("petittrucplustard"));
while ($donnees = $reponse->fetch())
  {
    echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
  }
$reponse->closeCursor();
?>


    <h2>Grosse étape plus tard</h2>

    <?php
        $reponse->execute(array("grosseetapeplustard"));
        while ($donnees = $reponse->fetch())
          {
            echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
          }
        $reponse->closeCursor();
    ?>

    </br><h2>Pour le lancement du site</h2>
    <?php
        $reponse->execute(array("lancementsite"));
        while ($donnees = $reponse->fetch())
          {
            echo '<form method="post" action="script/supprimerafaire.php">'
          . $donnees['texteafaire'] . '
          <input type="hidden" name="idafaire" value="' . $donnees['idafaire'] . '">
          <input type="submit" value="Supprimer" />
          </form></br> ';
          }
        $reponse->closeCursor();
    ?>    
  </div>
  </body>
</html>