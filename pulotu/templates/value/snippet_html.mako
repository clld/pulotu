<%inherit file="../snippet.mako"/>
<%namespace name="util" file="../util.mako"/>

% if ctx.description:
<p>${ctx.description}</p>
% endif

% if ctx.confidence:
<dl>
    <dt>${_('Confidence')}:</dt>
    <dd>${ctx.confidence}</dd>
</dl>
% endif
