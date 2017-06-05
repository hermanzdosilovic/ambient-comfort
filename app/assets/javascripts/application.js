//= require jquery
//= require semantic-ui
//= require Chart.bundle
//= require chartkick
//= require rails-ujs
//= require turbolinks
//= require_tree .

function getUrlParameter(param) {
    var pageURL = decodeURIComponent(window.location.search.substring(1));
    var urlVariables = pageURL.split('&');
    var parameterName;

    for (var i = 0; i < urlVariables.length; i++) {
        parameterName = urlVariables[i].split('=');
        if (parameterName[0] === param) {
            return parameterName[1] === undefined ? true : parameterName[1];
        }
    }
}

$(document).ready(function() {
    var reloadTimeout = 2000;
    var liveReload = true;
    function reloadData() {
        if (!liveReload) {
            return;
        }

        $.ajax({
            url: '/?page=' + (getUrlParameter('page') || 1),
            dataType: 'script',
            success: function(data, textStatus, jqXHR) {
                setTimeout(reloadData, reloadTimeout);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                setTimeout(reloadData, reloadTimeout);
            }
        });
    }

    setTimeout(reloadData, reloadTimeout);

    $("body").on("click", "#toggle-live-reload-btn", function() {
        liveReload = !liveReload;
        var text = liveReload ? "Stop" : "Start";
        var icon = liveReload ? "stop" : "play";
        $("#toggle-live-reload-btn").html(`<i class=\"${icon} icon\"></i>${text} Live Reload`);
        if (liveReload) {
            setTimeout(reloadData, 100);
        }
    });
});