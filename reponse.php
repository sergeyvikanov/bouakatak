<?php
session_start ();
	// Recupération des données du formulaire
if (isset($_SESSION['login']) && isset($_SESSION['pwd']))
{
	// recuperation des parametres
	$joueur = $_POST['idj'];
	$pass = $_POST['pwd'];
	$id = $_POST['idq'];
	$score = $_POST['score'];
	$repMec=$_POST['reponseMec'];
	$fini = $_POST['fini'];
	header('Content-Type: text/html; charset=utf-8');
	// Connexion BDD
	include_once "connexionBdd.php";

	// Verif pwd
	$reqGetPass = $db->prepare("SELECT pwd from joueurs where id = :idj");
	$reqGetPass->bindParam(":idj", $joueur, PDO::PARAM_STR);
	$reqGetPass->execute();
	$passmd5 = $reqGetPass->fetch()['pwd'];
	// le password est stocké en md5 dans la base
	if(md5($pass) == $passmd5)
	{
		$requete = $db->prepare("SELECT rep_prenom || ' ' || rep_nom as \"reponse\" from questions WHERE id = :id"); // j'effectue ma requête SQL
		$requete->bindParam(":id", $id, PDO::PARAM_STR);
		$requete->execute();


		$donnee = $requete->fetch()['reponse']; // recuperation de la reponse concatenee "prenom nom"

		if ($donnee == $repMec)
		{
			$reqMajScore = $db->prepare("UPDATE repondus SET score=:score WHERE id_joueur = :idj AND id_question = :idq AND score IS NULL");
			$reqMajScore->bindParam(":score", $score, PDO::PARAM_STR);
			$reqMajScore->bindParam(":idq", $id, PDO::PARAM_STR);
			$reqMajScore->bindParam(":idj", $joueur, PDO::PARAM_STR);
			$reqMajScore->execute();
			echo json_encode("Gagné, vous remportez ".$score." points"); 
		}
		elseif ($fini == 1)
		{
		$reqMajScore = $db->prepare("UPDATE repondus SET score=0 WHERE id_joueur = :idj AND id_question = :idq AND score IS NULL");
		$reqMajScore->bindParam(":idq", $id, PDO::PARAM_STR);
		$reqMajScore->bindParam(":idj", $joueur, PDO::PARAM_STR);
		$reqMajScore->execute();
		echo json_encode("La réponse était : ".$donnee."Vous n'avez pas répondu à temps, vous marquez 0 point."); 
		}
		else
		{
			echo json_encode("Non, c'est pas lui !"); // convertir en JSON pour l'utf8
		}
	}
}
?>