const jwt = require("jsonwebtoken");

var auth = {
    authenticateUser: function authenticateUser(req, res, next){
                            const authHeader = req.headers["authorization"];
                            const token = authHeader && authHeader.split(" ");
                            if(token == null) return res.sendStatus(401);

                            jwt.verify(token[1], process.env.ACCESS_TOKEN, (err, user) => {
                                if(err) return res.sendStatus(403);
                                if(token[0] == "jwt")
                                {
                                  req.user = user;
                                  next();
                                }
                                else{
                                  res.sendStatus(403);
                                }
                            });
                      }
}

module.exports = auth;