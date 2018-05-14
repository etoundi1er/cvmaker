function clearAlert(){
    if($(".alert-success").length) {
        $(".alert-success").delay(3000).fadeOut();
    }
}

// Sortable tables
function enableSortable() {
    $(".js-sortable").sortable({
        connectWith: '.js-sortable',
        handle: ".js-move-handle",
        axis: "y",
        update: function() {
            return $.post($(this).data("sort-url"), $(this).sortable("serialize"));
        }
    });
}

$(document).ready(function() {
    clearAlert();
});
