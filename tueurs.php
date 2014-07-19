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
			<h1>les tueurs de l'agence</h1>
		</div>
		<div class="contenant">
			<?php
			
				$db= new PDO("pgsql:host=localhost;port=5432;dbname=garage", "postgres",
				"kerz") or die("Échec de connexion au serveur");
				$db->exec("SET NAMES 'UTF8'");
				//recuperation liste des tables				
				$sql_liste="SELECT nom, localisation, prix, description FROM public.tueurs order by nom";
				$rq_liste=$db->prepare($sql_liste);
				$rq_liste->execute();
				$tab_liste= $rq_liste->fetchall(PDO::FETCH_ASSOC);
				foreach($tab_liste as $ligne) {
					foreach ($ligne as $champ=>$valeur){
					if ($champ == "nom")
						{
							$noms[]=$valeur;
						}
					elseif ($champ == "localisation")
						{
							$localisations[]=$valeur;
						}
					elseif ($champ == "prix")
						{
							$prixx[]=$valeur;
						}
					elseif ($champ == "description")
						{
							$descriptions[]=$valeur;
						}
					}
				}
				for($i=0;$i<5;$i++)
				{
					echo("<fieldset>\n<legend>".$noms[$i]."</legend>");
					echo(" Localisé à :".$localisations[$i]."<br /> prix (informatif) : ".$prixx[$i]);
					echo '<br />';
					echo $descriptions[$i];
					echo ("</fieldset>");
				}
			?>

			<a href="tueurs.php">Nos tueurs</a>
		</div>
		</div>
		<div class="pied">
		contactez nous sur fb47@brevart-gages.fr
		</div>
	</body>
</html>