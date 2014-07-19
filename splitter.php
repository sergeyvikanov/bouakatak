<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8"/> 
</head>
<body style="font-family:Courier New,Courier,mono">

<?php

include_once  "connexionBdd.php";
$db = connexionBouakbase();

$texte = $_POST['jenonce'];
$prenom= $_POST['jprenom'];
$nom= $_POST['jnom'];
$bool= $_POST['jbool'];

$texte = preg_replace("/(\r\n|\n|\r)/", " ", $texte);
$partie = 6;
$nbpart = $partie;
$morceaux = array();
$qparts=array();
//$taille = $_POST['taille'];
$taille = mb_strlen($texte, 'UTF-8');
$reste = $taille;

while ($reste > 0)
{
	if ($nbpart == 1)
	{
		$taille_morceau = $reste;
		$reste = 0;
		array_push($morceaux, $taille_morceau);
	}
	else
	{
		$taille_morceau = round($reste/$nbpart);
		array_push($morceaux, $taille_morceau);
		$reste = $reste - $taille_morceau;
		$nbpart--;
	}
}


//var_dump($morceaux);
//echo $taille;
$indice = 0;
for($i=0;$i<$partie;$i++)
{
	array_push($qparts, mb_substr($texte, $indice, $morceaux[$i], 'UTF-8'));
	$indice = $indice + $morceaux[$i];
}
$req_insert = "INSERT INTO questions(enonce, rep_nom, rep_prenom, p_necessaire, taille) VALUES(:enonce,:nom,:prenom,:necessaire,:taille)";
$stmt=$db->prepare($req_insert);

$stmt->bindParam(':enonce', $texte);
$stmt->bindParam(':nom', $nom);
$stmt->bindParam(':prenom', $prenom);
$stmt->bindParam(':necessaire', $bool);
$stmt->bindParam(':taille', $taille);
$stmt->execute();

//recup id de question
$req_get_numquest = "SELECT max(id) from questions";
$select_numquest=$db->query($req_get_numquest) or die ("outch");
$numquest = $select_numquest->fetch(PDO::FETCH_COLUMN);
echo $numquest;

// insertion des parties
$req_insert = "INSERT INTO enonce(id_question, numpart, texte) VALUES($numquest,:numpart,:texte)";
$stmt=$db->prepare($req_insert);

for($i=0;$i<$partie;$i++)
{
	$stmt->bindParam(':numpart', $i);
	$stmt->bindParam(':texte', $qparts[$i]);
	$stmt->execute() or die ("noooooooon !!");
}



//echo mb_substr($texte,0,4, 'UTF-8');


?>
</body>
</html>