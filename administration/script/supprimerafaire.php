<?php
session_start();
require __DIR__ . '/../../include/bddconnection.php';

    $reqdeleteafaire = $bd->prepare("DELETE FROM b_afaire WHERE idafaire = :idafaire");
    $reqdeleteafaire->bindParam(':idafaire', $_POST['idafaire'], PDO::PARAM_INT);
    $reqdeleteafaire->execute();
   
header('Location: ../afaire.php');
    ?>