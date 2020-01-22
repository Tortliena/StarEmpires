<!DOCTYPE html>
<html>
    <head>
  	    <meta charset="utf-8" />
    </head>

    <body>

<form method="post" action="traitement.php">
   <p>
       <label for="pseudo">Votre pseudo</label> : <input type="text" name="pseudo" id="pseudo" /><br />

       Label = Nom de la case du formulaire<br />
       For = permet d'envoyer vers le input.<br />
       id = lien label - formulaire<br />
       Name = variable du formulaire<br />

   </p>
</form>

<form method="post" action="traitement.php">
    <p>
        <label for="pseudo">Votre pseudo :</label>
        <input type="text" name="pseudo" id="pseudo" placeholder="Ex : Zozor" size="50" maxlength="100" /><br />

        maxlength = nb de caractères<br />
        Size = largeur<br />
        Placeholder = texte de base<br />
        Value = À la place de placeholder un texte prérempli<br /><br />

        <input type="password" name="pass" id="pass" /><br />

        Pour les mots de passe<br /><br />



       <label for="ameliorer">Comment pensez-vous que je pourrais améliorer mon site ?</label><br />
       <textarea name="ameliorer" id="ameliorer" rows="8" cols="45">Zut !</textarea><br />

       Zut = texte par défaut (pas de balise)<br /><br />
  </p>

<form method="post" action="traitement.php">
   <p>
       Cochez les aliments que vous aimez manger :<br />
       <input type="checkbox" name="frites" id="frites" /> <label for="frites">Frites</label><br />
       <input type="checkbox" name="steak" id="steak" /> <label for="steak">Steak haché</label><br />
       <input type="checkbox" name="epinards" id="epinards" /> <label for="epinards">Epinards</label><br />
       <input type="checkbox" name="huitres" id="huitres" /> <label for="huitres">Huitres</label><br />
       <input type="checkbox" name="choix" checked /><label for="choix">précheché !</label><br />

       Checked = précheché !<br />
<br />

   </p>
</form>

<form method="post" action="traitement.php">
   <p>
       Veuillez indiquer la tranche d'âge dans laquelle vous vous situez :<br />
       <input type="radio" name="age" value="moins15" id="moins15" /> <label for="moins15">Moins de 15 ans</label><br />
       <input type="radio" name="age" value="medium15-25" id="medium15-25" /> <label for="medium15-25">15-25 ans</label><br />
       <input type="radio" name="age" value="medium25-40" id="medium25-40" /> <label for="medium25-40">25-40 ans</label><br />
       <input type="radio" name="age" value="plus40" id="plus40" /> <label for="plus40">Encore plus vieux que ça ?!</label>
   </p>
  
</form>


<form method="post" action="traitement.php">
   <p>
       <label for="pays">Dans quel pays habitez-vous ?</label><br />
       <select name="pays" id="pays">
           <optgroup label="Europe">
               <option value="france">France</option>
               <option value="espagne">Espagne</option>
               <option value="italie">Italie</option>
               <option value="royaume-uni">Royaume-Uni</option>
           </optgroup>
           <optgroup label="Amérique">
               <option value="canada">Canada</option>
               <option value="etats-unis">Etats-Unis</option>
           </optgroup>
           <optgroup label="Asie">
               <option value="chine">Chine</option>
               <option value="japon">Japon</option>
           </optgroup>
       </select>
   </p>
</form>

    </body>
</html>


 AND idjoueurconst = :idjoueurconst