const express = require("express");
const routes = express.Router();
const sql = require("../sql/sql");
const auth = require("../auth.js");
const fs = require('fs')

//Eliminar Pokemons
routes.post("/DeletePokemon", auth.authenticateUser, (req,res) => {
  var id = req.body.id;
  sql.query("Delete From pokedex Where IDPokedex = ?", [id], (error,result) => {
    if(error){
      res.json([{Response: "Error"}]);
      throw error;
    }else{
      res.json([{Response: "Done"}]);
    }
  })
})

//Update Pokemon
routes.post("/UpdatePokemon", auth.authenticateUser, (req,res) => {
  sql.query("Select IDTypePoke FROM typepoke WHERE TypePoke = ?", [req.body.pokemonType], (err,result) => {
    if(err){
      throw err;
    }else{
      if(req.body.pokemonImage != ""){
        var bytes = req.body.pokemonImage;
        var nome = Math.floor(Math.random() * 100000000);
        fs.writeFile("./public/pokemons/" + nome + ".png", bytes, 'base64', function(err) {
            console.log(err);
        });
        var link = "https://poke.thetroia.com/pokemons/" + nome + ".png";
        sql.query("UPDATE pokedex SET IDTypePoke = ?, PokeName = ?, PokeFoto = ? WHERE IDPokedex = ?", [result[0].IDTypePoke,req.body.pokemonData.PokeName,link,req.body.pokemonData.IDPokedex]);
      }else{
        sql.query("UPDATE pokedex SET IDTypePoke = ?, PokeName = ? WHERE IDPokedex = ?", [result[0].IDTypePoke,req.body.pokemonData.PokeName,req.body.pokemonData.IDPokedex]);
      }
      sql.query("DELETE FROM pokeatacks WHERE IDPokedex = ?", [req.body.pokemonData.IDPokedex]);
      for(var a in req.body.pokemonAtacks){
        sql.query("INSERT INTO pokeatacks(IDPokedex,Ataque,Dano) VALUES (?,?,?)", [req.body.pokemonData.IDPokedex,req.body.pokemonAtacks[a].Ataque,req.body.pokemonAtacks[a].Dano])
      }
      res.json([{Response: "Done"}]);
    }
  })
})

//Insert Pokemon
routes.post("/InsertPokemon", auth.authenticateUser, (req,res) => {
  sql.query("Select IDTypePoke FROM typepoke WHERE TypePoke = ?", [req.body.pokemonType], (err,result) => {
    if(err){
      throw err;
    }else{
      var bytes = req.body.pokemonImage;
      var nome = Math.floor(Math.random() * 100000000);
      fs.writeFile("./public/pokemons/" + nome + ".png", bytes, 'base64', function(err) {
          console.log(err);
      });
      var link = "https://poke.thetroia.com/pokemons/" + nome + ".png";
      sql.query("INSERT INTO pokedex(IDTypePoke,PokeName,PokeVida,PokeFoto) Values (?,?,?,?)", [result[0].IDTypePoke,req.body.pokemonData.PokeName,req.body.pokemonData.PokeVida,link], (error, result2) => {
        if(error){
          throw error;
        }else{
          sql.query("INSERT INTO pokenivel(IDPokedex,Nivel,NivelXP) VALUES (?,1,0)", [result2.insertId])
          for(var a in req.body.pokemonAtacks){
            sql.query("INSERT INTO pokeatacks(IDPokedex,Ataque,Dano) VALUES (?,?,?)", [result2.insertId,req.body.pokemonAtacks[a].Ataque,req.body.pokemonAtacks[a].Dano])
          }
        }
      });

      res.json([{Response: "Done"}]);
    }
  })
})

routes.post("/InsertHistorico", auth.authenticateUser, (req,res) => {
  sql.query("INSERT INTO pokemoninimigo (IDPokedex) VALUES (?)", [req.body.IDPokemonInimigo], (err,result) => {
    if(err){
      throw err;
    }else{
      sql.query("INSERT INTO historicobatalhas (IDPokedexAmigo,IDPokedexInimigo,Estado) VALUES (?,?,?)",[req.body.IDPokemonAmigo,result.insertId,req.body.Estado])

      var idnivel = 0
      if(req.body.Estado == "Ganhou"){
        idnivel = req.body.IDPokemonAmigo
      }else{
        idnivel = req.body.IDPokemonInimigo
      }

      sql.query("UPDATE pokenivel SET Nivel = ?, NivelXP = ? WHERE IDPokedex = ?",[req.body.Nivel,req.body.NivelXP,idnivel])
      sql.query("UPDATE pokedex SET PokeVida = ? WHERE IDPokedex = ?", [req.body.Vida,idnivel])

      res.json([{Response: "Done"}]);
    }
  })
})

module.exports = routes;
