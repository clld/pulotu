<%inherit file="pulotu.mako"/>
<%namespace name="mpg" file="clldmpg_util.mako"/>

<h2>Downloads</h2>

<div class="alert alert-info">
    <p class="lead">
        The Pulotu web application serves the latest
        ${h.external_link('https://github.com/D-PLACE/pulotu/releases', label='released version')}
        of data curated at
        ${h.external_link('https://github.com/D-PLACE/pulotu', label='D-PLACE/pulotu')}.

        ##Older released version are accessible via <br/>
        ##<a href="https://doi.org/10.5281/zenodo.3606197"><img
        ##        src="https://zenodo.org/badge/DOI/10.5281/zenodo.3606197.svg" alt="DOI"></a>
        ##<br/>
        ##on ZENODO as well.
    </p>
    <p class="lead">
        The Pulotu dataset is distributed under a
        <a rel="license" href="${request.dataset.license}">
            ${request.dataset.jsondata.get('license_name', request.dataset.license)}</a>.
    </p>
</div>


<p class="lead">
    The first published version of the Pulotu dataset can be
    <a href="https://doi.org/10.6084/m9.figshare.1472946">downloaded through figshare [DOI: 10.6084/m9.figshare.1472946]</a>
    as a tab-delimited text file.
    The <a href="https://doi.org/10.1371/journal.pone.0136783.s002">codebook [DOI: 10.1371/journal.pone.0136783.s002]</a> is available
    in the supplementary materials of the paper
    <a  href="https://doi.org/10.1371/journal.pone.0136783">
        Watts J., Sheehan O., Greenhill S.J., Gomes-Ng S., Atkinson Q.D., Bulbulia J., Gray R.D. (2015). Pulotu: Database of Austronesian Supernatural Beliefs and Practices. PLoS ONE 10(9).
        [DOI: 10.1371/journal.pone.0136783]
    </a>
</p>
