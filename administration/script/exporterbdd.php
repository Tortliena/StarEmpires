<?php 
session_start();
require __DIR__ . '/../../include/bddconnection.php';

if (isset($_GET['backup']) AND $_GET['backup'] == 'non')
    {
    require __DIR__ . '/includescriptadmin.php';
    define("BACKUP_DIR", '../');
    }
elseif (isset($_GET['backup']) AND $_GET['backup'] == 'oui')
    {
    require __DIR__ . '/includescriptadmin.php';
    define("BACKUP_DIR", '../bddbackup/');
    }
elseif (isset($_GET["mdp"]) AND $_GET["mdp"] == 'lrsngrlsntjls')
    {
    define("BACKUP_DIR", '../bddbackup/');  
    }
else
    {
    exit;
    }

// Code permettant de choisir les tables à exporter.
if (isset($_GET['table']) AND $_GET['table'] == 'univers')
    {
    $reqtexteniveau = $bd->prepare("SELECT TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_SCHEMA = 'kaien_starsempire' AND TABLE_NAME LIKE 'c%'"); 
    }
elseif (isset($_GET['table']) AND $_GET['table'] == 'news')
    {
    $reqtexteniveau = $bd->prepare("SELECT TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_SCHEMA = 'kaien_starsempire' AND TABLE_NAME LIKE 'b%'"); 
    }
elseif (isset($_GET['table']) AND $_GET['table'] == 'datasite')
    {
    $reqtexteniveau = $bd->prepare("SELECT TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_SCHEMA = 'kaien_starsempire' AND TABLE_NAME LIKE 'a%'"); 
    }
else
    {
    $reqtexteniveau = $bd->prepare("SELECT TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_SCHEMA = 'kaien_starsempire' AND (TABLE_NAME LIKE 'a%' OR TABLE_NAME LIKE 'b%' OR TABLE_NAME LIKE 'c%')"); 
    }

$a = 0;
$reqtexteniveau->execute(array()); 
while($reptexteniveau = $reqtexteniveau->fetch())
    {
    if ($a == 0)
        {
        $nomsdestables = $reptexteniveau['TABLE_NAME'];
        }
    else
        {
        $nomsdestables .= ', '.$reptexteniveau['TABLE_NAME'];
        }
    $a++;
    }

// Permet de supprimer le fichier et éviter l'accumulation de données.
$fichier = '../kaien_starsempire.sql';
if(file_exists($fichier))
    unlink( $fichier );

// Gère l'importation/exportation sur le local ou en ligne.
$path = $_SERVER['DOCUMENT_ROOT'];
if ($path == 'C:/wamp64/www/Starempires')
    {
    define("DB_USER", 'root');
    define("DB_PASSWORD", 'root');
    define("DB_NAME", 'kaien_starsempire');
    }
else
    {
   	// Cas de l'exportation depuis le site web.
    $nomsdestables = 'c_bataille, c_batiment, c_cargovaisseau, c_champsasteroides, c_composantvaisseau, c_construction, c_destruction, c_etoileneutrinos, c_explore, c_flotte, c_limiteplanete, c_messagerie, c_messagerieinterne, c_messagetour, c_planete, c_population, c_rapportcombat, c_rech_joueur, c_silo, c_station, c_tour, c_transfertvaisseau, c_transfertvaisseau, c_utilisateurs, c_vaisseau, c_variationstour';
    define("DB_USER", 'ynyfwcqz_Kaien');
    define("DB_PASSWORD", 'ScELRbsJLTCR4Lq');
    define("DB_NAME", 'ynyfwcqz_kaien_starsempire');
    }

// Source du script : http://www.iamrohit.in/simple-backup-restore-mysql-database-via-php-script/
define("DB_HOST", 'localhost');
define("TABLES", $nomsdestables);
define("CHARSET", 'utf8');
define("GZIP_BACKUP_FILE", false);
define("DISABLE_FOREIGN_KEY_CHECKS", true);
define("BATCH_SIZE", 1000);

