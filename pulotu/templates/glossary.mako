<%inherit file="pulotu.mako"/>
<%namespace name="util" file="util.mako"/>
<%! active_menu_item = "glossary" %>


<h2>Glossary</h2>

<ul id="initials" class="inline">
    % for initial in terms:
    <li><a href="#initial-${initial}">${initial}</a></li>
    % endfor
</ul>

<table class="table">
    % for initial, items in terms.items():
        <tr><th id="initial-${initial}">${initial}</th><td> </td></tr>
            % for term, definition in items:
                <tr><td>${term}</td><td>${definition}</td></tr>
            % endfor
    % endfor
</table>
