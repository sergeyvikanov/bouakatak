<?php
//include_once "connexionBdd.php";
//require "fonctions.php"  
 ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="fonctions.js"></script>
</head>
<body>
<p name="spanreponse" id="spanreponse">
<script>
var position = 0;
texte='';
tableau = texte.split("");
var nb_car = 1441;
var nb_msg = nb_car - 1;
fini=false; // fin de la question
actual_texte = 0;
var i = 0;
var truc;
function faire(param)
{
	if (param == 'go' && i == 0)
	{
		truc = setInterval("changeMessage()",50);
		i++;
	}
	if (param == 'stop')
	{
		clearInterval(truc);
		i=0;
	}
}

function afficher()
{
	$('#spanreponse').append(texte);
}

window.setTimeout('avancer()', 1000);
window.setTimeout('avancer()', 3000);
window.setTimeout('avancer()', 5000);
window.setTimeout('avancer()', 7000);
window.setTimeout('avancer()', 9000);
window.setTimeout('avancer()', 11000);
//window.setTimeout('afficher()', 7100);
//window.setTimeout('afficher()', 4100);

</script>
</p>
<input type="button" value="GO" class="bouton" onClick=faire('go'); />
<input type="button" value="STOP" class="bouton" onClick=faire('stop'); />
</body>
</html>