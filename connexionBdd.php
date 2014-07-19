<?php

/** Connexion à la base du site **/
function connexionBouakbase()
{
	$db = new PDO("pgsql:host=localhost;port=5432;dbname=garage", "postgres","kerz") or die("Échec de connexion au serveur");
	$db->exec("SET NAMES 'UTF8'");
	$db->exec("SET search_path='public'");
	return $db;
}

?>