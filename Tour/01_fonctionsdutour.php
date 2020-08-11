<?php
// Fonction permettant de créer une recherche :
function creerrecherche($idrecherche, $idjoueur)
  {
  require __DIR__ . '/../include/BDDconnection.php';
  $reqrechercheexistedeja = $bdg->prepare('SELECT idrechprinc FROM rech_joueur WHERE idrech = ? AND idjoueurrecherche = ?');
  $reqrechercheexistedeja->execute(array($idrecherche, $idjoueur));
  $reprechercheexistedeja = $reqrechercheexistedeja->fetch();

  if ($reprechercheexistedeja['idrechprinc'] == 0)
    {
    $prixrech = $bdd->prepare("SELECT prixrecherche, nomrecherche FROM recherche WHERE idrecherche = ? ");
    $reqcreerrecherche = $bdg->prepare("INSERT INTO rech_joueur(idjoueurrecherche, ordrerecherche, idrech, rechnesc) VALUES (?,?,?,?)");  
    
    $prixrech->execute(array($idrecherche));
    $repprixrech = $prixrech->fetch();
    $aleatoirerecherche = rand(100 , 200) ;
    $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
    $reqcreerrecherche->execute(array($idjoueur, 1, $idrecherche, $reelprixrech));
    $dernierIDrecherche = $bdg->lastInsertId(); 

    $requpdaterecherche = $bdg->prepare('UPDATE rech_joueur SET ordrerecherche = ? WHERE idrechprinc = ?');
    $requpdaterecherche->execute(array($dernierIDrecherche, $dernierIDrecherche));

    $reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
    
    $mess = 'Nous pouvons maintenant recherche "'.$repprixrech['nomrecherche'].'". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.'; 
    $reqmessageinterne->execute(array('Ministre de la recherche', $idjoueur, 0, 'Nouvelle recherche disponible', $mess));
    }
  }
// À utiliser :  creerrecherche( X (= num recherche) , $replvl['id']);

function monterniveau($idjoueur, $lvl)
  {
  require __DIR__ . '/../include/BDDconnection.php';
  // Monter de niveau 
  $reqlvlup = $bdg->prepare('UPDATE utilisateurs SET lvl = lvl + 1 WHERE id = ?');
  $reqlvlup->execute(array($idjoueur));

  // Trouver recherche du niveau :
  $reqrechercheduniveau = $bdd->prepare('SELECT r.idrecherche FROM recherche r INNER JOIN gamer.rech_joueur rj ON rj.idrech = r.recherchenecessaire WHERE r.niveauminimal = ? AND rj.rechposs = 1');
  $reqrechercheduniveau->execute(array($lvl));
  while ($reprechercheduniveau = $reqrechercheduniveau->fetch())
    {
    creerrecherche($reprechercheduniveau['idrecherche'], $idjoueur);
    }
  }

function nombrealeatoireavecpoid(array $ValeurPoid)
  {
  $rand = RAND(1, (int) array_sum($ValeurPoid));
  foreach ($ValeurPoid as $key => $value)
    {
    $rand -= $value;
    if ($rand <= 0)
      {
      return $key;
      }
    }
  }

