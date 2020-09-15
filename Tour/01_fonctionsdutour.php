<?php
// Fonction permettant de créer une recherche :
function creerrecherche($idrecherche, $idjoueur)
  {
  require __DIR__ . '/../include/bddconnection.php';
  $reqrechercheexistedeja = $bd->prepare('SELECT idrechprinc FROM c_rech_joueur WHERE idrech = ? AND idjoueurrecherche = ?');
  $reqrechercheexistedeja->execute(array($idrecherche, $idjoueur));
  $reprechercheexistedeja = $reqrechercheexistedeja->fetch();

  if ($reprechercheexistedeja['idrechprinc'] == 0)
    {
    $prixrech = $bd->prepare("SELECT prixrecherche, nomrecherche FROM a_recherche WHERE idrecherche = ? ");
    $reqcreerrecherche = $bd->prepare("INSERT INTO c_rech_joueur(idjoueurrecherche, ordrerecherche, idrech, rechnesc) VALUES (?,?,?,?)");  
    
    $prixrech->execute(array($idrecherche));
    $repprixrech = $prixrech->fetch();
    $aleatoirerecherche = rand(100 , 200) ;
    $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
    $reqcreerrecherche->execute(array($idjoueur, 1, $idrecherche, $reelprixrech));
    $dernierIDrecherche = $bd->lastInsertId(); 

    $requpdaterecherche = $bd->prepare('UPDATE c_rech_joueur SET ordrerecherche = ? WHERE idrechprinc = ?');
    $requpdaterecherche->execute(array($dernierIDrecherche, $dernierIDrecherche));

    $reqmessageinterne = $bd->prepare('INSERT INTO c_messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
    
    $mess = 'Nous pouvons maintenant recherche "'.$repprixrech['nomrecherche'].'". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.'; 
    $reqmessageinterne->execute(array('Ministre de la recherche', $idjoueur, 0, 'Nouvelle recherche disponible', $mess));
    }
  }
// À utiliser :  creerrecherche( X (= num recherche) , $replvl['id']);

function monterniveau($idjoueur, $lvl)
  {
  require __DIR__ . '/../include/bddconnection.php';
  // Monter de niveau 
  $reqlvlup = $bd->prepare('UPDATE c_utilisateurs SET lvl = lvl + 1 WHERE id = ?');
  $reqlvlup->execute(array($idjoueur));

  // Trouver recherche du niveau et qui ont une recherche prérequise :
  $reqrechercheduniveauavecprereq = $bd->prepare('SELECT r.idrecherche FROM a_recherche r INNER JOIN c_rech_joueur rj ON rj.idrech = r.recherchenecessaire WHERE r.niveauminimal = ? AND rj.rechposs = 1');
  $reqrechercheduniveauavecprereq->execute(array($lvl));
  while ($reprechercheduniveau = $reqrechercheduniveauavecprereq->fetch())
    {
    creerrecherche($reprechercheduniveau['idrecherche'], $idjoueur);
    }
    
  // Trouver recherche du niveau sans recherche pré-requises
  $reqrechercheduniveausansprereq = $bd->prepare('SELECT idrecherche FROM a_recherche WHERE niveauminimal = ? AND recherchenecessaire = 0');
  $reqrechercheduniveausansprereq->execute(array($lvl));
  while ($reprechercheduniveau = $reqrechercheduniveausansprereq->fetch())
    {
    creerrecherche($reprechercheduniveau['idrecherche'], $idjoueur);
    }
  $Commentairestour = 'Le joueur '.$idjoueur.' est monté au niveau '.$lvl.'<br>';
  return $Commentairestour;
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

function gestiondegats($idvaisseauquisefaittirerdessus, $pvvaisseau, $degatdutir, $idarme, $idvaisseauquitire, $idflotteattaquant, $idflottedefenseur, $sensbataille)
  {
  // Si sensbataille = 1 = vaisseau qui tire = flotte attaquant. Si sensbataille = 2 = vaisseau qui tire = flotte defense.
  require __DIR__ . '/../include/bddconnection.php';
  $reqdiminuernbtir = $bd->prepare("UPDATE c_composantvaisseau SET tirrestant = tirrestant-1 WHERE idtable = ?");
  $reqdiminuernbtir->execute(array($idarme));

  $nvpv = $pvvaisseau - $degatdutir;
  $Commentairestour = 'Le vaisseau '.$idvaisseauquisefaittirerdessus.' se fait tirer dessus par le vaisesau '.$idvaisseauquitire.', il perd '.$degatdutir.' PV.<br>';
  
  $texte1 = '<br>Votre vaisseau ('.$idvaisseauquitire.') vient de tirer sur un vaisseau ennemi ('.$idvaisseauquisefaittirerdessus.'). '.$degatdutir.' dégâts infligés.';
  $texte2 = '<br>Votre vaisseau ('.$idvaisseauquisefaittirerdessus.') se fait tirer dessus par un vaisseau ennemi ('.$idvaisseauquitire.'). '.$degatdutir.' dégâts recus.';

  if ($nvpv < 0)
    {
    $texte1 .= ' Vaisseau détruit.';
    $texte2 .= ' Vaisseau détruit.';

    $Commentairestour .= 'Le vaisseau '.$idvaisseauquisefaittirerdessus.' vient de se faire détruire.<br>';
    $reqinfopvvaisseau = $bd->prepare('  SELECT p.idjoueurplanete, v.nomvaisseau, f.xflotte, f.yflotte, f.universflotte, v.biensvaisseau, v.titanevaisseau, f.idplaneteflotte
                                          FROM c_vaisseau v
                                          INNER JOIN c_flotte f ON f.idflotte = v.idflottevaisseau
                                          LEFT JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                                          WHERE v.idvaisseau = ?');
    $reqinfopvvaisseau->execute(array($idvaisseauquisefaittirerdessus));
    $repinfopvvaisseau = $reqinfopvvaisseau->fetch();

    $reqcreerasteroides = $bd->prepare('INSERT INTO c_champsasteroides (xaste , yaste , uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)');

    if ($repinfopvvaisseau['idjoueurplanete'] != 0)
      { // On envoit ce message uniquement aux joueurs.
      $textemessage = 'Nous avons perdu le vaisseau ' . $repinfopvvaisseau['nomvaisseau'] . ' en ' . $repinfopvvaisseau['xflotte'] . '-' . $repinfopvvaisseau['yflotte'] . ' lors d\'une bataille spatiale.' ; 
      $reqmessageinterne = $bd->prepare('INSERT INTO c_messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
      $reqmessageinterne->execute(array('Amirauté', $repinfopvvaisseau['idjoueurplanete'], 0, 'Perte d\'un vaisseau', $textemessage));
      }
  
    // Créer champs d'astéroides : Reprendre le prix du vaisseau
    $nbchampsastebien = floor(($repinfopvvaisseau['biensvaisseau'] / 150));
    $nbchampsastetitane = floor(($repinfopvvaisseau['titanevaisseau'] / 30));

    if ($nbchampsastebien > 0)
      {
      $reqcreerasteroides->execute(array($repinfopvvaisseau['xflotte'], $repinfopvvaisseau['yflotte'], $repinfopvvaisseau['universflotte'], 6, $nbchampsastebien));
      }
    if ($nbchampsastetitane > 0)
      {
      $reqcreerasteroides->execute(array($repinfopvvaisseau['xflotte'], $repinfopvvaisseau['yflotte'], $repinfopvvaisseau['universflotte'], 8, $nbchampsastetitane));
      }

    $reqinfocargo = $bd->prepare("SELECT typeitems, quantiteitems FROM c_cargovaisseau WHERE idvaisseaucargo = ?");
    $reqinfocargo->execute(array($idvaisseauquisefaittirerdessus));
    while ($repinfocargo = $reqinfocargo->fetch())
      { // Cas d'un vaisseau trouvé dans le 1er univers
      $reqcreerasteroides->execute(array($repinfopvvaisseau['xflotte'], $repinfopvvaisseau['yflotte'], $repinfopvvaisseau['universflotte'], $repinfocargo['typeitems'], $repinfocargo['quantiteitems']));
      }

    // cargovaisseau
    $reqdeletecargo = $bd->prepare("DELETE FROM c_cargovaisseau WHERE idvaisseaucargo = ?");
    $reqdeletecargo->execute(array($idvaisseauquisefaittirerdessus));

    // composantvaisseau
    $reqdeletecomposant = $bd->prepare("DELETE FROM c_composantvaisseau WHERE idvaisseaucompo = ?");
    $reqdeletecomposant->execute(array($idvaisseauquisefaittirerdessus));

    // vaisseau
    $reqdeletevaisseau = $bd->prepare("DELETE FROM c_vaisseau WHERE idvaisseau = ?");
    $reqdeletevaisseau->execute(array($idvaisseauquisefaittirerdessus));
    }
  else
    {
    $reqdiminuerpvvaisseau = $bd->prepare('UPDATE c_vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
    $reqdiminuerpvvaisseau->execute(array($nvpv, $idvaisseauquisefaittirerdessus));
    }

  $reqtrouverrapportdecombat = $bd->prepare('SELECT idrapportcombat FROM c_rapportcombat WHERE idflotteattaquant = ? AND idflottedefenseur = ?');
  $reqtrouverrapportdecombat->execute(array($idflotteattaquant, $idflottedefenseur));
  $reptrouverrapportdecombat = $reqtrouverrapportdecombat->fetch();

  // Vérifier si le rapport existe. Si ce n'est pas le cas, le créer.
  if (!isset($reptrouverrapportdecombat['idrapportcombat']))
    {
    $reqcreerrapportcombat = $bd->prepare('INSERT INTO c_rapportcombat(idflotteattaquant, idflottedefenseur, texteattaquant, textedefenseur) VALUES(?, ?, ?, ?)');
    $texteattaquant = 'Début du rapport de combat. Vous attaquez une flotte ('.$idflottedefenseur.').';
    $textedefenseur = 'Début du rapport de combat. Vous êtes attaqués par une flotte ('.$idflotteattaquant.').';
    $reqcreerrapportcombat->execute(array($idflotteattaquant, $idflottedefenseur, $texteattaquant, $textedefenseur));
    }

  if($sensbataille == 1)
    {
    $textesupplementaireattaquant = $texte1;
    $textesupplementairedefenseur = $texte2;
    }
  elseif($sensbataille == 2)
    {
    $textesupplementaireattaquant = $texte2;
    $textesupplementairedefenseur = $texte1;
    }

  // Le compléter.
  $requpdaterapportcombat = $bd->prepare('UPDATE c_rapportcombat
                                          SET texteattaquant = concat(texteattaquant, ?), textedefenseur = concat(textedefenseur, ?)
                                          WHERE idflotteattaquant = ? AND idflottedefenseur = ?');
  $requpdaterapportcombat->execute(array($textesupplementaireattaquant, $textesupplementairedefenseur, $idflotteattaquant, $idflottedefenseur));

  return $Commentairestour;
  }

function disparitionvaisseau($idvaisseau)
  {
  require __DIR__ . '/../include/bddconnection.php';
    // cargovaisseau
    $reqdeletecargo = $bd->prepare("DELETE FROM c_cargovaisseau WHERE idcargovaisseau = ?");
    $reqdeletecargo->execute(array($idvaisseau));

    // composantvaisseau
    $reqdeletecomposant = $bd->prepare("DELETE FROM c_composantvaisseau WHERE idvaisseaucompo = ?");
    $reqdeletecomposant->execute(array($idvaisseau));

    // vaisseau
    $reqdeletevaisseau = $bd->prepare("DELETE FROM c_vaisseau WHERE idvaisseau = ?");
    $reqdeletevaisseau->execute(array($idvaisseau));
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