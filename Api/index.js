//require('dotenv').config();
var express = require("express");
const app = express();
const helmet = require("helmet");
const cors = require("cors");
const sql = require("./sql/sql");
var port = process.env.PORT || 3000;
const jwt = require("jsonwebtoken");
const auth = require("./auth.js");
const gets = require("./routes/getapi.js");
const posts = require("./routes/postapi.js");
var bodyParser = require('body-parser');

var jsonParser = bodyParser.json();

app.use(express.urlencoded({limit: '10mb', extended:false}));
app.use(bodyParser.json({limit: '10mb', extended: false}))


app.use(express.static('public'));
app.use(express.json());
app.use(cors());
app.use(helmet());
app.use(gets);
app.use(posts);


app.get("/", (req,res) => {
    res.send("Hello!");
});

app.post("/teste", (req,res) => {
    var hello = req.body.img
    var nome = Math.floor(Math.random() * 100000000);
    require("fs").writeFile("./public/pokemons/" + nome + ".jpg", hello, 'base64', function(err) {
        console.log(err);
    });
    res.send(hello)
});



app.listen(port, () => {
    console.log("Listenning at: ", port);
});
