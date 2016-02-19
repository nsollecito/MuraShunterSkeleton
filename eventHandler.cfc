component extends="mura.cfobject" output="false" {
	

	public void function onSiteRequestStart($) {
		// determine if request is coming from node.js
		variables.isShunter = find('shunter', CGI.QUERY_STRING);

		// set altTheme folder and returnformat appropriately
		if ( variables.isShunter ) {
			request.altTheme="shunter";
			request.returnFormat="json";
		}
	}


	public void function onSiteRequestEnd($) {
		// make sure we have the proper content type
		if (request.returnFormat == 'json') {
			// grab the page context response 
			var response = getPageContext().getResponse();
			response.setContentType('application/x-shunter+json,application/json');
		}
	}


	// customize the API response
	public void function onApiResponse($) {
		var response = $.event('response');

		// add the sitename and tagline
		response.sitename = $.siteConfig('site');
		response.tagline = $.siteConfig('tagline');
		response.crumblist_links = $.dspCrumbListLinks('crumbList','&nbsp;&raquo;&nbsp;');

		// nav
		response.navbar = $.dspPrimaryNav(
			viewDepth=0
			,id='navPrimary'
			,displayHome='Always'
			,closePortals=true
			,showCurrentChildrenOnly=false
			,class=Iif(YesNoFormat($.siteConfig('skeletonUseTabbedNav')), DE('tabs'), DE('clean'))
		);

		// format the release date
		if ( isDate($.content('releasedate')) ) {
			response.release_date = LSDateFormat( $.content('releaseDate'), $.getLongDateFormat() );
		}

		// global copyright line
		response.copyrightline = "&copy; #year(now())# #HTMLEditFormat($.siteConfig('site'))#";

		// put response back in event scope
		$.event('response', response);
	}
}