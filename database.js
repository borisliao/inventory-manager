const mysql = require('mysql');
const dotenv = require('dotenv');

//Setup the .env
dotenv.config();

//Setting up database
var connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: 'CheckSum'
});

connection.connect();
module.exports = connection;
