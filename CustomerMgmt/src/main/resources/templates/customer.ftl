<#include "header.ftl">
<#include "dialog/addsession-dialog.ftl">
<div class="well">
    <a class="btn btn-primary" data-id="${customer.id}" data-name="${customer.name}" data-toggle="modal" data-target="#addsession-dialog"><span class="glyphicon glyphicon-plus-sign"></span> Sessie toevoegen</a>
    <#-- <a class="btn btn-primary" data-id="${customer.id}" data-name="${customer.name}" data-toggle="modal" data-target="#addphoto-dialog"><span class="glyphicon glyphicon-plus-sign"></span> Foto toevoegen</a> -->
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> <strong>${customer.name}</strong></h3>
    </div>
    <div class="panel-body">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-info-sign"></span> Persoonlijke gegevens</a></li>
            <li><a href="#sessions" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-list"></span> Sessies <span class="badge">${sessions?size}</span></a></li>
            <#--<li><a href="#photos" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-picture"></span> Foto's <span class="badge">${photos?size}</span></a></li>-->
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="profile">

                <#if success?exists>
                    <div class="alert-box success">
                        <div class="alert alert-success" role="alert">${success}</div>
                    </div>
                </#if>
                <form class="form-horizontal" method="post" action="/customer/${customer.id?c}" role="form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="id" value="${customer.id?c}">
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="firstname">Voornaam</label>
                        <div class="col-xs-9 col-sm-10"><input type="text" id="firstname" name="firstname" class="form-control" placeholder="Voornaam ..." required="required" value="${customer.firstname}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="name">Naam</label>
                        <div class="col-xs-9 col-sm-10"><input type="text" id="name" name="lastname" class="form-control" placeholder="Naam ..." required="required" value="${customer.lastname}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="phone">Telefoon</label>
                        <div class="col-xs-9 col-sm-10"><input type="text" id="phone" name="phone" class="form-control" placeholder="Telefoon ..." value="${customer.phone}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="email">E-mail</label>
                        <div class="col-xs-9 col-sm-10"><input type="email" id="email" name="email" class="form-control" placeholder="E-mailadres ..." value="${customer.email}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="address">Straat</label>
                        <div class="col-xs-9 col-sm-10"><input type="text" id="address" name="address" class="form-control" placeholder="Adres ..." value="${customer.address}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="postalcode">Postcode</label>
                        <div class="col-xs-9 col-sm-10"><input type="text" id="postalcode" name="postalcode" class="form-control" placeholder="Postcode ..." value="${customer.postalcode}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 col-sm-2 control-label" for="city">Gemeente</label>
                        <div class="col-xs-9 col-sm-10"><input type="text id="city" name="city" class="form-control" placeholder="Gemeente ..." value="${customer.city}"></div>
                    </div>
                    <div class="form-group">
                        <label for="descr" class="col-xs-3 col-sm-2 control-label" data-toggle="collapse" data-target="#customer-description" id="show-cust-descr">Omschrijving</label>
                        <div class="col-xs-9 col-sm-10">
                            <div id="customer-description" class="collapse in"><textarea id="descr" name="description" class="form-control" placeholder="Omschrijving ...">${customer.description}</textarea></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-3 col-sm-offset-2 col-xs-9 col-sm-10">
                            <button type="submit" class="btn btn-primary">Wijzigingen opslaan</button>
                            <a href="/" class="btn btn-link">Annuleren</a>
                        </div>
                    </div>
                </form>
            </div>

            <div class="tab-pane" id="sessions">
                <div class="panel-group" id="accordion">
                    <#list sessions as session>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse_${session.id?c}"><span class="glyphicon glyphicon-calendar"></span> ${session.sessionDate?string["dd/MM/yyyy, HH:mm"]}u</a>
                                </h4>
                            </div>
                            <div id="collapse_${session.id?c}" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <form method="post" action="/customer/${customer.id?c}/session/${session.id?c}" class="form-horizontal" role="form">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <div class="form-group">
                                            <label class="col-xs-3 col-sm-2 control-label" for="complaints">Klachten</label>
                                            <div class="col-xs-9 col-sm-10">
                                                <textarea name="complaints" class="form-control" placeholder="Overzicht van de klachten ...">${session.complaints}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 col-sm-2 control-label" for="evaluation">Evaluatie</label>
                                            <div class="col-xs-9 col-sm-10">
                                                <textarea name="evaluation" class="form-control" placeholder="Therapeutische evaluatie ...">${session.evaluation}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 col-sm-2 control-label" for="evaluation">Prijs</label>
                                            <div class="col-xs-9 col-sm-10"><input name="price" type="text" class="form-control" value="${session.price}"></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-sm-offset-2 col-xs-3 col-sm-10"><button type="submit" class="btn btn-primary alter-session-btn">Wijzigen</button></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="tab-pane" id="photos">
            <#--
            <#list photos as photo>
		 	    <a href="${photo}" data-lightbox="feet" data-title="${customer.name}"><img src="{{ $photo }}" alt="" class="img-thumbnail"></a>
		    </#list>
            </div>
            -->
        </div>
    </div>
</div>

<#-- Add photo dialog -->
<div class="modal fade" id="addphoto-dialog">
    <div class="modal-dialog">
	<div class="modal-content">
	    <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title">Een foto toevoegen voor <span id="dialog_cust_name" class="text-info"></span></h4>
	    </div>
	    <form class="form-horizontal" method="post" action="photo" role="form" enctype="multipart/form-data">
	        <input type="hidden" name="customerId" id="dialog_cust_id">
            <div class="modal-body">
            <div class="form-group">
                <label class="col-sm-4 control-label" for="photo">Selecteer een foto:</label>
                <div class="col-sm-8"><input type="file" id="photo" name="photo"></div>
            </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Toevoegen</button>
                <button type="button" class="btn btn-link" data-dismiss="modal">Annuleren</button>
            </div>
	    </form>
	</div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
	    $('#customer-description').collapse();
    });
</script>
<#include "footer.ftl">