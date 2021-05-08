<?php
include("../include/entete.php");
echo '<h1>CAPITALE</h1>';
include("../function/variable.php");

include("../include/message.php");
$typemessage = 'capitale';
include("../include/resume.php");

include("05_statempire.php");

include("08_transfertvaisseaux.php");

include("15_objectifs.php");

require __DIR__ . '/../include/affichernews.php';

echo '</div></body></html>';