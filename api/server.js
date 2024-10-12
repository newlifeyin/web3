const express = require('express')//Import Express Framework
const app = express()
const cors = require('cors')

//Middleware: Set response headers to support CORS and other configurations
app.all('*', function (req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");//Allow all domains to access
	res.header("Access-Control-Allow-Headers", "X-Requested-With");//Allow specific request headers
	res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");//Permitted HTTP methods
	res.header("X-Powered-By", ' 3.2.1')//Set X-Powered-By response header
	res.header("Content-Type", "application/json;charset=utf-8");//Set the response content type to JSON
	next();
});

app.use(express.json())
app.use(cors())

let user = require('./api.js');//Import user related routing modules
app.use(user);

module.exports = app
const port = 9001//Define the port on which the application runs
app.listen(port, () => {
	console.log(`app is running at http://localhost:${port}`)
})