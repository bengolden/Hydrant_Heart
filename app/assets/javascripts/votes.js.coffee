# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  console.log("hello");
  $('vote_button').on('click', function(e){
    e.preventDefault();
    console.log("Hello");
    var url = '/votes';
    var data = this.data();
    console.log(data);

    $.post(url, data, function(resp){
      console.log(resp);
    });
  }); 
});
