// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js
//= require jquery-ui/widgets/autocomplete
//= require Chart.bundle
//= require chartkick
//= require_tree .

/* Make sure Bootstrap datepicker uses correct date format */
$(function () {
    $('.datepicker-field').datepicker({
        format: 'dd/mm/yyyy'
    });

    $('.datepicker-expiry-field').datepicker({
        format: 'mm/yyyy'
    });
});

/* Register event-handler that flips brand image on mouse over. */
function registerBrandHover(imgOn, imgOff) {
    $(document).ready(function(){
        $('#brand-link').hover(function(){
            $('#brand-image').attr('src', imgOn);
        }, function() {
            $('#brand-image').attr('src', imgOff);
        });
    });
}


