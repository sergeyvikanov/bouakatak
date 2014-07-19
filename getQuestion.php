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
		$idp = $_GET['idp'];
		$qnum = $_GET['qnum'];
		echo "Partie n° : $idp <br />";
		echo "Question n° : $qnum <br />";
		$req_get_question = "SELECT id_question FROM choixquestions where id_partie = $idp and numquestion = $qnum";
		$select_idq = $db->query($req_get_question) or die ("outch !");
		$idq = $select_idq->fetch(PDO::FETCH_COLUMN);
		
		echo "Numero de question : $idq";
		
		?>