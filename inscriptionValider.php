<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
// Recupération des données du formulaire
	if ((isset($_POST['ipseudo']) && isset($_POST['ipwd'])) and (($_POST['ipseudo'] != null) and ($_POST['ipwd'] != null)))
	{
		$login = $_POST['ipseudo'];
		$db= new PDO("pgsql:host=localhost;port=5432;dbname=garage", "postgres",
		"kerz") or die("Échec de connexion au serveur");
		$db->exec("SET NAMES 'UTF8'");
		//recuperation liste des tables
		$sql_exists="SELECT 1 FROM public.joueurs WHERE pseudo = :login";
		$req_exists=$db->prepare($sql_exists);
		$req_exists->bindParam(":login", $login, PDO::PARAM_STR);
		$req_exists->execute();
		if  ($req_exists->rowCount() > 0)
		{
			echo "le joueur existe deja !!!";
		}
		else
		{
			echo "OK";
		}
	}
	else
	{
		echo "renseigne tous les champs boubourse !";
	}
		/*
		$resultset = $req_password->fetch(PDO::FETCH_ASSOC);
		$mdp = $resultset['pwd'];
		$id = $resultset['id'];
		echo ('MDP BASE :'.$mdp);
		if ($mdp == md5($_POST['pwd']))
		{
			session_start();
			// on enregistre les paramètres de notre visiteur comme variables de session ($login et $pwd) (notez bien que l'on utilise pas le $ pour enregistrer ces variables)
			$_SESSION['login'] = $_POST['login'];
			$_SESSION['pwd'] = $_POST['pwd'];
			$_SESSION['joueur'] = $id;
			header ('location: exo12quest.php');
		}
		else
		{
		session_unset();
		session_destroy();
			// Le visiteur n'a pas été reconnu comme étant membre de notre site. On utilise alors un petit javascript lui signalant ce fait
			echo '<body onLoad="alert(\'Membre non reconnu...\')">';
			// puis on le redirige vers la page d'accueil
			echo '<meta http-equiv="refresh" content="0;URL=index.htm">';
		}
	}
	else
	{
		echo 'Les variables du formulaire ne sont pas déclarées.';
	}
	*/
?>