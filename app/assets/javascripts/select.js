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

    $('#hiding-link').click(function (e) {
        $('#admin-panel').toggle();
        return e.preventDefault();
    });


    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        $('.js-select').select2({
            allowClear: false,
            theme: "bootstrap",
            width: "100%"
        });
        return event.preventDefault();
    });

});



