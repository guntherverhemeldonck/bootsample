<#include "header.ftl">
<h1><span class="glyphicon glyphicon-user"></span> Een nieuwe klant toevoegen</h1>
<form method="post" action="customer">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" value="on" name="_bh"/>
    <div class="form-group">
        <div class="panel-group" id="new-user-accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#new-user-accordion" href="#collapseDetails"><span class="glyphicon glyphicon-tags"></span> Basisgegevens</a>
                    </h4>
                </div>
                <div id="collapseDetails" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="firstname" class="col-xs-3 col-sm-2 control-label">Voornaam</label>
                            <div class="col-xs-9 col-sm-10"><input type="text" name="firstname" class="form-control" placeholder="Voornaam ..." required="required"></div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-xs-3 col-sm-2 control-label">Naam</label>
                            <div class="col-xs-9 col-sm-10"><input type="text" name="lastname" class="form-control" placeholder="Naam ..." required="required"></div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-xs-3 col-sm-2 control-label">Telefoon</label>
                            <div class="col-xs-9 col-sm-10"><input type="text" name="phone" class="form-control" placeholder="Telefoon ..."></div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-xs-3 col-sm-2 control-label">E-mail</label>
                            <div class="col-xs-9 col-sm-10"><input type="email" name="email" id="email" class="form-control" placeholder="E-mail ..."></div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-xs-3 col-sm-2 control-label">Straat</label>
                            <div class="col-xs-9 col-sm-10"><input type="text" name="address" class="form-control" placeholder="Straat ..."></div>
                        </div>
                         <div class="form-group">
                            <label for="postalcode" class="col-xs-3 col-sm-2 control-label">Postcode</label>
                            <div class="col-xs-5 col-sm-3"><input type="text" name="postalcode" class="form-control" placeholder="Postcode ..."></div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-xs-3 col-sm-2 control-label">City</label>
                            <div class="col-xs-5"><input type="text" name="city" class="form-control" placeholder="Gemeente ..."></div>
                        </div>
                        <div class="form-group">
                            <label for="descr" class="col-xs-3 col-sm-2 control-label">Omschrijving</label>
                            <div class="col-xs-9 col-sm-10"><textarea id="descr" name="description" class="form-control" placeholder="Omschrijving ..." rows="3"></textarea></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#new-user-accordion" href="#collapseSession"><span class="glyphicon glyphicon-calendar"></span> Nieuwe sessie registeren</a>
                    </h4>
                </div>
                <div id="collapseSession" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="session_date" class="col-xs-3 col-sm-2 control-label">Datum</label>
                            <div class="col-xs-9 col-sm-10"><input type="date" id="session_date" name="session_date" class="form-control"></div>
                        </div>
                        <div class="form-group">
                            <label for="session_time" class="col-xs-3 col-sm-2 control-label">Tijdstip</label>
                            <div class="col-xs-9 col-sm-10"><input type="time" id="session_time" name="session_time" class="form-control"/></div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-xs-3 col-sm-2 control-label">Prijs</label>
                            <div class="col-xs-9 col-sm-10"><input type="number" id="price" value="25" name="price" step="any" min="0" class="form-control"/></div>
                        </div>
                        <div class="form-group">
                            <label for="complaints" class="col-xs-3 col-sm-2 control-label">Klachten</label>
                            <div class="col-xs-9 col-sm-10"><textarea name="complaints" class="form-control" placeholder="Overzicht van de klachten ..." rows="3"></textarea></div>
                        </div>
                        <div class="form-group">
                            <label for="evaluation" class="col-xs-3 col-sm-2 control-label">Evaluatie</label>
                            <div class="col-xs-9 col-sm-10"><textarea name="evaluation" class="form-control" placeholder="Therapeutische evaluatie ..." rows="3"></textarea></div>
                        </div>
                        <div class="form-group">
                            <label for="bh" class="col-xs-3 col-sm-2 control-label">Zichtbaar</label>
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="bh" id="bh" checked="checked">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
           <button type="submit" class="btn btn-primary">Opslaan</button>
           <a href="/home" class="btn btn-link">Annuleren</a>
        </div>
    </div>
</form>
<#include "footer.ftl">