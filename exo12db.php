<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<title>Exercice php</title>			
		<link rel="stylesheet" type="text/css" href="styles/style.css" />
		<link rel="stylesheet" type="text/css" href="styles/jquery-ui-1.10.4.custom.css" />
		<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.js"></script>
		<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
		<script type="text/javascript">
		function marquer(t, a)
		{
			t.value = a.value;
		}
		</script>
	</head>
	<body>
	<div class="corps">
		<div class="entete">
			<h1>Bases de données</h1>
		</div>
		<div class="contenant">
			<?php
			
				$db= new PDO("mysql:host=localhost;port=5432;dbname=garage", "postgres",
				"kerz") or die("Échec de connexion au serveur");
				$db->exec("SET NAMES 'UTF8'");
				//recuperation liste des tables				
				$sql_liste="SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'";
				$rq_liste=$db->prepare($sql_liste);
				$rq_liste->execute();
				$tab_liste= $rq_liste->fetchall(PDO::FETCH_ASSOC);
				foreach($tab_liste as $ligne) {
					foreach ($ligne as $champ=>$tabnom){
					$tables[]=$tabnom;
					}
				}
				
				$sql_villes="SELECT codpost, ville from public.tblvilles";
				$rq_liste=$db->prepare($sql_villes);
				$rq_liste->execute();
				$tab_liste= $rq_liste->fetchall(PDO::FETCH_ASSOC);
				foreach($tab_liste as $ligne)
				{
					foreach ($ligne as $champ=>$res)
					{
						if ($champ == "codpost")
						{
							$codes[]=$res;
						}
						elseif ($champ == "ville")
						{
							$villes[]=$res;
						}
					}
				}
				//print_r($villes);
				//print_r($codes);
			?>

			<form method="post" action="exo12quest.php">
				<fieldset>
					<legend>Table a choisir</legend>
					<select name="table" id="table">
						<?php 
							foreach($tables as $nom){
								$nom_affiche=str_replace("tbl", "", $nom);
								$nom_affiche=ucfirst($nom_affiche);
								echo "<option value='".$nom."'>".$nom_affiche."</option>";
								}
						?>
					</select>
					<input type="submit" name="submit" id="submit" value ="Afficher les données" />
				</fieldset>
				
				<fieldset>
					<legend>Recherche vehicule</legend>
					<label for="modele">Modèle :</label>
					<input type="text" name="modele" id="modele" size="20" /><br />
					<label for="marque">Marque :</label>
					<input type="text" name="marque" id="marque" size="20" /><br />
					<label for="proprio">Propriétaire :</label>
					<input type="text" name="proprio" id="proprio" size="20" /><br />
					<input type="submit" id="afficher" name="afficher" value ="Afficher les resultats" />
				</fieldset>
				
				
				<fieldset>
					<legend>Ajout client</legend>
					<label for="nom">Nom :</label>
					<input type="text" name="nom" id="nom" size="20" /><br />
					<label for="prenom">Prenom :</label>
					<input type="text" name="prenom" id="prenom" size="20" /><br />
					<label for="adresse">Adresse :</label>
					<input type="text" name="adresse" id="adresse" size="40" /><br />
					<select name="cp" id="cp" onChange="marquer(ville, cp);">
					<?php 
						$i=0;
						foreach($codes as $cp)
						{
							echo "<option value=\"".($villes[$i])."\">".$cp."</option>";
							$i++;
						}
					?>
					</select>					
					<label for="ville">ville :</label>
					<input type="text" name="ville" id="ville" size="20" /><br />
					<label for="autocomplete">Ville : </label>
					<input id="autocomplete" size="35">
					<input type="submit" id="afficher" name="afficher" value ="Ajouter ce mec" />
				</fieldset>
			</form>
			<a href="tueurs.php">Nos tueurs</a>
<script>
$( "#autocomplete" ).autocomplete({
minLength:4,
source: 'liste.php'
});
</script>
		</div>
		</div>
		<div class="pied">
		contactez nous sur fb47@brevart-gages.fr
		</div>
	</body>
</html>