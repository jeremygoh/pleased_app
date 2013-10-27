// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(function() {
  updateTime();

  $(".attend_checkbox").on("click", function(event){
    checkbox = $(this)
    parent_form = $(this).parent();
    var valuesToSubmit = $(parent_form).serialize();
    meeting_id = $(parent_form).children('.meeting').val()
    url = '/meetings/' + meeting_id + "/attends"
    $.ajax({
        type: "POST",
        url: url,
        data: valuesToSubmit,
        success: function(){
          console.log("sdsdsd");
          $('body').prepend('<div id="attend-notifications"></div>')
          $('#attend-notifications').text("Successfully updated attendance")
          $('#attend-notifications').fadeOut(2000)
        }
        }
      )
  });


});

function pad2(number)
{
  return number < 10 ? '0'+number : number;
}

function updateTime()
{
  var date = new Date();

  var month = date.getMonth()+1;
  var day = date.getDate();
  var year = date.getFullYear();

  var hour = pad2(date.getHours());
  var minute = pad2(date.getMinutes());
  var second = pad2(date.getSeconds());

  var str = day+'/'+month+'/'+year+', '+hour+':'+minute+':'+second;

  $('span.current_time').html(str);
  window.setTimeout(updateTime, 1000);
}
