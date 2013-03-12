// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .



function look_for_new_pages() {
  
  $.get("/look_for_new_pages")
    .done(function(data){
      if (data.pages != undefined){
        $("#newPages").text(data.pages.length);
      }
    });
  
}

function look_for_new_tweets() {
  
  $.post("/look_for_new_tweets");
  
}


var lookForNewTweetsTimerId = setInterval(look_for_new_tweets, 120000);
var lookForNewPagesTimerId  = setInterval(look_for_new_pages, 30000);

look_for_new_pages();