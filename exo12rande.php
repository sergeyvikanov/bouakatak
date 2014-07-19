<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
// Recupération des données du formulaire
	if (isset($_POST['submit']))
	{
		$formulaire = "1er";
	}
	elseif (isset($_POST['afficher']))
	{
		$formulaire = "2eme";
	}
	$choix=$_POST["table"];
	$nom=str_replace("tbl", "", $choix);
	$nom=ucfirst($nom);
	$modele="%".$_POST["modele"]."%";
	$marque="%".$_POST["marque"]."%";
	$proprio="%".$_POST["proprio"]."%";
	
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<title>Exercice php</title>
		<link rel="stylesheet" type="text/css" href="styles/style.css" />
		<script type="text/javascript" src="js/jquery-latest.js"></script> 
		<script type="text/javascript" src="js/jquery.tablesorter.js"></script> 
		<script type="text/javascript">
		$(document).ready(function() 
		{ 
			$("#myTable").tablesorter(); 
		} 
		);
		</script>
	</head>
	<body>
		<div class="corps">
			<div class="entete">
				<h1>Bases de données</h1>
			</div>
			Table des <?=$nom ?> formulaire choisi <?=$formulaire ?>
			<?php
				$db= new PDO("pgsql:host=localhost;port=5432;dbname=garage", "postgres",
				"kerz") or die("Échec de connexion au serveur");
				$db->exec("SET NAMES 'UTF8'");
				$db->exec("SET search_path = public");
				$sql_rech="SELECT tblmodeles.modele, tblmarques.marque, tblvehicules.numimmat as \"Numéro plaque\", tblvehicules.annee, tblclients.nom as \"Propriétaire\"
				from tblmarques, tblmodeles, tblvehicules, tblclients
				where tblmodeles.nummarque=tblmarques.nummarque and tblmodeles.nummodele=tblvehicules.nummodele and tblvehicules.numclient=tblclients.numclient
				and (upper(tblmarques.marque) like upper(:marque) and upper(tblmodeles.modele) like upper(:modele) and upper(tblclients.nom) like upper(:proprio))";
				
				$sql="SELECT * from ".$choix;
				
				if ($formulaire == '1er'){
					$rq=$db->prepare($sql);
				}
				elseif ($formulaire == '2eme')
				{
					$rq=$db->prepare($sql_rech);
					$rq->bindParam(":marque", $marque, PDO::PARAM_STR);
					$rq->bindParam(":modele", $modele, PDO::PARAM_STR);
					$rq->bindParam(":proprio", $proprio, PDO::PARAM_STR);
					print($sql_rech);
					
				}
				$rq->execute();
				echo '<table id="myTable" class="tablesorter"><thead>';
				$resultset = $rq->fetchall(PDO::FETCH_ASSOC);
				$i=1;
				foreach($resultset as $ligne) {
					if ($i==1){
						echo '<tr>';
						foreach($ligne as $col=>$valeur){
							echo '<th>'.$col.'</th>';
							}
						echo '</tr>';
						$i++;
						}
					else {
							break;
							}
				}
				echo '</thead><tbody>';
				foreach($resultset as $ligne) {
					echo '<tr>';
					foreach($ligne as $col=>$valeur){
						echo '<td>'.$valeur.'</td>';
					}
					echo '</tr>';
				}
				echo '</tbody></table>';
			?>
		</div>
		<div class="pied">
		contactez nous sur fb47@brevart-gages.fr
		</div>
	</body>
</html>