#!/opt/lampp/bin/php
<?php
echo "1";
// Récupération du message MQTT
$json = shell_exec("mosquitto_sub -h mqtt.iut-blagnac.fr -p 8883 -u student -P student -t sensors/AM107/by-room/E208/data -C 1");

if (!$json) {
    die("Aucune donnée reçue.");
}

$data = json_decode($json, true);
print_r($data);

if (!$data) {
    die("Erreur JSON.");
}

// Connexion à la base
$conn = mysqli_connect("localhost","facci","rt","sae23",8883);

if (!$conn) {
    die("Erreur connexion : " . mysqli_connect_error());
}

$name = $data[1]["deviceName"];
$temp = $data[0]["temperature"];

$date_mesure = date('Y-m-d');
$heure_mesure = date('H:i:s');


// Requête SQL
$sql = "INSERT INTO mesures
(nom_capteur, date, horaire, valeurs)
VALUES
('temperature_{$name}',
 '{$date_mesure}',
 '{$heure_mesure}',
 {$temp})";

if (mysqli_query($conn, $sql)) {
    echo "Insertion réussie";
} else {
    echo "Erreur SQL : " . mysqli_error($conn);
}

mysqli_close($conn);

?>
