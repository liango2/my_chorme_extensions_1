// /**
//  *
//  * 参考了： http://stackoverflow.com/questions/24346161/nodejs-connect-cannot-find-static  // notwork
//  *          http://stackoverflow.com/questions/9627441/cannot-get-with-connect-on-node-js  // ok
//  */ 

//
// //Option 1
// // You can install an older, 2.x version of connect and use that as is:
// // 
// // $ npm install connect@2.X
// var connect = require('connect');
// 
// connect.createServer(
// 	connect.static("../angularjs")
// ).listen(5000);

// not work
// // Option 2
// // You can continue to use the 3.x version of connect, and also add serve-static:
// //
// // $ npm install serve-static
// var connect = require('connect');
// var serveStatic = require('serve-static');
// 
// connect().use(
//     serveStatic("../angularjs")
// ).listen(5000);


// ok
var connect = require("connect");
var serveStatic = require('serve-static');

console.log("__dirname = " +__dirname);
//var app = connect().use(connect.static(__dirname + '/public'));

var con= connect()
var app = con.use(
    connect.static(__dirname)
)
app = con.use(
     serveStatic("../angularjs")
);
app.listen(5000);


