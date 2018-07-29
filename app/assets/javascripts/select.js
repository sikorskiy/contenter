document.addEventListener("turbolinks:load", function() { //don't know why, but this is some turbolinks issues
    $('.js-select').select2({
        allowClear: false,
        theme: "bootstrap",
        width: "100%"
    });

    $('.js-select-new').select2({
        allowClear: false,
        theme: "bootstrap",
        width: "100%",
        tags: true
    });


});

$(document).ready(function(){
    (function() {
        $('#hiding-link').click(function(e) {
            return e.preventDefault();
        });

    }).call(this);


    $('#hiding-link').click(function () {
        $('#admin-panel').toggle();
    });

});