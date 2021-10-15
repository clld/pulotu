<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "contributions" %>


<h2>${h.link(request, ctx.language)}/${h.link(request, ctx.parameter)}</h2>

% for i, value in enumerate(ctx.values):
<div style="clear: right;">
        <dl>
            <dt>Coded value:</dt>
            <dd>
                ${h.map_marker_img(request, value)}
                ${value}
                % if value.domainelement:
                    ${value.domainelement.description}
                % endif
            </dd>
    % if value.confidence:
        <dt>${_('Confidence')}:</dt>
            <dd>${value.confidence}</dd>
    % endif
            % if value.description:
                <dt>Notes:</dt>
                <dd>${value.description}</dd>
            % endif
        </dl>
</div>
% endfor
<%def name="sidebar()">
<div class="well well-small">
<dl>
    <dt class="contribution">${_('Contribution')}:</dt>
    <dd class="contribution">
        ${h.link(request, ctx.contribution)}
        by
        ${h.linked_contributors(request, ctx.contribution)}
        ${h.button('cite', onclick=h.JSModal.show(ctx.contribution.name, request.resource_url(ctx.contribution, ext='md.html')))}
    </dd>
    <dt class="language">${_('Language')}:</dt>
    <dd class="language">${h.link(request, ctx.language)}</dd>
    <dt class="parameter">${_('Parameter')}:</dt>
    <dd class="parameter">${h.link(request, ctx.parameter)}</dd>
    % if ctx.references or ctx.source:
    <dt class="source">${_('Source')}:</dt>
        % if ctx.source:
        <dd>${ctx.source}</dd>
        % endif
        % if ctx.references:
        <dd class="source">${h.linked_references(request, ctx)|n}</dd>
        % endif
    % endif
    ${util.data(ctx, with_dl=False)}
</dl>
</div>
</%def>
