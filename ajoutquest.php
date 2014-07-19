<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>BOUAK : Ajouter un joueur</title>
	</head>

	<body>
		<form action="ajoutValider.php" method="get">
			<label for="jnom">Nom du joueur : </label><input type="text" name="jnom" size="20">
			<br />
			<label for="jprenom">Prenom du joueur : </label><input type="text" name="jprenom" size="20">
			<br />
			<label for="jenonce">Enoncé de la question : </label><textarea rows="16" cols="80" name="jenonce"></textarea>
			<br />
			<label for="jbool">Le prénom est-il obligatoire ? </label><input type="radio" name="jbool" value="oui">Oui<br />
			<input type="radio" name="jbool" value="non">Non<br />
			<input type="submit" value="Connexion">
		</form>
	</body>
</html>