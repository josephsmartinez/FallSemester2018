var http = require("http");
var exec = require('child_process').exec;
var os = require('os');

http.createServer(function(req, res) {
	res.writeHead(200, {'Content-Type': 'text/plain'});
	
    // Prints Operating System Information in JSON
	res.write(JSON.stringify({ operating_system: os.arch(), cpu: os.cpus(),
		free_system_memory: os.freemem(),hostname : os.hostname(),
		network_interfaces: os.networkInterfaces(), 
		system_platform: os.platform(),
		release: os.release(),total_memory: os.totalmem(),
		uptime: os.uptime()
	}));
	console.log('JSON Requested');
	res.end();


}).listen(8000);
console.log('Node server running');