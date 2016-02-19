/* global assert */
'use strict';

/*
This is a boilerplate test, used to demonstrate client tests in Mosaic.
You should delete this when you define your own tests.
*/

describe('Boilerplate', function() {

	beforeEach(function() {
		document.body.innerHTML = '<div id="foo"></div>';
	});

	afterEach(function() {
		document.body.innerHTML = '';
	});

	it('Should have a div with an ID of foo', function() {
		var foo = document.getElementById('foo');
		assert.isDefined(foo);
		assert.strictEqual(foo.tagName, 'DIV');
	});

});
