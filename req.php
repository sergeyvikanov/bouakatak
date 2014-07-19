<?php	
		include_once  "connexionBdd.php";
		echo "toto est la <br />";
		$joueur=1; // Sergey
		$partie=5;
		
	// if 1ere fois
		// Creation de la partie
		// prendre les 5 questions
		$sql_ids = "SELECT q.id FROM questions q WHERE q.id NOT IN (SELECT id_question FROM repondus WHERE id_joueur = :joueur) ORDER BY RANDOM() LIMIT 5";
		$rq_liste=$db->prepare($sql_ids);
		$rq_liste->bindParam(":joueur", $joueur, PDO::PARAM_STR);
		$rq_liste->execute();
		
		$id_liste= $rq_liste->fetchall(PDO::FETCH_COLUMN);
		$listequestions = implode(",", $id_liste);
		// les inserer en base
		$sql_creerPartie="INSERT INTO partie(id_joueur, q1, q2, q3, q4, q5) VALUES($joueur, $listequestions)";
		$rq_insert=$db->prepare($sql_creerPartie);
		$rq_insert->execute();
		
		// selectionner la question suivante
		$sql_liste="SELECT q.id, q.enonce, FROM questions q WHERE q.id = (select q1 from partie where id_partie = :partie)";
		$rq_liste=$db->prepare($sql_liste);
		$rq_liste->bindParam(":partie", $joueur, PDO::PARAM_STR);
		$rq_liste->execute();
		$tab_liste= $rq_liste->fetchall(PDO::FETCH_ASSOC)
		foreach($tab_liste as $ligne)
		{
			foreach ($ligne as $champ=>$valeur)
			{
				$id = $ligne['id'];
				$question=$ligne['enonce'];
				$reponse=$ligne['rep_nom'];
			}
		}
		
?>