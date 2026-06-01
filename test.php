<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Rapport de Projet - SAÉ23</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Test SAÉ23</h1>
<?php
$json = shell_exec("mosquitto_sub -h mqtt.iut-blagnac.fr -t AM107/by-room/E104/data -C 1");
echo "<h3>Données brutes récupérées :</h3><pre>$json</pre>";

$data = json_decode($json, true);
if ($data === null) {
    echo "<p style='color:red;'> Format JSON incorrect ou message vide.</p>";
} else {
    echo "<p style='color:green;'> JSON décodé avec succès :</p>";
    echo "<pre>";
    print_r($data);
    echo "</pre>";
}
?>
</body>
</html>
