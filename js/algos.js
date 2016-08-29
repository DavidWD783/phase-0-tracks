// Pseudo Code
//write a function that takes an array of words or phrases and returns the longest word or phrase in the array.

//create function that takes in array of strings
function stringLengthChecker(array_of_strings) {
  //create blank array for storing strings
  var string_array_storage = [" "];
  //loop through array of strings and get each string
  for (var i = 0; i < array_of_strings.length; i ++) {
    //delete the blank space from each string
    //find the length of the string without blank space
    array_of_strings[i].replace(/\s/g, '');
    //add that string to a blank array
    //if the length of the next string is longer, replace the string in blank array
    //otherwise, leave it in
    if (array_of_strings[i].length > string_array_storage[0].length) {
      string_array_storage[0] = array_of_strings[i];
    } else {
        string_array_storage[0];
    };
  }
  //return the blank array which houses the longest string
  //end loop
  console.log("The longest string is " + string_array_storage[0]);
  return string_array_storage[0];
}

// Driver Code //

//stringLengthChecker
//stringLengthChecker(["long phrase","longest phrase","longer phrase"]) // return "longest phrase".
//stringLengthChecker(["long", "1", "super dooper  long"])
//stringLengthChecker(["one", "one", " one "])


//write a function that takes two objects and checks to see if the objects share at least one key-value pair.
function takesObjects(objOne, objTwo) {
  for (var key in (objOne && objTwo)) {
    if (objOne.hasOwnProperty(key) && objTwo.hasOwnProperty(key)) {
      if (objOne[key] === objTwo[key]) {
        return true;
      } else
      false;
    }
  }
}
//return true or false(only getting undefined) based on matching pair

// Driver Code //
//takesObjects
//console.log(takesObjects({name: "Steven", age: 55}, {name: "Tamir", age: 55})) //true
//console.log(takesObjects({name: "Steven", age: 55}, {name: "Tamir", age: 35})) //false
//console.log(takesObjects({name: "Steven", age: 55}, {date: "Tamir", style: 35})) //false
//console.log(takesObjects({name: "Steven", age: 55}, {name: "Steven", age: 35})) //true
//console.log(takesObjects({name: "Steven", age: 55, height: 68}, {name: "Mark", age: 35})) //false

//Write a function that takes an integer for length, and builds and returns an array of strings of the given length.

//pseudocode
//set function to take one integer argument
  //integer value creates array with value number of words
    //words in array vary in length from 1 to 10 letters (generate random number)
function intToArray(int) {
  var possibleLetters = "abcdefghijklmnopqrstuvwxyz"
  var intLengthArray = new Array(int)
  //console.log(intLengthArray);
  for (var i = 0; i < int; i ++) {
    intLengthArray[i] = possibleLetters.substr(Math.floor((Math.random() * 10) + 1), Math.floor((Math.random() * 10) + 1));
    console.log(intLengthArray);
  }
  return intLengthArray;
}
//Driver Code//
//intToArray(3);
for (var i = 0; i < 10; i ++) {
  var genArray = intToArray(Math.floor((Math.random() * 10) + 1));
    console.log(genArray);
    stringLengthChecker(genArray);
}
