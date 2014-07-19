<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
	session_start ();
	// Recupération des données de session
	if (isset($_SESSION['login']) && isset($_SESSION['pwd']) && $_SERVER['HTTP_REFERER']=="http://127.0.0.1/site/login.php")
	{
		// CONNEXION BASE
		include_once "connexionBdd.php";
		$db = connexionBouakbase();
		// INFOS
		$pseudo=$_SESSION['login'];
		$pwd=$_SESSION['pwd'];
		$id='';
		$joueur=$_SESSION['joueur']; // ID joueur
		$question='PAS DE QUESTIONS DISPONIBLES';
		//recuperation liste des tables
		$sql_liste="SELECT q.id, q.enonce, q.rep_nom FROM questions q WHERE q.id NOT IN (SELECT id_question FROM repondus WHERE id_joueur = :joueur) ORDER BY RANDOM() LIMIT 1";
		$rq_liste=$db->prepare($sql_liste);
		$rq_liste->bindParam(":joueur", $joueur, PDO::PARAM_STR);
		$rq_liste->execute();
		// on a forément une seule ligne (ou aucune)
		$tab_liste= $rq_liste->fetchall(PDO::FETCH_ASSOC);
		foreach($tab_liste as $ligne)
		{
			foreach ($ligne as $champ=>$valeur)
			{
				$id = $ligne['id'];
				$question=$ligne['enonce'];
				$reponse=$ligne['rep_nom'];
			}
		}
		//fermeture statement
		$rq_liste->closeCursor();
		echo '<span style="VISIBILITY:hidden;display:none" id="cache">'.$id.'</span>';
		$sql_insert="INSERT INTO repondus(id_joueur, id_question) VALUES(:joueur, :question)";
		$rq_insert=$db->prepare($sql_insert);
		$rq_insert->bindParam(":joueur", $joueur, PDO::PARAM_STR);
		$rq_insert->bindParam(":question", $id, PDO::PARAM_STR);
		$rq_insert->execute();
		// fermeture statement et deco
		$rq_insert->closeCursor();		
		unset($db);
		//$db->commit();
		
	}
	else
	{
		session_unset ();
		session_destroy ();
		header ('location: login.php');
	}

	header('Content-Type: text/html; charset=utf-8');
	?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<head>
			<title>BOUAK.com : Trouvez les tous !</title>
			<link rel="stylesheet" type="text/css" href="styles/style.css" /> <!-- feuille de style perso -->
			<link rel="stylesheet" type="text/css" href="styles/jquery-ui-1.10.4.custom.css" />
			<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
			<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.js"></script>
			<script type="text/javascript" src="js/jquery.tablesorter.js"></script> 
			<SCRIPT type="text/javascript" charset="utf-8">
				score = 6;
				var position = 0;
				var chaine = <?php echo json_encode($question); ?>;
				var nb_car = chaine.length;
				var pourcentage = Math.round(nb_car/100);
				var palier = Math.round(nb_car / 6);
				var ecart = palier;
				var tableau = chaine.split(""); // chaine sous forme de tableau de lettres
				texte = new Array;
				var txt = '';
				var nb_msg = nb_car - 1;
				fini=false; // fin de la question
				
				actual_texte = 0;
				function changeMessage()
				{
					if (fini)
					{
						clearInterval(defilerTexte);
						clearInterval(defilerBarre);
					}
					position++; //incremente le compteur de lettres
					if (position == palier && (position < nb_car))
					{
						 score--; // le score baisse de 1 à chaque palier
						 palier = palier + ecart; // prochain palier
					}
					if (actual_texte <= nb_msg){
						document.getElementById("bloc").innerHTML += tableau[position-1];
						}
					else
						{
							fini=true;
							clearInterval(defilerTexte);
							clearInterval(defilerBarre);
							window.setTimeout('document.getElementById("finir").click();',4000);
						}
						actual_texte++;
				}
								
				var i = 0;
				var defilerTexte;
				function faire(param)
				{
					if (param == 'go' && i == 0)
					{
						defilerTexte = setInterval("changeMessage()",50);
						defilerBarre = setInterval("augmenter()",50);
						i++;
					}
					if (param == 'stop')
					{
						clearInterval(defilerTexte);
						clearInterval(defilerBarre);
						i=0;
					}
				}
				function verifier(reponse)
				{
					if (reponse.value == 'fernandez')
					{
						alert(pourcentage);
						//document.getElementById("bloc").innerHTML = chaine;
					}
				}
				
