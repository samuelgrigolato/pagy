
var static = require('node-static');

var folder = new(static.Server)();

require('http').createServer(function (request, response) {
  
  if (request.url == "/") {
    
    response.statusCode = 301; // redirect
    response.setHeader('Location', 'pagy.html');
    response.end();
    
  } else {

    request.addListener('end', function () {
	folder.serve(request, response);
    }).resume();
  
  }
    
}).listen(process.env.PORT || 5000);