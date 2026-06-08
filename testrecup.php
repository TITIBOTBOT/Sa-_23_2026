<?php

// Récupération du message MQTT
$commande = "mosquitto_sub -h mqtt.iut-blagnac.fr -p 8883 -u student -P student -t sensors/AM107/by-room/E208/data -C 1";
$json = shell_exec($commande);

if (!$json) {
    die("Aucune donnée reçue.");
}

$data = json_decode($json, true);

if (!$data) {
    die("Erreur JSON.");
}

// Informations de la salle
$room = $data[1]['room'];

// Connexion à la base
try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=sae23;charset=utf8",
        "utilisateur",
        "mot_de_passe"
    );

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {
    die("Erreur connexion : " . $e->getMessage());
}

// Date et heure
$date = date('Y-m-d');
$heure = date('H:i:s');

// Préparation de la requête
$sql = "INSERT INTO mesures (nom_capteur, date, horaire, valeurs)
        VALUES (?, ?, ?, ?)";

$stmt = $pdo->prepare($sql);

// Toutes les mesures du premier objet JSON
foreach ($data[0] as $capteur => $valeur) {

    $nomCapteur = $capteur . "_" . $room;

    $stmt->execute([
        $nomCapteur,
        $date,
        $heure,
        $valeur
    ]);
}

echo "Mesures enregistrées avec succès.";

?>