var valeur = 0;
var j=1;
var defilerBarre;
function activer()
{
	document.getElementById('valider').disabled=null;
}

function desactiver(elem)
{
	document.getElementById(elem).disabled='disabled';
	window.setTimeout('activer()', 3000);
}

function augmenter(){
	if (valeur <= nb_car)
	{
			valeur++;
			$( "#progressbar" ).progressbar({
			value: valeur,
			max : nb_car
			});
	}
	else
	{
	$( "#progressbar" ).progressbar({
		value: false
		});
	desactiver('valider');
	clearInterval(defilerTexte);
	clearInterval(defilerBarre);
//document.getElementById("progressbar").innerHTML = valeur;
	}
}
			</script>
	</head>
	<body>
	<script>
	$(document).ready(function() {
    $('#valider').click(function() {
        var $this = $(this);
		desactiver('valider');
		//desactiver($this);
		var idq = $('#cache').text();
		var idj =<?php echo json_encode($joueur); ?>;
		var pwd = <?php echo json_encode($pwd); ?>;
        var reponseMec = $('#rep').val();
        if(reponseMec === '') {
            alert('ecris au moins un defilerTexte');
        } else {
            $.ajax({
                url: 'reponse.php',
                type: "POST",
                data: "reponseMec="+reponseMec+"&idq="+idq+"&idj="+idj+"&pwd="+pwd+"&score="+score+"&fini=0",
                dataType: 'json',
                success: function(json) {
                    $('#spanreponse').html(json);
                    } 
                })
            };
        })
    });
	$(document).ready(function() {
		$('#finir').click(function() {
			var $this = $(this);
			var idq = $('#cache').text();
			var idj =<?php echo json_encode($joueur); ?>;
			var pwd = <?php echo json_encode($pwd); ?>;
			var reponseMec = $('#rep').val();
			$.ajax({
					url: 'reponse.php',
					type: "POST",
					data: "reponseMec="+reponseMec+"&idq="+idq+"&idj="+idj+"&pwd="+pwd+"&score=0&fini=1",
					dataType: 'json',
					success: function(json) {
						$('#spanreponse').html(json);
						} 
					})
			})
		});
	
	</script>
		<div class="corps">
			<div class="entete">
				<h1>BOUAK !! Trouve le joueur !</h1>
			</div>
		<div class= "contenant">
			JOUEUR : <?php echo $pseudo ?>
			<div id="progressbar" style="width: 50%">

</div>
			
			<input type="button" value="GO" class="bouton" onClick=faire('go'); />
			<input type="button" value="STOP" class="bouton" onClick=faire('stop'); />
			<div id="bloc" class="bloc"></div>
			<input type="text" id="rep" />
			<input type="button" id="valider" class="bouton" value="VALIDER" style="float: left;" />
			<div>
			<p id="spanreponse" name="spanreponse"></p>
			</div>
			<input type="button" id="finir" style="VISIBILITY:hidden;display:none" />

			
<script type="text/javascript">
document.getElementById("rep").onpaste = function(){
    alert('Merci de ne pas copier/coller');        // on prévient
    return false;        // on empêche
};
//defilerBarre = setInterval("augmenter()",200);

</script>
		</div>
		</div>
		<div class="pied">
		contactez nous sur webmaster@bouak.fr
		</div>
	</body>
</html>