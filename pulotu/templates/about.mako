<%inherit file="pulotu.mako"/>
<%namespace name="util" file="util.mako"/>
<%! active_menu_item = "about" %>

<h2>About</h2>


<p class="lead">
    Pulotu, the proto-Polynesian word for the abode of the gods, is a database of supernatural beliefs and practices
    across Austronesian cultures. The database includes 137 Austronesian cultures and 63 variables on religion, history,
    society, and the natural environment. This database is specifically designed to test evolutionary hypotheses of
    religious belief and practice, with a primary focus on the traditional state of cultures. A major advantage of
    Pulotu is that robust language phylogenies are available for Austronesian cultures. This enables the use of
    phylogenetic comparative methods which provide the ability to reconstruct the states of proto-cultures, account for
    common ancestry in cross cultural analysis, and test for correlated evolution between traits.
</p>

<div class="well well-small">
    <ul>
        <li><a href="#db">Database Content</a></li>
        <li><a href="#team">The Team</a></li>
        <li><a href="#funding">Funding and Affiliations</a></li>
        <li><a href="#pubs">Publications</a></li>
        <li><a href="#cite">How to cite</a></li>
    </ul>
</div>


<%util:section title="Database Content" level="3" id="db">
    <h4>Cultures</h4>
    <p class="lead">
        Being expert voyagers, Austronesians settled as far west as Madagascar and as far east as Rapanui - an area
        spanning over half the world’s longitude. The physical environments they inhabited ranged from tiny atolls
        such as Tongareva to the isolated mountainous interiors of large islands such as Taiwan. The social and
        religious features of these cultures were no less diverse. Social structures ranged from acephalous nomadic
        bands to large, complex states. Supernatural beliefs systems included localised nature spirits and the
        spirits of recent ancestors, as well as structured pantheons of powerful gods. Supernatural practices
        include ritual dances, human sacrifice and headhunting. It was this diversity of religious belief and
        practice that inspired the first comparative studies of religion (Swain, & Trompf, 1995).
    </p>
    <h4>Variables</h4>
    <p class="lead">
        Pulotu contains a total of 63 variables of which 17 concern religious belief, 4 religious practice, 10 the
        social environment and 12 the physical environment. This set of variables is divided into three major
        sections, each covering a distinct time period in a cultures history. The first and largest section is the
        traditional state section, which contains information on the state of the culture prior to large-scale
        modernisation. The second section covers the post-contact history, the time period spanning from the
        traditional state of the cultures to their contemporary state. The third section is the contemporary state,
        documenting the contemporary state of the culture.
    </p>
    <h4>Further Information</h4>
    <p class="lead">
        Definitions of the terms used throughout Pulotu can be found in our <a href="/glossary">glossary
        section</a>. For all other enquiries please visit our <a href="/contact">contact page</a>.
    </p>
</%util:section>

<%util:section title="The Team" level="3" id="team">
    <table class="table">
        <tr style="border:none;">
            <th colspan="6"><h4>Chief Editor</h4></th>
        </tr>
        <tr style="border:none;">
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/OliverSheehan.jpg')}"></td>
            <td style="width: 30%;" class="person">Dr. Oliver Sheehan<br>
                <div class="personDescription">
                    Oliver has played a central role in developing and coding the Pulotu database since its inception. 

