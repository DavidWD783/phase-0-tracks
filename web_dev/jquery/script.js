//check to see if jQuery loads
if (typeof jQuery == 'undefined') {

    console.log('jQuery has not loaded. ');
}
else {
  console.log('I have it...')
}

//check simple jQuery function call to hide a p element
$(document).ready(function(){
    $("button").click(function(){
        $("p").hide();
    });
});