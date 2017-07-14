<div class="modal fade" id="addsession-dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Een sessie toevoegen voor <span id="dialog_cust_name" class="text-info"></span></h4>
            </div>
            <form class="form-horizontal" role="form" method="post" action="/customer/${customer.id?c}/session">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" value="on" name="_bh"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="session_date" class="col-sm-2 control-label">Datum</label>
                        <div class="col-sm-10"><input type="date" id="session_date" name="session_date" class="form-control"/></div>
                    </div>
                    <div class="form-group">
                        <label for="session_time" class="col-sm-2 control-label">Tijdstip</label>
                        <div class="col-sm-10"><input type="time" id="session_time" name="session_time" class="form-control"/></div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-sm-2 control-label">Prijs</label>
                        <div class="col-sm-10"><input type="number" id="price" name="price" step="any" min="0" value="25" class="form-control" placeholder="Afwijkende prijs ..." title="Alternatieve prijs"/></div>
                    </div>
                    <div class="form-group">
                        <label for="complaints" class="col-sm-2 control-label">Klachten</label>
                        <div class="col-sm-10"><textarea id="complaints" name="complaints" class="form-control" placeholder="Overzicht van de klachten ..." rows="3"></textarea></div>
                    </div>
                    <div class="form-group">
                        <label for="evalutation" class="col-sm-2 control-label">Evaluatie</label>
                        <div class="col-sm-10"><textarea id="evaluation" name="evaluation" class="form-control" placeholder="Therapeutische evaluatie ..." rows="3"></textarea></div>
                    </div>
                    <div class="form-group">
                        <label for="bh" class="col-sm-2 control-label">Zichtbaar</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="bh" id="bh" checked="checked">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Opslaan</button>
                    <button type="button" class="btn btn-link" data-dismiss="modal">Annuleren</button>
                </div>
            </form>
        </div>
    </div>
</div>