<?php
if ($replvl['lvl'] > 3) 
    {
    $nombredeplanete = 0;
    $nombredepop = 0;
    $organisationtotale = 0;
    echo '<h3>Stats d\'empire :</h3>'; 
    $reqinfoplanete = $bd->prepare('SELECT COUNT(*) AS nbpop, organisation, nomplanete
                                    FROM c_population po 
                                    INNER JOIN c_planete pl ON pl.idplanete = po.idplanetepop 
                                    WHERE pl.idjoueurplanete = ?
                                    GROUP BY pl.idplanete');
    $reqinfoplanete->execute(array($_SESSION['id']));                                    
    while ($repinfoplanete  = $reqinfoplanete ->fetch())
      {
      $nombredeplanete++;
      $nombredepop = $nombredepop + $repinfoplanete['nbpop'];
      $organisationplanete = MIN(100, FLOOR($repinfoplanete['organisation']/$repinfoplanete['nbpop']/10));
      $organisationtotale = MIN(1000*$repinfoplanete['nbpop'], $repinfoplanete['organisation']) + $organisationtotale;
      
      if ($nombredeplanete == 1)
        {
        $texteinfobulle = $repinfoplanete['nomplanete'].' : '.$repinfoplanete['nbpop'].' de population. '.$organisationplanete.'% d\'organisation.';
        }
      else
        {
        $texteinfobulle .= '<br>'.$repinfoplanete['nomplanete'].' : '.$repinfoplanete['nbpop'].' de population. '.$organisationplanete.'% d\'organisation.';
        }
      }

    echo 'Votre empire compte '.$nombredepop.' de population réparti sur '.$nombredeplanete.' planètes.</br>';
    
    $organisationmoyenne = FLOOR($organisationtotale/$nombredepop/10);
    echo 'Organisation moyenne de votre empire : '.$organisationmoyenne.'%. ';

    include("../function/infobulle.php");
    infobulle($texteinfobulle, 'infobulle');
    }
?> 