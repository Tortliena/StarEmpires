<?php 
session_start();
include("../include/BDDconnection.php");

// Name of the file
$filename = 'gamer.sql';
// MySQL host
$mysql_host = 'localhost';
// MySQL username
$mysql_username = 'root';
// MySQL password
$mysql_password = 'root';
// Database name
$mysql_database = 'gamer';


// Temporary variable, used to store current query
$templine = '';
// Read in entire file
$lines = file($filename);
// Loop through each line
foreach ($lines as $line)
	{
	// Skip it if it's a comment
	if (substr($line, 0, 2) == '--' || $line == '')
	    continue;

	// Add this line to the current segment
	$templine .= $line;
	// If it has a semicolon at the end, it's the end of the query
	if (substr(trim($line), -1, 1) == ';')
		{
	    // Perform the query
	    mysql_query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />');
	    // Reset temp variable to empty
	    $templine = '';
		}
	}
	
 echo "Tables imported successfully";
?>