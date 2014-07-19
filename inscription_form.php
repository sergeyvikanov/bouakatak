<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="styles/style.css" />
		<title>BOUAK : Ajouter un joueur</title>
	</head>

	<body>
		<div class="corps">
			<div class="entete">
				<h1>BOUAK : Ajouter un joueur</h1>
			</div>
			<div class="contenant">
				<fieldset>
					<legend>Informations de compte</legend>
					<form action="splitter.php" method="POST">
						<label for="jnom">Nom :</label><input type="text" name="jnom" size="20">
						<br />
						<label for="jprenom">Prenom :</label><input type="text" name="jprenom" size="20">
						<br />
						<label for="jenonce">Enonce :</label><textarea name="jenonce" cols="60" rows="17"></textarea>
						<br />
						<label for="jbool">Le prénom est-il obligatoire ?</label><input type="radio" name="jbool" value=true>Oui
						<input type="radio" name="jbool" value=false>Non<br />
						<input type="submit" value="Ajouter ce joueur">
					</form>
				</fieldset>
			</div>
		</div>
		<div class="pied">
		contactez nous sur bouak.fr
		</div>

	</body>
</html>