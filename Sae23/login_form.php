<?php
	// Démarrage de la session
	session_start();
?>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8" />
		<title>Administration</title>
		<link rel="stylesheet" type="text/css" href="./styles/smi.css" />
	</head>

	<body>
		<!-- Affichage entete -->
		<?php 
			include("entete.html"); 
		?>
		<section>
			<p>
				<br />
				<em><strong>Administration de la base : Acc&egrave;s limit&eacute; aux personnes autoris&eacute;es</strong></em>
				<br />
			</p>
			<form action="login.php" method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>Saissez le nom d'utilisateur</legend>
					<label for="login">utilisateur : </label>
					<input type="text" name="login" id="login" />
					<legend>Saissez le mot de passe...</legend>
					<label for="mot_de_passe">Mot de passe : </label>
					<input type="password" name="mot_de_passe" id="mot_de_passe" />
				</fieldset>
				<p>
					<input type="submit" value="Valider" />
				</p>
			</form>
			<hr />
		</section>
		<footer>
			<p><a href="catalogue.php">Retour au catalogue</a></p>
			<p><a href="index.html">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>
