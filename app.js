'use strict';

var shunter = require('shunter');

var app = shunter({
	routes: require('./config/routes.json'),
	statsd: require('./config/statsd.json'),
	syslogAppName: 'shunter-boilerplate',
	jsonViewParameter: 'json',
	path: {
		themes: __dirname
	}
});

app.start();
