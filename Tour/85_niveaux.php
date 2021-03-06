<?php 
/* 
session_start(); 
include("../include/bddconnection.php"); 
include("fonctionsdutour.php"); 
*/ 
 
$reqmessageinterne = $bd->prepare('INSERT INTO c_messagerieinterne(expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 
 
// Pour lvl 1 à 2 
$reqcountpop = $bd->prepare(' SELECT sum(case when po.typepop = ? then 1 else 0 end) AS nb 
                              FROM c_population AS po 
                              INNER JOIN c_planete AS pl ON po.idplanetepop = pl.idplanete 
                              WHERE pl.idjoueurplanete = ?');

// Pour lvl 2 à 3 
$reqrechechemoteur = $bd->prepare('SELECT COUNT(*) AS nb FROM c_rech_joueur WHERE idjoueurrecherche = ? AND rechposs = 1'); 
 
// Pour lvl 3 à 4
$reqvaisseausorti = $bd->prepare('  SELECT COUNT(*) AS nb
                                    FROM c_flotte f
                                    INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                    WHERE idjoueurplanete = ?'); 
 
// Pour lvl 4 à 5
$reqcompterexplo = $bd->prepare('SELECT COUNT(*) AS nb FROM c_explore WHERE idexplorateur = ?') ;

// Pour lvl 5 à 6 
$reqpvperdusurunvaisseau = $bd->prepare("   SELECT idvaisseau
                                            FROM c_vaisseau v
                                            INNER JOIN c_flotte f ON f.idflotte = v.idflottevaisseau
                                            INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                            WHERE HPmaxvaisseau <> HPvaisseau AND  idjoueurplanete = ?"); 

// Pour lvl 6 à 7 
$reqcomptersilo = $bd->prepare('  SELECT COUNT(*) AS nb FROM c_silo s
                                  INNER JOIN c_planete p ON p.idplanete = s.idplanetesilo
                                  WHERE p.idjoueurplanete = ?'); 

// Pour lvl 7 à 8 
$reqcomposantsurlevaisseau = $bd->prepare(" SELECT COUNT(*) AS nb  
                                            FROM c_composantvaisseau c 
                                            INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucompo
                                            INNER JOIN c_flotte f ON f.idflotte = v.idflottevaisseau
                                            INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                            WHERE p.idjoueurplanete = ?"); 
  
// Pour lvl 8 à 9 
$reqcompterplanete = $bd->prepare('SELECT COUNT(*) AS nb FROM c_planete WHERE idjoueurplanete = ?');
 
// Pour lvl 9 à 10 : 
$reqepavedetruite = $bd->prepare('SELECT COUNT(*) AS nb FROM c_flotte WHERE idplaneteflotte = 0 AND universflotte = ?'); 

// Pour lvl 10 à 11 : 
$reqnoyaudanslesilo = $bd->prepare('  SELECT COUNT(*) AS nb FROM c_silo s
                                      INNER JOIN c_planete p ON p.idplanete = s.idplanetesilo
                                      WHERE p.idjoueurplanete = ? AND s.iditems = ?'); 

// Pour lvl 11 à 12 : 
$reqflottedansuneautredimension = $bd->prepare('  SELECT COUNT(*) AS nb FROM c_flotte f
                                                  INNER JOIN c_planete p ON f.idplaneteflotte = p.idplanete
                                                  WHERE p.idjoueurplanete = ? AND universflotte = ?');

//Pour lvl 12 à 13 : 
$reqargentgalactique = $bd->prepare('SELECT creditgalactique FROM c_utilisateurs WHERE id = ?');

//Pour lvl 13 à 14 : 
// Voir 10-11, même fonction.

if ($tourrestraint == 'non')
    {
    $reqlvl = $bd->query('SELECT lvl, id from c_utilisateurs ORDER BY id ASC');
    }
else
    {
    $reqlvl = $bd->prepare('SELECT lvl, id from c_utilisateurs WHERE id = ?');
    $reqlvl->execute(array($_SESSION['id']));
    }
while($replvl = $reqlvl->fetch()) 
  {
  switch ($replvl['lvl'])
    {
    case 1:
      $reqcountpop->execute(array(2, $replvl['id']));
      $repcountouvrier = $reqcountpop->fetch();

      $reqcountpop->execute(array(3, $replvl['id']));
      $repcountscient = $reqcountpop->fetch();

      // Compter les ouvriers et les scientifiques, si au moins 1, alors monter de niveau.
      if ($repcountouvrier['nb']>0 AND $repcountscient['nb']>0)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        }
    break;

    case 2:
      $reqrechechemoteur->execute(array($replvl['id']));
      $reprechechemoteur = $reqrechechemoteur->fetch();
        // Si on a fait la recherche des moteurs interstellaires, alors monter niveau.
      if ($reprechechemoteur['nb']>0)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Conseil civil', $replvl['id'], 0, 'Développement', 'Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets.'));

        // Permet de creer un design pour le joueur.
        $reqcreerdesign = $bd->prepare('INSERT INTO c_vaisseau(idflottevaisseau, nomvaisseau) VALUES (?, ?)');
        $reqcreerdesign->execute(array(-$replvl['id'], 'Vaisseau d\'exploration'));
        }
    break;

    case 3:
      $reqvaisseausorti->execute(array($replvl['id']));
      $repvaisseausorti = $reqvaisseausorti->fetch();
      // Si un vaisseau est dehors, alors on monte de niveau.
      if ($repvaisseausorti['nb']>0)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        }
    break;

    case 4:
      $reqcompterexplo->execute(array($replvl['id']));
      $repcompterexplo  = $reqcompterexplo->fetch();
      // 6eme explo = planète.
      if ($repcompterexplo['nb']>6)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        }
    break;

    case 5:
      // Pour monter de niveau, il faut avoir perdu des points de vie d'un vaisseau.
      $reqpvperdusurunvaisseau->execute(array($replvl['id']));
      $reppvperdusurunvaisseau = $reqpvperdusurunvaisseau->fetch();
      if (isset($reppvperdusurunvaisseau['idvaisseau']))
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Amirauté', $replvl['id'], 0, 'Réparation et amélioration des vaisseaux', 'Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.'));
        }
    break;

    case 6:
      // Pour monter de niveau, il faut ramener quelque chose dans les silos. Ou construire de l'équipement.
      $reqcomptersilo->execute(array($replvl['id']));
      $repcomptersilo = $reqcomptersilo->fetch();
      if ($repcomptersilo['nb']>0)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        }
    break;

    case 7:
      // Pour monter de niveau, il équiper un composant.
      $reqcomposantsurlevaisseau->execute(array($replvl['id']));
      $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();
      if ($repcomposantsurlevaisseau['nb']>0)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        }
    break;

    case 8:
      // Pour monter de niveau, il faut construire une base spatiale.
      $reqcompterplanete->execute(array($replvl['id']));
      $repcompterplanete = $reqcompterplanete->fetch();
      if ($repcompterplanete['nb']>1)
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Amirauté', $replvl['id'], 0, 'Développement de la défense spatiale', 'les informations recueilli lors de la tentative d\'exploration de l\'épave nous indiquent qu\'il a existé des êtres capables de constuire des vaisseaux armés dans notre galaxie. D\'autre part, cette épave est ancienne, très avancée technologiquement mais nous pourrions arriver à détruire ses défenses avec les armes nécessaires. Cela nous permettrait d\'obtenir de précieuses informations ou technologies. Nous vous prions de lancer les recherches nécessaires et d\'envoyer 2 ou 3 vaisseaux biens équipés pour continuer l\'investigation de l\'épave.')); 
        } 
    break; 

    case 9: 
      // Pour monter de niveau, il faut détruire l'épave. 
      $reqepavedetruite->execute(array($replvl['id'])); 
      $repepavedetruite = $reqepavedetruite->fetch(); 
      if ($repepavedetruite['nb']<1) 
        { 
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Amirauté', $replvl['id'], 0, 'Victoire !', 'Nous avons réussi à détruire les défenses automatiques de l\'épave. Le vaisseau était en très mauvais état et la bataille à d\'autant plus dégradé le peu qu\'il en restait. Nous devrions cependant récupérer un maximum. Les débris contiennent de nombreuses matières rares et nous devrions trouver quelque chose d\'intéressant. Nous avons exploré quasiment intégralement notre univers et c\'est le seul artefact provenant d\'une civilisation ancienne. Ce vaisseau était bien armé et sans son état avancé de dégradation et avec un équipage, nous aurions était incapable d\'en venir à bout. Il ne nous semble pas possible qu\'une civilisation aussi avancée puisse disparaitre. Et surtout qu\'elle puisse disparaitre sans laisser de ruines ou une multitude d\'épaves derrière elle.')); 
        }   
    break; 

    case 10: 
      // Pour monter de niveau, analyser le composant inconnu. 
      $reqnoyaudanslesilo->execute(array($replvl['id'], 17)); 
      $repnoyaudanslesilo = $reqnoyaudanslesilo->fetch(); 
      // Compter les ouvriers et les scientifiques, si au moins 1, alors monter de niveau. 
      if ($repnoyaudanslesilo['nb']>0) 
        { 
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Département scientifique', $replvl['id'], 0, 'Propulseur non physique', 'L\'étude de l\'artefact trouvé dans l\'épave laisse à penser que nous sommes face à une sorte de propulseur non classique. Il semble que nous puissions voyager à travers une dimension différente que les 4 classiques. Cette théorie pourrait expliquer pourquoi nous n\'avons pas trouvé la moindre trace de civilisation dans notre univers en dehors de cette épave. Nous avons restauré dans la mesure de nos moyens le noyau et nous allons tenter de copier cette technologie. Mais notre maitrise de cette technologie est bien faible, et il n\'est pas sûr que notre maitrise approche celle de la race ayant produit ça')); 
        } 
    break; 

    case 11:
      $reqflottedansuneautredimension->execute(array($replvl['id'], -2));
      $repflottedansuneautredimension = $reqflottedansuneautredimension->fetch(); 
      // Compter les ouvriers et les scientifiques, si au moins 1, alors monter de niveau. 
      if ($repflottedansuneautredimension['nb']>0) 
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Département scientifique', $replvl['id'], 0, 'Nouvel univers', 'Nous venons de reprendre contact avec notre flotte disparue ! L\'équipe scientifique a réussi à bricoller un transmetteur pour nous rejoindre. Ils sont dans un autre univers !'));
        }
    break; 

    case 12: 
      $reqargentgalactique->execute(array($replvl['id']));
      $repargentgalactique = $reqargentgalactique->fetch();
      if ($repargentgalactique['creditgalactique']>0) 
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        }
    break;

    case 13:
      $reqflottedansuneautredimension->execute(array($replvl['id'], -3));
      $repflottedansuneautredimension = $reqflottedansuneautredimension->fetch(); 
      // Compter les ouvriers et les scientifiques, si au moins 1, alors monter de niveau. 
      if ($repflottedansuneautredimension['nb']>0) 
        {
        $Commentairestour .= monterniveau($replvl['id'], $replvl['lvl']+1);
        $reqmessageinterne->execute(array('Département scientifique', $replvl['id'], 0, 'Nouvel univers', 'Nous contrôlons maintenant bien mieux les voyages interdimentionnels et nous pouvons développer notre propre matériel !'));
        }
    break;

    } 
  }
?>