class Backup_Database {
    var $host;
    var $username;
    var $passwd;
    var $dbName;
    var $charset;
    var $conn;
    var $backupDir;
    var $backupFile;
    var $gzipBackupFile;
    var $output;
    var $disableForeignKeyChecks;
    var $batchSize;
public function __construct($host, $username, $passwd, $dbName, $charset = 'utf8')
    {
    $this->host                    = $host;
    $this->username                = $username;
    $this->passwd                  = $passwd;
    $this->dbName                  = $dbName;
    $this->charset                 = $charset;
    $this->conn                    = $this->initializeDatabase();
    $this->backupDir               = BACKUP_DIR ? BACKUP_DIR : '.';

    if (isset($_GET['backup']) AND $_GET['backup'] == 'non')
        {
        $this->backupFile              = $this->dbName.'.sql';
        }
    else
        {
        require __DIR__ . '/../../include/bddconnection.php';
        $reqtour = $bd->query('SELECT id, fintour FROM c_tour ORDER BY id DESC LIMIT 1');
        $reptour = $reqtour->fetch();

        $this->backupFile              = $this->dbName.'-'.$reptour['id'].'-'.date("Ymd_His", time()).'.sql';
        }

    $this->gzipBackupFile          = defined('GZIP_BACKUP_FILE') ? GZIP_BACKUP_FILE : true;
    $this->disableForeignKeyChecks = defined('DISABLE_FOREIGN_KEY_CHECKS') ? DISABLE_FOREIGN_KEY_CHECKS : true;
    $this->batchSize               = defined('BATCH_SIZE') ? BATCH_SIZE : 1000; // default 1000 rows
    $this->output                  = '';
    }

protected function initializeDatabase()
    {
    try
        {
        $conn = mysqli_connect($this->host, $this->username, $this->passwd, $this->dbName);
        if (mysqli_connect_errno())
            {
            throw new Exception('ERROR connecting database: ' . mysqli_connect_error());
            die();
            }
        if (!mysqli_set_charset($conn, $this->charset))
            {
            mysqli_query($conn, 'SET NAMES '.$this->charset);
            }
        }
    catch (Exception $e)
        {
        print_r($e->getMessage());
        die();
        }
    return $conn;
    }

public function backupTables($tables = '*')
    {
    try
        {
        if($tables == '*')
            {
            $tables = array();
            $result = mysqli_query($this->conn, 'SHOW TABLES');
            while($row = mysqli_fetch_row($result))
                {
                $tables[] = $row[0];
                }
            }
        else
            {
            $tables = is_array($tables) ? $tables : explode(',', str_replace(' ', '', $tables));
            }
        $sql = 'CREATE DATABASE IF NOT EXISTS `'.$this->dbName."`;\n\n";
        $sql .= 'USE `'.$this->dbName."`;\n\n";

        if ($this->disableForeignKeyChecks === true)
            {
            $sql .= "SET foreign_key_checks = 0;\n\n";
            }
        
        foreach($tables as $table)
            {
            $this->obfPrint("Backing up `".$table."` table...".str_repeat('.', 50-strlen($table)), 0, 0);
            $sql .= 'DROP TABLE IF EXISTS `'.$table.'`;';
            $row = mysqli_fetch_row(mysqli_query($this->conn, 'SHOW CREATE TABLE `'.$table.'`'));
            $sql .= "\n\n".$row[1].";\n\n";


            $row = mysqli_fetch_row(mysqli_query($this->conn, 'SELECT COUNT(*) FROM `'.$table.'`'));
            $numRows = $row[0];
            // Split table in batches in order to not exhaust system memory 
            $numBatches = intval($numRows / $this->batchSize) + 1; // Number of while-loop calls to perform
            for ($b = 1; $b <= $numBatches; $b++)
                {
                $query = 'SELECT * FROM `' . $table . '` LIMIT ' . ($b * $this->batchSize - $this->batchSize) . ',' . $this->batchSize;
                $result = mysqli_query($this->conn, $query);
                $realBatchSize = mysqli_num_rows ($result); // Last batch size can be different from $this->batchSize
                $numFields = mysqli_num_fields($result);
                if ($realBatchSize !== 0)
                    {
                    $sql .= 'INSERT INTO `'.$table.'` VALUES ';
                    for ($i = 0; $i < $numFields; $i++)
                        {
                        $rowCount = 1;
                        while($row = mysqli_fetch_row($result))
                            {
                            $sql.='(';
                            for($j=0; $j<$numFields; $j++)
                                {
                                if (isset($row[$j]))
                                    {
                                    $row[$j] = addslashes($row[$j]);
                                    $row[$j] = str_replace("\n","\\n",$row[$j]);
                                    $row[$j] = str_replace("\r","\\r",$row[$j]);
                                    $row[$j] = str_replace("\f","\\f",$row[$j]);
                                    $row[$j] = str_replace("\t","\\t",$row[$j]);
                                    $row[$j] = str_replace("\v","\\v",$row[$j]);
                                    $row[$j] = str_replace("\a","\\a",$row[$j]);
                                    $row[$j] = str_replace("\b","\\b",$row[$j]);
                                    if ($row[$j] == 'true' or $row[$j] == 'false' or preg_match('/^-?[0-9]+$/', $row[$j]) or $row[$j] == 'NULL' or $row[$j] == 'null')
                                        {
                                        $sql .= $row[$j];
                                        }
                                    else
                                        {
                                        $sql .= '"'.$row[$j].'"' ;
                                        }
                                    }
                                else
                                    {
                                    $sql.= 'NULL';
                                    }
 
                                if ($j < ($numFields-1))
                                    {
                                    $sql .= ',';
                                    }
                                }
 
                            if ($rowCount == $realBatchSize)
                                {
                                $rowCount = 0;
                                $sql.= ");\n"; //close the insert statement
                                }
                            else
                                {
                                $sql.= "),\n"; //close the row
                                }
 
                            $rowCount++;
                            }
                        }
 
                    $this->saveFile($sql);
                    $sql = '';
                    }
                }
            $sql.="\n\n";
            $this->obfPrint('OK');
            }
        if ($this->disableForeignKeyChecks === true)
            {
            $sql .= "SET foreign_key_checks = 1;\n";
            }
        $this->saveFile($sql);
        if ($this->gzipBackupFile)
            {
            $this->gzipBackupFile();
            }
        else
            {
            $this->obfPrint('Backup file succesfully saved to ' . $this->backupDir.'/'.$this->backupFile, 1, 1);
            }
        }
        catch (Exception $e)
            {
            print_r($e->getMessage());
            return false;
            }
    return true;
    }
    protected function saveFile(&$sql) {
        if (!$sql) return false;
        try {
            if (!file_exists($this->backupDir)) {
                mkdir($this->backupDir, 0777, true);
            }
            file_put_contents($this->backupDir.'/'.$this->backupFile, $sql, FILE_APPEND | LOCK_EX);
        } catch (Exception $e) {
            print_r($e->getMessage());
            return false;
        }
        return true;
    }
    
