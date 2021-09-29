<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "languages" %>
<%block name="title">${_('Language')} ${ctx.name}</%block>

<h2>${_('Language')} ${ctx.name}</h2>

<div class="well-small well">
    ${ctx.description}
</div>

<ul>
    % for cat, (date, secs) in ctx.grouped_valuesets().items():
    <li>${cat} (${date})
        <ul>
            % for i, (sec, subsecs) in enumerate(secs.items()):
                <li>
                    ${sec}

                    <div class="accordion" id="accordion-${str(i + 1)}">

                        % for j, (subsec, vals) in enumerate(subsecs.items()):
                            <%util:accordion_group eid="acc-${str(i + 1)}-${str(j + 1)}" parent="accordion-${str(i + 1)}" title="${subsec}" open="${False}">
                                <table class="table table-condensed">
                                    % for val in vals:
                                        <tr>
                                            <td>${h.link(req, val.parameter)}</td>
                                            <td>${val.values[0].domainelement.description if val.values[0].domainelement else val.values[0].name}</td>
                                            <td>${h.linked_references(req, val)}</td>
                                        </tr>
                                    % endfor
                                </table>
                            </%util:accordion_group>
                        % endfor
                    </div>

                </li>
            % endfor
        </ul>
    % endfor
</ul>


##${request.get_datatable('values', h.models.Value, language=ctx).render()}

<%def name="sidebar()">
    ${util.codes()}
    <div style="clear: right;"></div>
    <%util:well>
        ${request.map.render()}
        ${h.format_coordinates(ctx)}
    </%util:well>
    % if ctx.jsondata['ethonyms']:
        <%util:well title="Also known as">
            ${'; '.join(ctx.jsondata['ethonyms'])}
        </%util:well>
    % endif
    % if ctx.sources:
        <%util:well title="Sources">
            ${util.sources_list(sorted(list(ctx.sources), key=lambda s: s.name))}
            <div style="clear: both;"></div>
        </%util:well>
    % endif
</%def>
