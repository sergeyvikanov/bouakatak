<?php
	session_start ();
	// Recupération des données de session
	if !(isset($_SESSION['login']) && isset($_SESSION['pwd']))
	{
		header ('location: login.php');
	}	
?>