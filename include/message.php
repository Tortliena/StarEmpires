<div class = 'alerte'>
<?php
    if (empty($_GET["message"]) or !isset($_GET["message"]))
    {
    $_GET["message"] = 0 ;  
    }
switch ($_GET["message"])
    { 
    case 1:
        echo "les deux mots de passe ne sont pas identiques. Veuillez réessayer.";
    break;
    
    case 2:
        echo "Veuillez entrer un mot de passe pour vous inscrire !";
    break;
    
    case 3: 
        echo "Pseudo déjà utilisé.";
    break;
    
    case 4: 
        echo "Votre compte a bien été créé !";
    break;
    
    case 5:
        echo "Vous n'avez pas entré de pseudo ! Veuillez réessayer";
    break;
    
    case 6:
        echo 'Mauvais identifiant ou mot de passe !';
    break;
    
    case 7:
        echo "Le pseudo que vous avez entré n'existe pas";
    break;

    case 8:
        echo "Vous êtes déconnecté maintenant";
    break;

    case 9:
        echo "Vous ne pouvez pas convertir ce nombre de population !";
    break;

    case 10:
        if (empty($_SESSION['message1']) or !isset($_SESSION['message1']))
        {
        }
        else
        {
        echo "Vous lancé la transformation de ";
        echo $_SESSION['message1'];
        echo ' ';
        echo $_SESSION['message2'];
        echo " en ";
        echo $_SESSION['message3'];
        echo " ! Cela va vous couter ";
        echo $_SESSION['message4'];
        echo " biens.";
        }
    break;

    case 11:
        echo "La quantité lors de l'ordre de construction est incorrecte";
    break;

    case 12:
        if (empty($_SESSION['message1']) or !isset($_SESSION['message1']))
        {
        }
        else
        {   
        echo "Vous avez lancé la production de " . $_SESSION['message1'] . " " . $_SESSION['message2'] . " !";
        }
        
    break;

    case 13:
        echo "La construction a bien été annulée !";
    break;

    case 14:
        echo "Votre construction est déjà avancée. Si vous voulez complètement l'annuler, vous devez cocher la case et retenter l'annulation.";
    break;

    case 15:
        $_SESSION = array();
        session_destroy();
        setcookie('login', '');
        setcookie('pass_hache', '');
        header('Location: accueil.php?message=16');
    break;

    case 16:
        echo "Votre compte a été supprimé avec succès.";
    break;

    case 17:
        echo "Recherche lancée !";
    break;

    case 18:
        echo "Veuillez entrer un nouveau nom pour votre vaisseau.";
    break;

    case 19:
        echo "Vous devez entrer des coordonnées différentes de celles actuelles.";
    break;
    case 20:
        echo "Ordre de déplacement supprimé";
    break;

    case 21:
        echo "Veuillez entrer un destinataire."; 
    break;

    case 22:
        echo "Veuillez entrer un texte."; 
    break;

    case 23:
        echo "Message envoyé"; 
    break;

    case 24:
        echo "Vous ne pouvez pas convertir une population en elle même."; 
    break;

    case 25:
        echo "Message supprimé."; 
    break;

    case 26:
        echo "Vaisseau renommé.";
    break;

    case 27:
        echo "Choix prit en compte.";
    break;

    case 28:
        echo "Vous n'avez pas assez en stock pour lancer autant de fois ce projet.";
    break;
    case 29:
        if (empty($_SESSION['message1']) or !isset($_SESSION['message1']))
        {
        }
        else
        {
        $a = $_SESSION['message1'] - $_SESSION['message2'] ;
        echo "Votre limite pour ce bâtiment est de " . $_SESSION['message1'] . ". Vous en avez " . $_SESSION['message2'] . ". Vous pouvez donc lancer la construction au maximum de " . $a . ".";
        }
    break;
    case 30:
        echo "Votre limite pour cette population est de " . $_SESSION['message1'] . ". Vous ne pouvez donc pas convertir autant de population." ;
    break;
    case 31:
        echo "Erreur non spécifiée !" ;
    break;
    case 32:
        echo "Vous venez de lancer une rénovation du vaisseau." ;
    break;
    case 33:
        echo "Rénovation du vaisseau annulée" ;
    break;
    case 34:
        echo "Vous devez annuler l'ordre de rénovation avant de donner tout autre ordre à ce vaisseau." ;
    break;
    case 35:
        echo "Pas de champs d'astéroides à proximité !" ;
    break;
    case 36:
        echo "Ce vaisseau n'a pas de marchandise dans les soutes !" ;
    break;
    }

unset($_SESSION['message1']);
unset($_SESSION['message2']);
unset($_SESSION['message3']);
unset($_SESSION['message4']);
?></div>