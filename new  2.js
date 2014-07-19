var div = $('div');
var a = 0;
var delay = (1000 / 10);
var now, before = new Date();
var chaine ="Joueur né en 1980, j'effectue toute ma formation à l'ASSE, mais je n'y passe jamais pro, barré par des joueurs plus précoces. Je me retrouve à jouer dans un club végétatif typique du National (mais qui cette année 2012 va monter en L1) dans lequel le club Nantais me repère. A Nantes je vis véritablement mes plus belles années, puisque je remporte le titre de champion dès ma première saison. C'est logiquement que je rejoins un club ambitieux, juste dans la foulée de la finale de coupe perdue contre Sochaux. Joueur hargneux et plutôt bourrin, j'ai du mal à m'imposer dans ce club médiatisé, mais je finis par gagner ma place (j'y joue encore), malgré une valse des coachs impressionnante. Je suis ??";

setInterval(function() {
	now = new Date();
	aOld = a;

	var elapsedTime = (now.getTime() - before.getTime());
	if(elapsedTime > delay)
	{
		//Dans le cas ou on a suitté l'onglet, on "rattrappe" le temps
		a += Math.floor(elapsedTime/delay);
	}
	else
	{
		a++;
	}
	$("div").append(chaine.substring(aOld, a));
	before = new Date();    
}, delay);