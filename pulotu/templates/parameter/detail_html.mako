<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "parameters" %>
<%block name="title">${ctx.name}</%block>


<div class="span4" style="float: right; margin-top: 1em;">
    <%util:well title="Values">
            % if ctx.domain:
                <table class="table table-condensed">
                % for de in ctx.domain:
                    <tr>
                        <td>${h.map_marker_img(req, de)}</td>
                        <td>${de.name}</td>
                        <td>${de.description}</td>
                        <td class="right">${len(de.values)}</td>
                    </tr>
                % endfor
                </table>
            % else:
                <table class="noborders">
                    % for label, color in ctx.jsondata['colorbar'].items():
                        <tr>
                            <td style='height: 20px; width: 1em; background-color: ${color}'> </td>
                            <td>
                                % if loop.first or loop.last:
                                    ${label}
                                % endif
                            </td>
                        </tr>
                    % endfor
                </table>
            % endif
    </%util:well>
</div>


<h2 class="question-title">${ctx.name}</h2>

% if ctx.section_notes:
<p class="lead">${ctx.section_notes}</p>
% endif

% if ctx.description:
    <p class="lead">${ctx.description}</p>
% endif

<div style="clear: both"/>
% if map_ or request.map:
${(map_ or request.map).render()}
% endif

${request.get_datatable('values', h.models.Value, parameter=ctx).render()}
