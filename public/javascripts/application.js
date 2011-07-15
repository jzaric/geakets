// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    $('a[data-method=delete]').click(function(e){
        e.preventDefault();
        var form = $('<form></form').appendTo('body');
        $(form).attr({'action': $(this).attr('href'), 'method': 'post'});
        $('<input type="hidden"/>').appendTo(form).attr({'name': '_method', 'value': 'delete'});
        $('<input type="hidden"/>').appendTo(form).attr({'name': $('meta[name=csrf-param]').attr('content'), 'value': $('meta[name=csrf-token]').attr('content')});
        $(form).submit();
    });
})
