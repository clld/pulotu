<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "parameters" %>
<%block name="title">${_('Parameters')}</%block>

<%block name="head">
    ${parent.head()}
    <style>
        div.dataTables_paginate {display: none}
        div.dt-parameters-traditionalculture-toolbar {display: none}
        div.dt-parameters-postcontacthistory-toolbar {display: none}
        div.dt-parameters-currentculture-toolbar {display: none}
    </style>
</%block>

<h2>${title()}</h2>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#trad" data-toggle="tab">Traditional Culture</a></li>
        <li><a href="#post" data-toggle="tab">Post Contact History</a></li>
        <li><a href="#curr" data-toggle="tab">Current Culture</a></li>
    </ul>
    <div class="tab-content" style="overflow: visible;">
        <div id="trad" class="tab-pane active">
            ${request.get_datatable('parameters', h.models.Parameter, focus='Traditional Culture').render()}
        </div>
        <div id="post" class="tab-pane">
            ${request.get_datatable('parameters', h.models.Parameter, focus='Post Contact History').render()}
        </div>
        <div id="curr" class="tab-pane">
            ${request.get_datatable('parameters', h.models.Parameter, focus='Current Culture').render()}
        </div>
    </div>
    <script>
$(document).ready(function() {
    if (location.hash !== '') {
        $('a[href="#' + location.hash.substr(2) + '"]').tab('show');
    }
    return $('a[data-toggle="tab"]').on('shown', function(e) {
        return location.hash = 't' + $(e.target).attr('href').substr(1);
    });
});
    </script>
</div>
