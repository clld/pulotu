<%inherit file="app.mako"/>

##
## define app-level blocks:
##
<%block name="header">
      <div id="header">
		<img class="logo" src="${req.static_url('pulotu:static/HeadLogo.jpg')}" width="50" />
		<div class="logo">
		    <div class="logo-title">Pulotu</div>
            <br/>
		    <div class="logo-text">Database of Pacific Religions</div>
		</div>
      </div>
          <br style="clear: both"/>
</%block>

${next.body()}
