document.addEventListener("turbolinks:load", function() { //don't know why, but this is some turbolinks issues
    $('.js-select').select2({
        allowClear: false,
        selectOnClose: true,
        theme: "bootstrap",
        width: "100%"
    });
});