<?php
echo '<table class="silo"><caption><h3>Entrepôts</h3></caption><tr><td class="silo1ereligne">Objet</td><td class="silo1ereligne">Quantité</td><td class="silo1ereligne">Utilité</td></tr>';
if ($repplanete['biens']>0)
  {
  echo '<tr><td class="silonom">Biens divers</td>';
  echo '<td class="siloquantite">'.$repplanete['biens'].'</td>';
  echo '<td class="silodescription">Sous ce nom, vous retrouvez tout un ensemble de biens divers, allant des outils quotidiens aux grosses machines sans ressources particulières. Ils sont consommé lorsque vous lancez des productions, formez de la population ou régulièrement par toute la population. Ils sont produits par les citoyens. Cela représente le système économique classique de votre monde.</td></tr>';
  }
if ($repplanete['titane']>0)
  {
  echo '<tr><td class="silonom">Métaux rares</td>';
  echo '<td class="siloquantite">'.$repplanete['titane'].'</td>';
  echo '<td class="silodescription">Cela représente les métaux rares raffinés et prêts à être utilisés. Notre monde est extrêmement pauvres et l\'espace semble être un endroit propice pour en récupérer.</td></tr>';
  }
if ($repplanete['neutrinos']>0)
  {
  echo '<tr><td class="silonom">Neutrinos stabilisés</td>';
  echo '<td class="siloquantite">'.$repplanete['neutrinos'].'</td>';
  echo '<td class="silodescription">Vous avez réussi à extraire des neutrinos pour en faire un matériaux capable de rejeter une grande quantité d\'énergie au besoin.</td></tr>';
  }
$reqSiloItems = $bd->prepare(' SELECT s.quantite, i.description, i.nombatiment
                                FROM c_silo s
                                INNER JOIN a_items i
                                ON i.iditem = s.iditems
                                WHERE s.idplanetesilo = ?');
$reqSiloItems->execute(array($_GET['id']));

while($repSiloItems = $reqSiloItems->fetch())
  {
  if ($repSiloItems['quantite']>0)
    {
    echo '<tr><td class="silonom">'. ucfirst($repSiloItems['nombatiment']);
    echo '</td><td class="siloquantite">'.$repSiloItems['quantite'];
    echo '</td><td class="silodescription">'.$repSiloItems['description'];
    echo '</td></tr>';
    }
  }
?>