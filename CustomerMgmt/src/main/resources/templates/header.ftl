<!doctype html>
<html>
<#include "head.ftl">
<body>
    <div class="container-fluid">
          <div class="row">
            <div id="toolbar" class="col-xs-12 col-md-12">
              <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a href="/" class="navbar-brand">Klantenbeheer</a>
                  </div>
                  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                      <li><a href="/addcustomer">+ <span class="glyphicon glyphicon-user"></span> Nieuwe klant</a></li>
                      <li class="hidden"><a href="#" id="btn-report"><span class="glyphicon glyphicon-list-alt"></span> Rapportering</a></li>
                      <li><a href="javascript:logout()"><span class="glyphicon glyphicon-remove-circle"></span> Uitloggen</a></li>
                    </ul>
                    <form id="logout" method="post" action="/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <form id="search-form" class="navbar-form navbar-left" role="search" action="/search" autocomplete="off">
                      <div class="form-group">
                        <div class="input-group">
                            <input id="search-input" type="text" name="q" class="form-control" placeholder="Zoeken ...">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
                        </div>
                      </div>
    		          <ul id="search-results"></ul>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
          </div>
          <div class="row main-content">
            <div class="col-md-12">