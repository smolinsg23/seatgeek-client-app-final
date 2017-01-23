# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.get('https://data.cityofchicago.org/resource/xzkq-xp2w.json', function(response) {
 +  console.log(response);
 +});
ar boxNumbersClicked = [];
 +
 +function clickBid(Bid) {
 +  boxNumbersClicked.push(boxNumber);
 +  console.log("boxNumbersClicked is ", boxNumbersClicked);
 +  if (boxNumbersClicked[0] === 1 && boxNumbersClicked[1] === 2 && boxNumbersClicked[2] === 3) {
 +    console.log("You win!!!");
 +  }
 +}
View