function gestiondegats($idvaisseauquisefaittirerdessus, $pvvaisseau, $degatdutir, $idarme, $idvaisseauquitire)
  {
  require __DIR__ . '/../include/BDDconnection.php';

  echo '<br>'. $idvaisseauquisefaittirerdessus . ' id du vaisseau qui se fait tirer dessus.<br>';
  echo $pvvaisseau . ' valeur de ses PV.<br>';

  $reqdiminuernbtir = $bdg->prepare("UPDATE composantvaisseau SET tirrestant = tirrestant-1 WHERE idtable = ?");
  $reqdiminuernbtir->execute(array($idarme));

  $nvpv = $pvvaisseau - $degatdutir;

  echo $nvpv .' nouveaux pv du vaisseau <br>';
  
  if ($nvpv < 0)
    {
    $reqinfopvvaisseau = $bdg->prepare('  SELECT p.idjoueurplanete, v.nomvaisseau, f.xflotte, f.yflotte, f.universflotte, v.biensvaisseau, v.titanevaisseau, f.idplaneteflotte
                                          FROM vaisseau v
                                          INNER JOIN flotte f ON f.idflotte = v.idflottevaisseau
                                          LEFT JOIN planete p ON p.idplanete = f.idplaneteflotte
                                          WHERE v.idvaisseau = ?');
    $reqinfopvvaisseau->execute(array($idvaisseauquisefaittirerdessus));
    $repinfopvvaisseau = $reqinfopvvaisseau->fetch();

    $reqcreerasteroides = $bda->prepare('INSERT INTO champsasteroides (xaste , yaste , uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)');

    if ($repinfopvvaisseau['idjoueurplanete'] != 0)
      { // On envoit ce message uniquement aux joueurs.
      $textemessage = 'Nous avons perdu le vaisseau ' . $repinfopvvaisseau['nomvaisseau'] . ' en ' . $repinfopvvaisseau['xflotte'] . '-' . $repinfopvvaisseau['yflotte'] . ' lors d\'une bataille spatiale.' ; 
      $reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
      $reqmessageinterne->execute(array('Amirauté', $repinfopvvaisseau['idjoueurplanete'], 0, 'Perte d\'un vaisseau', $textemessage));
      }
  
    // Créer champs d'astéroides : Reprendre le prix du vaisseau
    $nbchampsastebien = floor(($repinfopvvaisseau['biensvaisseau'] / 150));
    $nbchampsastetitane = floor(($repinfopvvaisseau['titanevaisseau'] / 30));

    if ($nbchampsastebien > 0)
      {
      echo 'vaisseau détruit, donc on fait des astéroides normaux. <br>';
      $reqcreerasteroides->execute(array($repinfopvvaisseau['xflotte'], $repinfopvvaisseau['yflotte'], $repinfopvvaisseau['universflotte'], 6, $nbchampsastebien));
      }
    if ($nbchampsastetitane > 0)
      {
      $reqcreerasteroides->execute(array($repinfopvvaisseau['xflotte'], $repinfopvvaisseau['yflotte'], $repinfopvvaisseau['universflotte'], 8, $nbchampsastetitane));
      }

    $reqinfocargo = $bdg->prepare("SELECT typeitems, quantiteitems FROM cargovaisseau WHERE idcargovaisseau = ?");
    $reqinfocargo->execute(array($idvaisseauquisefaittirerdessus));
    while ($repinfocargo = $reqinfocargo->fetch())
      { // Cas d'un vaisseau trouvé dans le 1er univers
      $reqcreerasteroides->execute(array($repinfopvvaisseau['xflotte'], $repinfopvvaisseau['yflotte'], $repinfopvvaisseau['universflotte'], $repinfocargo['typeitems'], $repinfocargo['quantiteitems']));
      }

    // cargovaisseau
    $reqdeletecargo = $bdg->prepare("DELETE FROM cargovaisseau WHERE idcargovaisseau = ?");
    $reqdeletecargo->execute(array($idvaisseauquisefaittirerdessus));

    // composantvaisseau
    $reqdeletecomposant = $bdg->prepare("DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?");
    $reqdeletecomposant->execute(array($idvaisseauquisefaittirerdessus));

    // vaisseau
    $reqdeletevaisseau = $bdg->prepare("DELETE FROM vaisseau WHERE idvaisseau = ?");
    $reqdeletevaisseau->execute(array($idvaisseauquisefaittirerdessus));
    }
  else
    {
    $reqdiminuerpvvaisseau = $bdg->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
    $reqdiminuerpvvaisseau->execute(array($nvpv, $idvaisseauquisefaittirerdessus));
    }
  }

function disparitionvaisseau($idvaisseau)
  {
  require __DIR__ . '/../include/BDDconnection.php';
    // cargovaisseau
    $reqdeletecargo = $bdg->prepare("DELETE FROM cargovaisseau WHERE idcargovaisseau = ?");
    $reqdeletecargo->execute(array($idvaisseau));

    // composantvaisseau
    $reqdeletecomposant = $bdg->prepare("DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?");
    $reqdeletecomposant->execute(array($idvaisseau));

    // vaisseau
    $reqdeletevaisseau = $bdg->prepare("DELETE FROM vaisseau WHERE idvaisseau = ?");
    $reqdeletevaisseau->execute(array($idvaisseau));
  }

function disparitionflotte()
  {
  require __DIR__ . '/../include/BDDconnection.php';
  // Trouver les flotte qui n'ont pas de vaisseau et trouver leur ID.
  $reqrepositionnersurlaplanetemere = $bdg->prepare('UPDATE flotte SET xflotte = ?, yflotte = ?, universflotte = ?, universdestination = 0, xdestination = 0,   ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');
  $reqpositionplanetemere = $bdg->prepare('SELECT xplanete, yplanete, universplanete FROM planete WHERE idplanete = ?');
  $reqsupprimerflotte = $bdg->prepare('DELETE FROM flotte WHERE idflotte = ?');
  $reqsupprimerbataille = $bdg->prepare('DELETE FROM bataille WHERE idflottedefensive = ? OR idflotteoffensive = ?');

  $reqflottesansvaisseau = $bdg->query('SELECT f.idflotte, f.idplaneteflotte FROM flotte f LEFT JOIN vaisseau v ON f.idflotte = v.idflottevaisseau WHERE v.idflottevaisseau IS NULL');
  while ($repflottesansvaisseau = $reqflottesansvaisseau->fetch())
      {
      $idplanete = abs($repflottesansvaisseau['idplaneteflotte']);
      $reqpositionplanetemere->execute(array($idplanete));
      $reppositionplanetemere = $reqpositionplanetemere->fetch();
      if (isset($reppositionplanetemere['xplanete']))
        {
        $reqrepositionnersurlaplanetemere->execute(array($reppositionplanetemere['xplanete'], $reppositionplanetemere['yplanete'], $reppositionplanetemere['universplanete'], $repflottesansvaisseau['idflotte']));
        }
      else
        {
        $reqsupprimerflotte->execute(array($repflottesansvaisseau['idflotte']));
        }
      $reqsupprimerbataille->execute(array($repflottesansvaisseau['idflotte'], $repflottesansvaisseau['idflotte']));
      }

  $requpdateordre = $bdg->prepare('UPDATE flotte SET universdestination = 0, xdestination = 0, ydestination = 0, typeordre = 0, bloque = 0 WHERE idflotte = ?');

  $reqflotteattaquesanscible = $bdg->query('SELECT f.idflotte FROM flotte f LEFT JOIN bataille b ON b.idflotteoffensive = f.idflotte WHERE b.idbataille IS NULL AND typeordre = 5'); // type ordre 5 = bataille
  while ($repflotteattaquesanscible = $reqflotteattaquesanscible->fetch())
      {
      $requpdateordre->execute(array($repflotteattaquesanscible['idflotte']));
      }
  }

function generateurdenom($nbdecaractere)
    {
    $nom = "";
    $chaine = "abcdefghijklmnpqrstuvwxy";
    srand((double)microtime()*1000000);
    for($i=0; $i<$nbdecaractere; $i++)
        {
        $nom .= $chaine[rand()%strlen($chaine)];
        }
    return $nom;
    }
?>