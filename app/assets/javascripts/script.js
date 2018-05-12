function clearAlert(){
    if($(".alert-success").length) {
        $(".alert-success").delay(3000).fadeOut();
    }
}

$(document).ready(function() {
    clearAlert();
});
