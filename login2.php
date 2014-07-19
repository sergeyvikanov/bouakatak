<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
// Recupération des données du formulaire
	if ((isset($_POST['login']) && isset($_POST['pwd'])) and (($_POST['login'] != null) and ($_POST['pwd'] != null)))
	{
		include_once "connexionBdd.php";
		$db=connexionBouakbase();
		
		$login = $_POST['login'];
		//recuperation liste des tables
		$sql_password="SELECT id, pwd FROM joueurs WHERE pseudo = :login";
		$req_password=$db->prepare($sql_password);
		$req_password->bindParam(":login", $login, PDO::PARAM_STR);
		$req_password->execute();
		$resultset = $req_password->fetch(PDO::FETCH_ASSOC);
		$mdp = $resultset['pwd'];
		$id = $resultset['id'];
		//echo $login;
		//echo ('MDP BASE :'.$mdp);
		if ($mdp == md5($_POST['pwd']))
		{
			session_start();
			// on enregistre les paramètres de notre visiteur comme variables de session ($login et $pwd) (notez bien que l'on utilise pas le $ pour enregistrer ces variables)
			$_SESSION['login'] = $_POST['login'];
			$_SESSION['pwd'] = $_POST['pwd'];
			$_SESSION['joueur'] = $id;
			echo 'OK';
			header ('location: exo12quest.php');
		}
		else
		{
		session_unset();
		session_destroy();
			// Le visiteur n'a pas été reconnu comme étant membre de notre site. On utilise alors un petit javascript lui signalant ce fait
			echo '<body onLoad="alert(\'Membre non reconnu...\')">';
			// puis on le redirige vers la page d'accueil
			//echo '<meta http-equiv="refresh" content="0;URL=login.php">';
		}
	}
	else
	{
		echo 'Les variables du formulaire ne sont pas déclarées.';
	}
