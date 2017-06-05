//= require jquery
//= require semantic-ui
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
    function reloadData() {
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
});