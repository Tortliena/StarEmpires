<?php
session_start();
include("BDDconnection.php");

    $sql = "DELETE FROM afaire WHERE idafaire = :idafaire";
    $stmt = $bdd->prepare($sql);
    $stmt->bindParam(':idafaire', $_POST['idafaire'], PDO::PARAM_INT);
    $stmt->execute();
   

header('Location: ../afaire');

    ?>