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
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

$(document).ready(function() {
  $('.hint').tooltip();

  var input = $('input[data-currency],input.currency');
  input.css('text-align', 'right');
  input.value = input.value
  input.maskMoney({
    prefix: '',
    thousands: ".",
    decimal: ","
  }).focus();

  $('.simple_form').on('submit', function(e){
    $(this).find('input.currency').each(function() {
      $(this).val($(this).maskMoney('unmasked')[0]);
    });
  });
});