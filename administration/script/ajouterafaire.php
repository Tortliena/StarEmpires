<?php
session_start();
require __DIR__ . '/../../include/BDDconnection.php';

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;

echo $_POST['nouveauprojet'] . '</br>';
echo $_POST['niveaudeprojet'] . '</br>';
*/

    $req = $bda->prepare('INSERT INTO afaire(texteafaire, priorite) VALUES(:texteafaire, :priorite)');
    $req->execute(array(
                'texteafaire' => $_POST['nouveauprojet'],
                'priorite' => $_POST['niveaudeprojet']));
    $req->closeCursor();

header('Location: ../afaire.php');
    ?>