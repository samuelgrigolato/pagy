
/* 
 * This file is intented to be run with
 * phantomjs. The exit code means the
 * test suite status: 0 for a successful build
 * and 1 for errors.
 */

var system = require('system');
var args = system.args;
if (args.length !== 3)
{
  console.log('Usage: phantomjs phantomjs-qunit <url> <max-retries>'); 
  phantom.exit(1);
}
var url = args[1];
var maxRetries = args[2];

console.log('Loading "' + url + '"...');
var page = require('webpage').create();
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
    var retries = 0;
    var evaluateTestResults;
    evaluateTestResults = function ()
    {
      var results = page.evaluate(function ()
      {
	return window.PagyTestResults;
      });
      if (results == null)
      {
	retries++;
	if (retries == maxRetries)
	{
	  console.log('Max number of retries reached... Can\'t test anymore =[');
	  phantom.exit(1);
	}
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
