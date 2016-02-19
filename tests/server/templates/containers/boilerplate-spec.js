'use strict';

/*
This is a boilerplate test, used to demonstrate template tests in Mosaic.
You should delete this when you define your own tests.
*/

var assert = require('proclaim');
var rootdir = __dirname.substring(0, __dirname.indexOf('/tests/'));
var helper = require('shunter').testhelper();

describe('Container: Boilerplate', function() {

	before(function() {
		helper.setup(
			rootdir + '/view/containers/boilerplate.dust'
		);
	});
	after(helper.teardown);

	it('Should render the title', function(done) {
		helper.render('containers__boilerplate', {
			layout: {
				namespace: 'shunter-boilerplate'
			},
			title: 'Hello World!'
		}, function(err, dom, out) {
			var $ = dom.$;
			assert.isNotNull(out);
			assert.strictEqual($('h1').text(), 'Hello World!');
			done();
		});
	});

});
