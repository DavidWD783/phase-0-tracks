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
  console.log(string_array_storage[0]);
  return string_array_storage[0];
}


// Driver Code
stringLengthChecker(["long phrase","longest phrase","longer phrase"]) // return "longest phrase".
stringLengthChecker(["long", "1", "super dooper  long"])
stringLengthChecker(["one", "one", " one "])
