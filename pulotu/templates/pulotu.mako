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
		    <div class="logo-title">Pulotu</div>
            <br/>
		    <div class="logo-text">Database of Pacific Religions</div>
		</div>
      </div>
          <br style="clear: both"/>
</%block>

${next.body()}
