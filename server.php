<?php
// Recupération des données du formulaire
	if ( isset($_POST['idq']) && isset($_POST['reponse'])){
		$id = $_POST['idq'];
		$reponse = $_POST['reponse'];
		
		$db= new PDO("pgsql:host=localhost;port=5432;dbname=garage", "postgres", "kerz") or die("Échec de connexion au serveur");
		$db->exec("SET NAMES 'UTF8'");
		
		//recuperation de la reponse
		$sql_liste="SELECT rep_prenom, rep_nom FROM public.questions WHERE id = :id";
		$rq_liste=$db->prepare($sql_liste);
		$rq_liste->bindParam(":id", $id, PDO::PARAM_STR);
		$rq_liste->execute();
		
		$tab_liste= $rq_liste->fetch(PDO::FETCH_ASSOC);
		print_r($tab_liste);
		$nom = $tab_liste['rep_nom'];
		$prenom = $tab_liste['rep_prenom']; 
		$r_parfaite=$nom." ".$prenom;
		
		if ($reponse == $nom)
		{
		 echo ( "mec trouvé !!! gg !!");
		}
		
		
		
		
		
	}
	else
	{
	 echo ("NOOOON !");
	}
	
?>