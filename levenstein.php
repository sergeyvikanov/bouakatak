<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8"/> 
</head>
<body>
<?php
session_start();
/** Includes **/
include "damlev.php";
/** Fonctions **/
function sansAccents($str)
{
	// Mise en minuscules (la chaine doit être en utf8)
	$str = mb_strtolower($str, 'utf-8');
	// enlève les accents 
	$str = strtr($str, array(
	'à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a', 'å'=>'a', 'æ'=>'a', 'a'=>'a', 'a'=>'a', 'a'=>'a', 'ç'=>'c', 'c'=>'c', 'c'=>'c', 'c'=>'c', 'c'=>'c', 'd'=>'d', 'd'=>'d', 'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'e'=>'e', 'e'=>'e', 'e'=>'e', 'e'=>'e', 'e'=>'e', 'g'=>'g', 'g'=>'g', 'g'=>'g', 'h'=>'h', 'h'=>'h', 'ì'=>'i', 'í'=>'i', 'î'=>'i', 'ï'=>'i', 'i'=>'i', 'i'=>'i', 'i'=>'i', 'i'=>'i', 'i'=>'i', '?'=>'i', 'j'=>'j', 'k'=>'k', '?'=>'k', 'l'=>'l', 'l'=>'l', 'l'=>'l', '?'=>'l', 'l'=>'l', 'ñ'=>'n', 'n'=>'n', 'n'=>'n', 'n'=>'n', '?'=>'n', '?'=>'n', 'ð'=>'o', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o', 'ö'=>'o', 'o'=>'o', 'o'=>'o', 'o'=>'o', 'œ'=>'o', 'ø'=>'o', 'r'=>'r', 'r'=>'r', 's'=>'s', 's'=>'s', 's'=>'s', 'š'=>'s', '?'=>'s', 't'=>'t', 't'=>'t', 't'=>'t', 'ù'=>'u', 'ú'=>'u', 'û'=>'u', 'ü'=>'u', 'u'=>'u', 'u'=>'u', 'u'=>'u', 'u'=>'u', 'u'=>'u', 'u'=>'u', 'w'=>'w', 'ý'=>'y', 'ÿ'=>'y', 'y'=>'y', 'z'=>'z', 'z'=>'z', 'ž'=>'z'
	));
	return $str;
}

/** Recupere la reponse de la question en BDD avec son Id **/
function getReponse($id)
{
	include_once  "connexionBdd.php";
	$db=connexionBouakbase();
	$requete = $db->prepare("SELECT rep_nom, rep_prenom, p_necessaire from questions WHERE id = :id"); // requête SQL
	$requete->bindParam(":id", $id, PDO::PARAM_STR);
	$requete->execute();
	$repp = $requete->fetch();
	$nom = $repp[0];
	$prenom = $repp[1];
	$bool = $repp[2];
	return array($nom, $prenom, $bool);
}

/** Vérifie si la réponse est exacte **/
function verifierReponse($reponse, $nom, $prenom, $oblig)
{
	$resultat=0; // booleen
	$bonus=0; // booleen
	$np = $prenom." ".$nom;
	$pn = $nom." ".$prenom;
	// Possibilité de réponse "nom prenom" ou "prenom nom"
	if ($oblig)
	{
	// tolère deux fautes de frappe
		$resultat = (min(DamerauLevenshtein::distance($np, $reponse), DamerauLevenshtein::distance($pn, $reponse)) <= 2);
		$bonus = 0 + $resultat; // Le bonus est obtenu dès qu'on repond correctement
	}
	else
	{
		if (min(DamerauLevenshtein::distance($np, $reponse), DamerauLevenshtein::distance($pn, $reponse)) <= 2)//nom+prenom
		{
			$bonus=1;
			$resultat = 1;
		}
		else
		{
			$bonus = 0;
			$resultat = (DamerauLevenshtein::distance($nom, $reponse) <= 1);//nom seul
		}
	}
	return array($resultat, $bonus);
}



$idq = $_SESSION['idq'];
$reponse = $_POST['reponseMec'];// réponse brute
$reponse = sansAccents($reponse); // mise en forme

$tab=getReponse($idq);
var_dump($tab);
$tableau = verifierReponse($reponse, sansAccents($tab[0]), sansAccents($tab[1]), $tab[2]);
 if ($tableau[0])
 {
	echo 1;
 }
 else
 {
	echo 0;
 }



?>
</body>
</html>