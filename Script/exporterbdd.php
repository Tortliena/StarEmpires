<?php 
session_start();
include("../include/BDDconnection.php");

$world_dumper = Shuttle_Dumper::create(
    array(
    'host' => '',
    'username' => 'root',
    'password' => 'root',
    'db_name' => 'autre',
    ));

$autre_dumper->dump('autre.sql');

header('Location: ../accueil.php');
?>