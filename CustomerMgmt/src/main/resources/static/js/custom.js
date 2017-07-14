$(function(){
    var $frm=$('#search-form'), $res=$('#search-results');
    $res.hide();

    $('.modal').on('shown.bs.modal', function(e) {
        centerModal(this);
        var $btn = $(e.relatedTarget);
        $('.modal #dialog_cust_name').html($btn.data('name'));
    });

    $('#search-input').keypress(function(e){if (e.keyCode == 13) e.preventDefault(); });
    $('#search-input').keyup(function(e){
        var $f = $(e.target)
        if ($f.val().length > 2){
            $.ajax({ url: $frm.prop('action')+'?q='+$f.val(), context: document.body }).done(function(data) {
                $res.html('');
                $.each(data, function(i, elm){
                    $res.html($res.html() + '<li><a href="/customer/'+elm.id+'">'+elm.firstname+' '+elm.lastname+'</a></li>');
                });
                $res.show();
            });
        } else {
            $res.html('');
            $res.hide();
        }
    });

    $('#login-btn').click(function(){
        if ($('#password').val() === 'test'){
            login();
        }
    });
    $('#logout').click(function(){
        logout();
    });
    $(window).on("resize", function () {
        $('.modal:visible').each(function(){
            centerModal(this);
        });
    });
});

function centerModal(me) {
    var $me=$(me);
    $me.css('display', 'block');
    var $dialog = $me.find(".modal-dialog");
    var offset = ($(window).height() - $dialog.height()) / 2;
    // Center modal vertically in window
    $dialog.css("margin-top", offset);
}

function logout(){
    $('#logout').submit();
}
function login(){
    $('body').removeClass('logged-out');
    $('#login-dialog').hide();
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)===' ') c = c.substring(1);
        if (c.indexOf(name) !== -1) return c.substring(name.length,c.length);
    }
    return "";
}

function removeClient(url){
    if(confirm('Wenst u deze klant te desactiveren?')){
        document.location.href=url;
    }
}
