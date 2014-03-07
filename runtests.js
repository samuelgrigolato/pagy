
/* 
 * This file is intented to be run with
 * phantomjs. The exit code means the
 * test suite status: 0 for a successful build
 * and 1 for errors.
 */

console.log('Loading pagy tests...');
var page = require('webpage').create();
var url = 'pagy.tests.html';
page.open(url, function (status)
{
  if (status !== 'success')
  {
    console.log('There was a problem while opening the page... check the network and try again.');
  }
  else
  {
    console.log('Page successfully loaded...');
    page.evaluate(function ()
    {
      QUnit.done(function (results)
      {
	window.PagyTestResults = results;
      });
    });
    var evaluateTestResults;
    evaluateTestResults = function ()
    {
      var results = page.evaluate(function ()
      {
	return window.PagyTestResults;
      });
      if (results == null)
      {
	console.log('Tests have not finished yet...');
	setTimeout(evaluateTestResults, 1000);
      }
      else
      {
	console.log('Tests finished!');
	var succeeded = results.failed == 0;
	var statusCode = succeeded ? 0 : 1;
	phantom.exit(statusCode);    
      }
    };
    setTimeout(evaluateTestResults, 0);
  }
});
