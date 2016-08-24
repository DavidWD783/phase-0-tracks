// function that takes a string and reverses it
// reverse("hello") => "olleh"

// Pseudocode //
// declare a function, set argument to string variable

// inside function
  // set a temporary string to house characters of input string
  // set up for loop to run over characters of string
  // start with i = str.length - 1; work while i >= 0; decrement by 1 (i --)
  // select character at position str.length - 1
    // store in temporary string
    // return temporary string each time
  // repeat process over loop until completed
  // call function with string "hello"

function stringReverse(str) {
  var tempString = '';
  for (var i = str.length-1; i >= 0; i --) {
    tempString += str[i];
  }
  return tempString
}

// Driver Code to call Functions and store in variables //
var testOne = stringReverse("hello")
var testTwo = stringReverse("backwards")

// Driver Code to Print //
for (var i = 0; i < 1; i ++) {
  if (8 / 4 == 2) {
    console.log(testOne);
    console.log(testTwo);
  }
  else {
    console.log("I print this and nothing else...");
  }
}
