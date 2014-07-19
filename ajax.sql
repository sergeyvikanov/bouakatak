$(document).ready(function(){
    var p=0;
    $("#myDialog").dialog({
        height: 100,
        width:500,
        autoOpen:true
    });
    $("#myProgressBar").progressbar({value:0});
        var timer = setInterval(function(){
            //This animates the bar
            $("#myProgressBar .ui-progressbar-value").animate({width: p+"%"}, 500);
            //This does static sets of the value
            //$("#myProgressBar").progressbar("option","value",p);
            p = p +3;
            if(p>100){
                $("#myProgressBar .ui-progressbar-value").animate({width: "100%"}, 500);
                //$("#myProgressBar").progressbar("option","value",100);
                clearInterval(timer);
            }
    },500);
});
