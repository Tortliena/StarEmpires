    <div class = 'resume'>
    <div class = 'titreresume'>Résumé du tour :</br></div>
    <?php
    if (empty($_GET['id']))
      { $numspemessage = 0; }
    else { $numspemessage = $_GET['id']; }
    $reqres = $bdd->prepare('SELECT message FROM messagetour WHERE idjoumess = ? AND domainemess = ? AND numspemessage = ?');
    $reqres->execute(array($_SESSION['id'], $typemessage, $numspemessage));
       while ($repres = $reqres->fetch())
      {echo '<span class = \'texteresume\'>' . $repres['message'] . '</span></br>';
      $message = 1 ; }
    if (!isset($message)) {echo '<div class = \'texteresume\'>Rien d\'important ce tour </div></br>';}
    $reqres->closeCursor();
    ?>   </div>