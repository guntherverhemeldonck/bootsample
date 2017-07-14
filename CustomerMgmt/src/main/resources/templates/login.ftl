<!doctype html>
<html>
<#include "head.ftl">
<body class="login">
<div class="modal fade" id="login-dialog" data-backdrop="static">
    <div class="modal-dialog  modal-sm">
        <div class="modal-content">
            <form role="form" method="post" action="login">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="modal-header">
                    <h4 class="modal-title"><span class="glyphicon glyphicon-log-in"></span> Login</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username">Gebruikersnaam</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Gebruikersnaam ingeven">
                    </div>
                    <div class="form-group">
                        <label for="password">Paswoord</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Paswoord ingeven">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="login-btn" class="btn btn-primary">Aanmelden</button>
                </div>
	        </form>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#login-dialog').modal();
    });
</script>
</body>
</html>