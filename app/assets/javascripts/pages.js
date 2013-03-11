$(document).ready(function(){
  $("#read,#delete",".page").on("click", function(e){
    e.preventDefault();
    var url = $(this).attr("data-href");

    $.post(url)
      .done(function(data){
        if(data.status == "readed"){
          $("#read").attr("disabled","disabled").text("Readed");
        }else if(data.status == "deleted"){
          $("#next")
            .trigger('click');
        }
      })
      .fail(function(){});
  });
});