In recent years Oliver had lead the ongoing development of the Pulotu database and is the current Chief Editor. Oliver is a postdoctoral researchers in the department of psychology at the University of Auckland. 
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:olcsheehan@gmail.com">Email</a>
            </td>
            <td style="width: 10%;"></td>
            <td style="width: 30%;"></td>
            <td style="width: 10%;"></td>
        </tr>
        <tr style="border:none;">
            <th colspan="6"><h4>Leadership and Advisory Team</h4></th>
        </tr>
        <tr style="border:none;">
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/JosephWatts.jpg')}"></td>
            <td class="person">Dr. Joseph Watts<br>
                <div class="personDescription">
                    <em class="shortDesc">Project management, database and website design</em><br>
                    Joseph lead the initial design and construction of Pulotu in collaboration with the rest of the project team.
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="http://www.josephwatts.org" target="blank">Website</a>
                <br><a href="mailto:me@josephwatts.org">Email</a>
            </td>

            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/RussellGray.jpg')}"></td>
            <td class="person"> Prof. Russell Gray <br>
                <div class="personDescription">
                    <em class="shortDesc">Project Leader, overall coordination.</em>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="http://www.psych.auckland.ac.nz/en/about/our-staff/academic-staff/russell-gray.html"
                   target="blank">Website</a>
                <br><a href="mailto:russell_gray@eva.mpg.de">Email</a>
            </td>
        </tr>
        <tr>
            <td><img class="img-polaroid" src="${req.static_url('pulotu:static/TeamPhotos/SimonGreenhill.jpg')}"></td>
            <td class="person"> Dr. Simon Greenhill <br>
                <div class="personDescription">
                    <em class="shortDesc">Associate Investigator, database design</em>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="https://simon.net.nz/" target="blank">Website</a>
                <br><a href="mailto:greenhill@shh.mpg.de">Email</a>
            </td>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/QuentinAtkinson.jpg')}"></td>
            <td class="person"> Prof. Quentin Atkinson<br>
                <div class="personDescription">
                    <em class="shortDesc">Associate Investigator, data analysis</em>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="https://www.quentinatkinson.com/"
                   target="blank">Website</a>
                <br><a href="mailto:q.atkinson@auckland.ac.nz">Email</a>
            </td>
        </tr>
        <tr>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/JosephBulbulia.jpg')}"></td>
            <td class="person"> Prof. Joseph Bulbulia<br>
                <div class="personDescription">
                    <em class="shortDesc">Associate Investigator, religious studies consultant</em>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="https://josephbulbulia.netlify.app/" target="blank">Website</a>
                <br><a href="mailto:joseph.bulbulia@vuw.ac.nz">Email</a>
            </td>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/CarlosBotero.jpeg')}"></td>
            <td class="person"> Prof. Carlos Botero<br>
                <div class="personDescription">
                    <em class="shortDesc">Associate Investigator, ecological modeling
                    </em>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="https://biology.wustl.edu/people/carlos-botero" target="blank">Website</a>
                <br><a href="mailto:carlos.botero.p@gmail.com">Email</a>
            </td>
        </tr>
        <tr style="border:none;">
            <th colspan="6"><h4>Research Team</h4></th>
        </tr>
        <tr>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/StefNg.jpg')}"></td>
            <td class="person">Dr. Stephanie Gomes-Ng<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research and database development</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:sng089@aucklanduni.ac.nz">Email</a>
            </td>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/Angie.jpg')}"></td>
            <td class="person">Dr. Angeline Song<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:song.angeline@gmail.com">Email</a>
            </td>
        </tr>
        <tr>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/JoanneOng.jpg')}"></td>
            <td class="person">Joanne Ong<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:josyinn@gmail.com">Email</a>
            </td>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/SamPassmore.jpg')}"></td>
            <td class="person">Dr Sam Passmore<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="http://www.sampassmore.com/" target="blank">Website</a>
                <br>
                <a href="mailto:passmore.sam@gmail.com">Email</a>
            </td>
        </tr>
        <tr>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/KirstyMaurits.jpg')}"></td>
            <td class="person">Kirsty Maurits<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:purringcat@gmail.com">Email</a>
            </td>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/GoldieHamilton.jpg')}"></td>
            <td class="person">Goldie Hamilton<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:4goldie@gmail.com">Email</a>
            </td>
        </tr>
        <tr class="last">
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/KelseyBuntain.jpg')}"></td>
            <td class="person">Kelsey Buntain<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="mailto:kbun706@aucklanduni.ac.nz">Email</a>
            </td>
            <td style="width:10%;"><img class="img-polaroid"
                                        src="${req.static_url('pulotu:static/TeamPhotos/AlexanderThomson.jpg')}"></td>
            <td class="person">Alex Thomson<br>
                <div class="personDescription">
                    <em class="shortDesc">Cultural research</em><br>
                </div>
            </td>
            <td style="text-align:right; font-weight:normal;">
                <a href="https://ucla.academia.edu/AlexanderThomson">Website</a>
                <a href="mailto:alexander.thomson@ucla.edu">Email</a>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
</%util:section>

