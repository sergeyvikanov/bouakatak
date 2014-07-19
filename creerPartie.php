<?php	

	session_start();
	//session_destroy();
	include "connexionBdd.php";
	$db = connexionBouakbase();
		//le joueur doit être loggué
		
		if (!isset ($_SESSION['idj']))
		{
			$_SESSION['idj'] = 1;
		}
		$joueur = $_SESSION['idj'];
		$req_questions="SELECT q.id FROM questions q WHERE q.id NOT IN (SELECT id_question FROM repondus WHERE id_joueur = :joueur) ORDER BY RANDOM() LIMIT 5";
		$rq_getQuestions=$db->prepare($req_questions);
		$rq_getQuestions->bindParam(":joueur", $joueur, PDO::PARAM_STR);
		$rq_getQuestions->execute() or die ("questions non choisies !!");
		$count= $rq_getQuestions->rowCount();//nombre de resultats
		// on degage si y'a pas les questions
		if ($count != 5)
		{
			die ("pas assez de questions");
		}
		$questions_liste= $rq_getQuestions->fetchall(PDO::FETCH_COLUMN);
		$virgules=implode(',',$questions_liste);
		
		echo "Questions choisies : $virgules <br />";
		$req_creerPartie ="INSERT INTO partie(id_joueur, nbq) VALUES ($joueur, 5)";
		// insertion bourrin
		$insert_creerPartie=$db->query($req_creerPartie) or die ("pas cree");
		
		$req_select_numpartie = "SELECT max(id) FROM partie";
		$select_numpartie = $db->query($req_select_numpartie) or die ("outch !");
		$numpartie = $select_numpartie->fetch(PDO::FETCH_COLUMN);
		echo "partie créée num : $numpartie <br />";
		
		// insertion des questions en liste
		$req_insert_questions = "INSERT INTO choixquestions(id_partie, numquestion, id_question) VALUES($numpartie, :numquest, :idq)";
		$stmt=$db->prepare($req_insert_questions);
		for($i=0;$i<5;$i++)
		{
			$stmt->bindParam(':numquest', $i);
			$stmt->bindParam(':idq', $questions_liste[$i]);
			$stmt->execute() or die ("noooooooon !!");
		}
		
		// parametres de session
		$_SESSION['idq']=$questions_liste[0]; // positionne le parametre sur la 1ere question
		$_SESSION['qpart'] = 0;
?>