
/*********** FONCTIONS DE JEU **********/
// Complète l'enoncé avec la partie suivante
function avancer()
{
   $.ajax({
		url: 'getPartQuestion.php',
		type: 'POST',
		dataType: 'json',
		success: function(qpart) {
			texte = texte + qpart;
			tableau = texte.split("");
			},
  error: function() {
    $('#spanreponse').html('toto');
  }
		});
}

// Fait défiler le texte d'un caractère supplémentaire
function changeMessage()
{
	if (fini)
	{
		clearInterval(truc);
		//clearInterval(machin);
	}
	position++; //incremente le compteur de lettres
	if (actual_texte <= nb_msg){
		document.getElementById("spanreponse").innerHTML += tableau[position-1];
		}
	else
		{
			fini=true;
			clearInterval(truc);
			//clearInterval(machin);
			window.setTimeout('document.getElementById("finir").click();',4000);
		}
		actual_texte++;
}