<%util:section title="Funding and Affiliations" level="3" id="funding">
    <h4>Funding</h4>
    <p class="lead">
        Pulotu was constructed thanks to funding from the John Templeton Foundation and the Marsden Grant of the
        Royal Society of New Zealand.
    </p>

    <table class="fundLogos" style="text-align: center;">
        <tr>
            <td>
                <a href="http://www.templeton.org" target="_blank">
                    <img style="height: 100px;" src="${req.static_url('pulotu:static/JTF.jpg')}">
                </a>
            </td>
            <td>
                <a href="http://www.royalsociety.org.nz/programmes/funds/marsden/" target="_blank">
                    <img style="height: 100px;" src="${req.static_url('pulotu:static/MF.jpg')}">
                </a>
            </td>
        </tr>
    </table>

    <h4>Affiliations</h4>
    <table class="fundLogos">
        <tr>
            <td>
                <a href=" http://www.psych.auckland.ac.nz/en/about/our-research/research-groups/language-and-cultural-evolution-group.html"
                   target="_blank">
                    <img class="uniLogo" src="${req.static_url('pulotu:static/AU.jpg')}">
                </a>
            </td>
            <td>
                <a href="http://asiapacific.anu.edu.au" target="_blank">
                    <img class="uniLogo" src="${req.static_url('pulotu:static/ANU.png')}"
                         style="height:auto; width:300px;">
                </a>
            </td>
            <td>
                <a href="http://www.shh.mpg.de/en" target="_blank">
                    <img style="height:140px;" class="uniLogo" src="${req.static_url('pulotu:static/MP.png')}">
                </a>
            </td>
            <td>
                <a href="http://www.victoria.ac.nz/sacr" target="_blank">
                    <img class="uniLogo" src="${req.static_url('pulotu:static/VUW.png')}" style="height:150px;">
                </a>
            </td>
        </tr>
    </table>
</%util:section>

<%util:section title="Publications" level="3" id="pubs">
    <ul class="unstyled">
	    <li>
            <blockquote>
                <a href="http://dx.doi.org/10.1038/s41562-018-0379-3">Watts, J., Sheehan, O., Bulbulia, J., Gray, R.D., 
				& Atkinson, Q.D. (2018). Christianity spread faster in small politically structured societies. 
				Nature Human Behaviour, 2, 559-564.</a>
            </blockquote>
        </li>
		<li>
            <blockquote>
                <a href="https://doi.org/10.1073/pnas.1714558115">Sheehan, O., Watts, J., Gray, R.D., & Atkinson, Q.D. 
				(2018). Coevolution of landesque capital intensive agriculture and sociopolitical hierarchy. Proceedings 
				of the National Academy of Sciences, 115 (14), 3628-3633.</a>
            </blockquote>
        </li>
        <li>
            <blockquote>
                <a href="http://dx.doi.org/10.1038/nature17159">Watts, J., Sheehan, O., Atkinson, Q.D., Bulbulia, J., 
				& Gray, R.D. (2016). Ritual human sacrifice promoted and sustained the evolution of stratified 
				societies. Nature, 532 (7598), 228-231.</a>
            </blockquote>
        </li>
		<li>
            <blockquote>
                <a href="http://doi.org/10.1098/rspb.2014.2556">Watts J., Greenhill S.J., Atkinson Q.D., Currie T.E.,
                    Bulbulia J., Gray R.D. (2015). Broad supernatural punishment but not moralizing high gods precede
                    the evolution of political complexity in Austronesia. Proceedings of the Royal Society B., 282.</a>
            </blockquote>
        </li>
        <li>
            <blockquote>
                <a href="http://doi.org/10.1371/journal.pone.0136783"> Watts J., Sheehan O., Greenhill S.J., Gomes-Ng
                    S., Atkinson Q.D., Bulbulia J., Gray R.D. (2015). Pulotu: Database of Austronesian Supernatural
                    Beliefs and Practices. PLoS ONE 10(9)</a>
            </blockquote>
        </li>
    </ul>
</%util:section>

<%util:section title="How to cite" level="3" id="cite">
    <p class="lead">Please read the <a href="/conditionsofuse">conditions of use</a> page before publishing any data
        from Pulotu.
    </p>
    <p class="lead">Pulotu can be cited as follows:</p>
    <blockquote>
        <a href="http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0136783" target="_blank">Watts J.,
            Sheehan O., Greenhill S.J., Gomes-Ng S., Atkinson Q.D., Bulbulia J., Gray R.D. (2015). Pulotu: Database
            of Austronesian Supernatural Beliefs and Practices. PLoS ONE 10(9).</a>
    </blockquote>
</%util:section>