    protected function gzipBackupFile($level = 9) {
        if (!$this->gzipBackupFile) {
            return true;
        }
        $source = $this->backupDir . '/' . $this->backupFile;
        $dest =  $source . '.gz';
        $this->obfPrint('Gzipping backup file to ' . $dest . '... ', 1, 0);
        $mode = 'wb' . $level;
        if ($fpOut = gzopen($dest, $mode)) {
            if ($fpIn = fopen($source,'rb')) {
                while (!feof($fpIn)) {
                    gzwrite($fpOut, fread($fpIn, 1024 * 256));
                }
                fclose($fpIn);
            } else {
                return false;
            }
            gzclose($fpOut);
            if(!unlink($source)) {
                return false;
            }
        } else {
            return false;
        }
 
        $this->obfPrint('OK');
        return $dest;
    }

    public function obfPrint ($msg = '', $lineBreaksBefore = 0, $lineBreaksAfter = 1) {
        if (!$msg) {
            return false;
        }
        if ($msg != 'OK' and $msg != 'KO') {
            $msg = date("Y-m-d H:i:s") . ' - ' . $msg;
        }
        $output = '';
        if (php_sapi_name() != "cli") {
            $lineBreak = "<br />";
        } else {
            $lineBreak = "\n";
        }
        if ($lineBreaksBefore > 0) {
            for ($i = 1; $i <= $lineBreaksBefore; $i++) {
                $output .= $lineBreak;
            }                
        }
        $output .= $msg;
        if ($lineBreaksAfter > 0) {
            for ($i = 1; $i <= $lineBreaksAfter; $i++) {
                $output .= $lineBreak;
            }                
        }
        // Save output for later use
        $this->output .= str_replace('<br />', '\n', $output);
        echo $output;
        if (php_sapi_name() != "cli") {
            if( ob_get_level() > 0 ) {
                ob_flush();
            }
        }
        $this->output .= " ";
        flush();
    }
    public function getOutput() {
        return $this->output;
    }
}
error_reporting(E_ALL);
set_time_limit(900); // 15 minutes
if (php_sapi_name() != "cli")
    {
    echo '<div style="font-family: monospace;">';
    }

$backupDatabase = new Backup_Database(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, CHARSET);
$result = $backupDatabase->backupTables(TABLES, BACKUP_DIR) ? 'OK' : 'KO';
$backupDatabase->obfPrint('Backup result: ' . $result, 1);
$output = $backupDatabase->getOutput();
if (php_sapi_name() != "cli")
    {
    echo '</div>';
    }

if (isset($_GET['backup']) AND $_GET['backup'] == 'non')
    {
    echo '<a class ="lienmenu" href="../administration.php">Retour à l\'administration</a></br></br>';
    echo '<a class ="lienmenu" href="exporterbdd.php?table=autre&amp;backup=oui">Faire un backup</a></br>';
    }
else
    {
    echo '<a class ="lienmenu" href="../administration.php">Retour à l\'administration</a></br></br>';
    }
?>