const mysql = require("mysql");

var con = mysql.createConnection({
    host: "localhost",
    user: process.env.SQL_USER,
    password: process.env.SQL_PASS,
    database: "thetgcju_pokemon"
});


module.exports = con;