//check to see if jQuery loads
if (typeof jQuery == 'undefined') {

    console.log('jQuery has not loaded. ');
}
else {
  console.log('I have it...')
}

//check simple jQuery function call to hide a p element
$(document).ready(function(){
    $("#btn-1").click(function(){
        $("p").hide();
    });
});

//add some calls on things like fade, animate, etc...
//add call to animate first the width, then the height, then move to the right...
$(document).ready(function(){
    $("#btn-2").click(function(){
        $("#btn-block").animate({width: '10px'});
        $("#btn-block").animate({height: '50px'});
        $("#btn-block").animate({left: '250px'});
        $("#btn-block").animate({left: '0px'});
        $("#btn-block").animate({width: '150px'});
        $("#btn-block").animate({height: '150px'});
    });
});