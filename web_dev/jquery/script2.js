//check to see if jQuery loads
if (typeof jQuery == 'undefined') {

    console.log('jQuery has not loaded. ');
}
else {
  console.log('I have it...')
}


//add call to animate first the width, then the height, then move to the right...
$(document).ready(function(){
    $("#animate").click(function(){
        $("#cyclist-div").animate({left: '10px'});
        $("#cyclist-div").animate({left: '30px'});
        $("#cyclist-div").animate({left: '70px'});
        $("#cyclist-div").animate({left: '150px'});
        $("#cyclist-div").animate({left: '350px'});
        $("#cyclist-div").animate({left: '500px'});
        $("#cyclist-div").animate({left: '350px'});
        $("#cyclist-div").animate({left: '150px'});
        $("#cyclist-div").animate({left: '70px'});
        $("#cyclist-div").animate({left: '30px'});
        $("#cyclist-div").animate({left: '10px'});
        $("#cyclist-div").animate({left: '0px'});
    });
});

