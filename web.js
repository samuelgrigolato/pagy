
var static = require('node-static');

var folder = new(static.Server)();

require('http').createServer(function (request, response) {
    request.addListener('end', function () {
        folder.serve(request, response);
    }).resume();
}).listen(process.env.PORT || 5000);