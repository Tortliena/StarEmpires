<?php 
/*
session_start();
require __DIR__ . '/../include/bddconnection.php'; 
require __DIR__ . '/../function/consommercreeritemsplanetemultiple.php';
require __DIR__ . '/../function/flotte.php';
include("../function/variable.php");
*/

$tempstransfert = variable(11);
$couttransfert = variable(12);

$reqplanetejoueur = $bd->prepare('SELECT idjoueurplanete, biens FROM c_planete WHERE idplanete = ?'); 
$requpdatevaisseau = $bd->prepare('UPDATE c_vaisseau SET idflottevaisseau = ? WHERE idvaisseau = ?');
$requpdateplanete = $bd->prepare('UPDATE c_planete SET biens = biens - ? WHERE idplanete = ?');
$reqdeletetransfert = $bd->prepare('DELETE FROM c_transfertvaisseau WHERE idtransfert = ?');
$reqtrouverflotte = $bd->prepare('SELECT idflotte FROM c_flotte WHERE idplaneteflotte = ?');
$reqcreerflotte = $bd->prepare('INSERT INTO c_flotte(idplaneteflotte) VALUES(?)');


$reqtransfert = $bd->query('SELECT * FROM c_transfertvaisseau'); 
while ($reptransfert = $reqtransfert->fetch())
    {
    // Cas des transfert à initier.

    if ($reptransfert['toursrestantstranfert'] == $tempstransfert)
        {
        // Info sur la planète d'arrivée.
        $reqplanetejoueur->execute(array($reptransfert['idplanetearrivee']));
        $repplanetejoueur = $reqplanetejoueur->fetch();
        
        // Changer id flotte du vaisseau = 0 = cas spécial pour le vaisseau.
        if ($repplanetejoueur['idjoueurplanete'] == $reptransfert['idjoueurtransfert'] AND $repplanetejoueur['biens'] >= $couttransfert)
            {
            $requpdatevaisseau->execute(array(0, $reptransfert['idvaisseautransfert']));

            // Permet de faire payer le cout du transfert à la planète d'arrivée.
            $requpdateplanete->execute(array($couttransfert, $reptransfert['idplanetearrivee']));
            }
        else
            {
            $reqdeletetransfert->execute(array($reptransfert['idtransfert']));
            }
        }

    if ($reptransfert['toursrestantstranfert'] < 2)
        {
        // Vérifier que planète d'arrivée = id du joueur. Si pas le cas, delete vaisseau.
        $reqplanetejoueur->execute(array($reptransfert['idplanetearrivee']));
        $repplanetejoueur = $reqplanetejoueur->fetch();

        if ($repplanetejoueur['idjoueurplanete'] == $reptransfert['idjoueurtransfert'])
            { // Changer id flotte du vaisseau pour le mettre en défense de la planète.
            $reqtrouverflotte->execute(array(-$reptransfert['idplanetearrivee']));
            $reptrouverflotte = $reqtrouverflotte->fetch();
            if (isset($reptrouverflotte['idflotte']))
                {// la flotte de défense de la planète existe et on va envoyer le vaisseau dedans. Valeur négative = flotte défensive.
                $idflotte = $reptrouverflotte['idflotte'] ;
                }
            else
                {// la flotte de défense n'existe pas, donc on la créé et on va envoyer le vaisseau dedans.
                $reqcreerflotte->execute(array(-$reptransfert['idplanetearrivee']));
                $idflotte = $bd->lastInsertId();
                }

            // Trouver l'id de la flotte de défense. Si pas trouver, créer la flotte. Mettre le vaisseau dans cette flotte.
            $requpdatevaisseau->execute(array($idflotte, $reptransfert['idvaisseautransfert']));
            }
        else
            { // Si le joueur ne possède plus la planète, détruire le vaisseau.
            disparitionvaisseau($reptransfert['idvaisseautransfert']);
            }

        // Supprimer transfert dans tous les cas.
        $reqdeletetransfert->execute(array($reptransfert['idtransfert']));
        }
    }

// Diminuer de un tous les transferts
$bd->query('UPDATE c_transfertvaisseau SET toursrestantstranfert = toursrestantstranfert - 1');
?>