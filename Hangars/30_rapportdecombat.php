<?php
$a = 0;
$reqrapportdecombatdefense = $bdg->prepare('SELECT idflotteattaquant, textedefenseur FROM rapportcombat WHERE idflottedefenseur = ?');
$reqrapportdecombatdefense->execute(array($_GET['id'])); 
while($reprapportdecombatdefense = $reqrapportdecombatdefense->fetch()) 
  {
  if ($a == 0)
    {
    echo '<h2>Rapport de combat : Flotte attaquée</h2>';    
    }
  $a++;
  echo $reprapportdecombatdefense['textedefenseur'];
  }

$a = 0;
$reqrapportdecombatattaque = $bdg->prepare('SELECT idflottedefenseur, texteattaquant FROM rapportcombat WHERE idflotteattaquant = ?');
$reqrapportdecombatattaque->execute(array($_GET['id'])); 
while($reprapportdecombatattaque = $reqrapportdecombatattaque->fetch()) 
  {
  if ($a == 0)
    {
    echo '<h2>Rapport d\'offensive :</h2>';    
    }
  $a++;
  echo $reprapportdecombatattaque['texteattaquant'];
  }
?>