<?php

/* veillez bien à vous connecter à votre base de données */
$db= new PDO("pgsql:host=localhost;port=5432;dbname=garage", "postgres", "kerz") or die("Échec de connexion au serveur");
$db->exec("SET NAMES 'UTF8'");
$term = $_GET['term'];

$requete = $db->prepare("SELECT nom from public.villes WHERE cp LIKE :term LIMIT 25"); // j'effectue ma requête SQL grâce au mot-clé LIKE
$requete->execute(array('term' => $term.'%'));

$array = array(); // on créé le tableau

while($donnee = $requete->fetch()) // on effectue une boucle pour obtenir les données
{
    array_push($array, $donnee['nom']); // et on ajoute celles-ci à notre tableau
}

echo json_encode($array); // il n'y a plus qu'à convertir en JSON

?>