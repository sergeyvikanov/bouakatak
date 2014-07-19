<?php
	session_start();

	$_SESSION['idq'] = 35;

	if (!isset($_SESSION['qpart']) or $_SESSION['qpart'] >= 6)
	{
		$_SESSION['qpart'] = 0;
	}
	//session_destroy();
	include_once  "connexionBdd.php";
	$db = connexionBouakbase();
	if (isset ($_SESSION['qpart']) and isset($_SESSION['idq']) and ($_SESSION['qpart'] < 6))
	{
		$idq = $_SESSION['idq']; // question en cours
		$qpart = $_SESSION['qpart']; // partie de la question à afficher
		// requete a la bourrin (param securises en session)
		$req_select_qpart = "SELECT texte FROM enonce WHERE id_question=$idq and numpart=$qpart";
		//echo $req_select_qpart;
		$select_qpart=$db->query($req_select_qpart) or die("outch");
		$result_qpart = $select_qpart->fetch(PDO::FETCH_COLUMN);
		$_SESSION['qpart']++;
		echo json_encode($result_qpart);
	}
	else die("pb");
?>