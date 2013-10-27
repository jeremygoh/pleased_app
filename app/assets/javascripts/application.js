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
});

function updateTime()
{
  var date = new Date();

  var month = date.getMonth()+1;
  var day = date.getDate();
  var year = date.getFullYear();

  var str = day+'/'+month+'/'+year;
  $('span.current_time').html(str);

  window.setTimeout(updateTime, 1000);
}
