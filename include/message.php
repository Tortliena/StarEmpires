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
        echo 'Vous lancez la transformation de ' . $_SESSION['message1'] . ' ' . $_SESSION['message2'] . ' en ' . $_SESSION['message3'] . '. '; 
        if ($_SESSION['message4'] >= 0) 
            { 
            echo 'Cela va couter ' . $_SESSION['message4'] . ' biens.' ; 
            } 
        else 
            { 
            echo 'Cela va rapporter ' . -$_SESSION['message4'] . ' biens.' ; 
            } 
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
        echo "Recherche prioritisé !"; 
    break; 
 
    case 18: 
        echo "Veuillez entrer un nouveau nom pour renommer."; 
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
        echo "Renommage effectif !"; 
    break; 
 
    case 27: 
        echo "Choix prit en compte."; 
    break; 
 
    case 28: 
        echo "Vous n'avez pas assez en stock pour lancer autant de fois ce projet."; 
    break; 
 
    case 29: 
        if (isset($_SESSION['message1'])) 
            {
            $a = $_SESSION['message1'] - $_SESSION['message2'];
            echo "Votre limite pour ce bâtiment est de " . $_SESSION['message1'] . ". Vous en avez " . $_SESSION['message2'] . ". Vous pouvez donc lancer la construction au maximum de " . $a . ".";
            }
    break; 
 
    case 30:
        if (isset($_SESSION['message1']))
            {
            echo "Votre limite pour cette population est de " . $_SESSION['message1'] . ". Vous ne pouvez donc pas convertir autant de population." ;
            }
    break; 
 
    case 31: 
        echo "Erreur non spécifiée !" ; 
    break; 
 
    case 32: 
        echo "Saut enregistré." ; 
    break;
 
    case 35: 
        echo "Pas de champs d'astéroides à proximité !" ; 
    break; 
 
    case 36: 
        echo "Ce vaisseau n'a pas de marchandise dans les soutes !" ; 
    break; 
 
    case 37: 
        echo "Ce vaisseau n'est pas endommagé !" ; 
    break; 
 
    case 38:
        if (isset($_SESSION['message1']))
            {
            echo "Vous venez d'ordonner à ce vaisseau d'aller en " . $_SESSION['message1'] . "-" . $_SESSION['message2']; 
            }
    break; 
 
    case 39: 
        echo "Vous venez d'ordonner à ce vaisseau de récolter les ressources présentes."; 
    break; 
 
    case 40: 
        echo "Vous venez d'ordonner à ce vaisseau de décharger ses soutes sur votre planète."; 
    break; 
    case 41: 
        echo "Pas de chantier de réparation à proximité !"; 
    break; 
 
    case 42: 
        echo "Il faut cocher la case pour cette action."; 
    break; 
 
    case 43: 
        echo "Cet ordre partiellement exécuté. Si vous voulez complètement l'annuler, vous devez cocher la case et retenter l'annulation. Votre avancement sera perdu."; 
    break; 
 
    case 44: 
        echo "Vous venez de lancer la réparation de ce vaisseau."; 
    break; 
 
    case 45: 
        echo "Vous venez d'ordonner à votre vaisseau de partir dans l'espace."; 
    break; 
 
    case 46: 
        echo "Attaque lancée !"; 
    break; 
 
    case 47: 
        echo "Votre vaisseau est actuellement occupé et ne peut pas suivre un ordre."; 
    break; 
 
    case 48: 
        echo "Vous avez annulé l'ordre de minage."; 
    break; 
 
    case 49: 
        echo "Vous avez annulé l'ordre de minage."; 
    break; 
 
    case 50: 
        echo "Vous n'avez pas l'autorisation de passer le tour."; 
    break; 
 
    case 51: 
        echo "Vous n'avez pas les droits d'administration suffisants."; 
    break; 
 
    case 52: 
        echo "Votre vaisseau va rester en orbite de la planète."; 
    break; 
 
    case 53: 
        echo "Vous venez d'annuler l'attaque."; 
    break; 
 
    case 55: 
        echo "Nouveau concept de vaisseau créé !"; 
    break; 
 
    case 56: 
        echo "Vous devez nommer votre design. Le nom ne doit pas être seulement des chiffres."; 
    break; 
 
    case 57: 
        echo "Cette construction devrait apparaitre en dernier dans la liste de construction et sera executé après toutes les autres. </br>Vous allez néanmoins dépenser des ressources pour cette construction si vous ne pouvez pas les dépenser pour les autres."; 
    break; 
 
    case 58: 
        echo "Cette construction est sur pause. Aucune ressource ne sera dépensée pour elle."; 
    break; 
 
    case 59: 
        echo "Vous reprenez la construction."; 
    break; 
 
    case 60: 
        echo "Conversion de pop annulée."; 
    break; 
 
    case 61: 
        echo "Les composants nécessaire pour vaisseau vont être produit. Revenez une fois les composants présents sur votre planète."; 
    break; 
 
    case 62: 
        echo "Vous êtes en train d'essayer d'annuler une construction d'un vaisseau (cas particulier). Vous devez cocher la case pour annuler et aucune ressource ne vous sera remboursée (composants inclus)."; 
    break; 
 
    case 63: 
        if (isset($_SESSION['message1'])) 
            { 
            echo "Vous avez lancé la production de " . $_SESSION['message1'] . " " . $_SESSION['message2'] . " ! Notez que vous ne pouvez lancer la production de vaisseau que un par un."; 
            } 
    break; 
    case 64: 
        echo "Votre vaisseau est trop gros pour ses moteurs. Mettez moins de composants."; 
    break; 
 
    case 65: 
        echo "Composant ajouté !"; 
    break; 

    case 66: 
        echo "Erreur dans le vaisseau sélectionné."; 
    break; 

    case 67: 
        echo "Plan de vaisseau supprimé"; 
    break;
    
    case 68: 
        echo "Flotte créée. Vous voici sur la page associée à elle !"; 
    break;
    
    case 69: 
        echo "Votre vaisseau vient de rejoindre cette flotte."; 
    break;
    
    case 70: 
        echo "Vous venez d'envoyer votre vaisseau rejoindre la planète."; 
    break;

    case 71:
        echo "Vous venez de livrer des biens sur votre planète";
    break;

    case 72:
        echo "Vente effectuée !";
    break;

    case 73:
        echo "Achat effectué !";
    break;

    case 74:
        echo "Composant retiré";
    break;

    case 75:
        echo "Plan de vaisseau modifié";
    break;

    case 76:
        echo "Impossible de modifier ce plan, il est actuellement utilisé dans nos usines.";
    break;

    case 77:
        echo "La première construction et celle que vous avez priorisé devraient être inversé maintenant.";
    break;

    case 78:
        echo "Ordre de destruction d'un batiment enregistré.";
    break;

    case 79:
        echo "Annulation de la destruction du batiment.";
    break;

    case 80:
        echo "Plan réinitialisé.";
    break;

    case 81:
        echo "Restauration planétaire lancée !";
    break;

    case 82:
        echo "Amélioration planétaire lancée !";
    break;

    case 83:
        echo "Colonisation lancée !";
    break;

    case 84:
        echo "Tour encore en cours !";
    break;

    case 85:
        echo "Vous venez de passer un tour. Ce tour fait partie du tutoriel, cela n'affecte que vous. Les tours communs ont lieu 1 fois par jour.";
    break;

    case 86:
        echo "Vous ne pouvez pas ordonner plus de transfert de vaisseaux. Attendez que certains transferts se finissent ou annuler des ordres de transferts.";
    break;

    case 87:
        echo "Votre vaisseau doit forcément être transférer vers une autre planète.";
    break;

    case 88:
        echo "Transfert démarré.";
    break;

    case 89:
        echo "Transfert annulé.";
    break;

    case 90:
        echo "Vaisseau en cours de transfert. Impossible de lui donner un ordre.";
    break;

    case 91:
        echo "Le tour devrait être débloquer. Mais pourquoi il a bugué le con déjà ?";
    break;

    case 92:
        echo "Le dernier tour n'était pas bloqué. Tu fais quoi bordel ?!";
    break;
    }
 
unset($_SESSION['message1']); 
unset($_SESSION['message2']); 
unset($_SESSION['message3']); 
unset($_SESSION['message4']); 
?></div>