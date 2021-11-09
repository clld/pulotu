<%inherit file="app.mako"/>


<%block name="head">
    <style>
        @font-face {
            font-family:BerlinSansDemi;
            src:url("${req.static_url('pulotu:static/fonts/BRNLSDB.eot')}");
            src:url("${req.static_url('pulotu:static/fonts/BRNLSDB.eot')}#iefix") format("embedded-opentype"),
            url("${req.static_url('pulotu:static/fonts/BRLNSDB.woff')}") format("woff"),
            url("${req.static_url('pulotu:static/fonts/BRLNSDB.TTF')}") format("truetype"),
            url("${req.static_url('pulotu:static/fonts/BRLNSDB.svg')}#svgFontName") format("svg");
        }

        @font-face {
            font-family:BerlinSansReg;
            src:url("${req.static_url('pulotu:static/fonts/BRLNSR.eot')}");
            src:url("${req.static_url('pulotu:static/fonts/BRLNSR.eot')}#iefix") format("embedded-opentype"),
            url("${req.static_url('pulotu:static/fonts/BRLNSR.woff')}") format("woff"),
            url("${req.static_url('pulotu:static/fonts/BRLNSR.TTF')}") format("truetype"),
            url("${req.static_url('pulotu:static/fonts/BRLNSR.svg')}#svgFontName") format("svg");
        }

        @font-face {
            font-family:FranklinGothicBook;
            src: url("${req.static_url('pulotu:static/fonts/frabk-webfont.ttf')}") format("truetype");
        }
    </style>
</%block>

##
## define app-level blocks:
##
<%block name="header">
      <div id="header">
		<img class="logo" src="${req.static_url('pulotu:static/HeadLogo.jpg')}" width="50" />
		<div class="logo">
		    <div class="logo-title">${req.dataset.name}</div>
            <br/>
		    <div class="logo-text">${req.dataset.description}</div>
		</div>
      </div>
          <br style="clear: both"/>
</%block>

<%block name="footer">
    <div style="text-align: center; font-size: larger">
        <a href="${req.route_url('legal')}">Legal</a> |
        <a href="${req.route_url('download')}">Download</a> |
        <a href="${req.route_url('contact')}">Contact</a> |
        <a href="https://www.eva.mpg.de/privacy-policy.html">Privacy Policy</a>
    </div>
</%block>


${next.body()}
